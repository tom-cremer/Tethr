import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tethr/styles/spacings.dart';
import 'package:tethr/Data/users.dart';
import 'package:tethr/Data/shop.dart';
import 'package:tethr/Data/rewards.dart';
import 'package:dto/models.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _description = [];
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Center(
          child: SizedBox(
            height: 300,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _description.map((e) => Text(e)).toList(),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton.extended(
              onPressed: deleteAllData,
              label: const Row(
                children: [
                  Icon(Icons.delete_forever),
                  SizedBox(width: kHorizontalPaddingS),
                  Text("Delete All Data"),
                ],
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () async {
                await populateFirestore();
              },
              label: const Row(
                children: [
                  Icon(Icons.published_with_changes),
                  SizedBox(width: kHorizontalPaddingS),
                  Text("Push Data"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteAllData() async {
    final firestore = FirebaseFirestore.instance;

    // Delete users collection.
    final usersSnapshot = await firestore.collection('users').get();
    for (var doc in usersSnapshot.docs) {
      doc.reference.delete();
    }

    // Delete rewards collection.
    final rewardsSnapshot = await firestore.collection('rewards').get();
    for (var doc in rewardsSnapshot.docs) {
      doc.reference.delete();
    }

    // Delete shop collection.
    final shopSnapshot = await firestore.collection('shop').get();
    for (var doc in shopSnapshot.docs) {
      doc.reference.delete();
    }

    setState(() {
      _description.insert(0, "All data deleted!");
    });
  }

  Future<void> populateFirestore() async {
    await populateShop();
    await populateRewards();
    await authenticateAndCreateUsers();
    setState(() {
      _description.insert(0, "All data successfully pushed!");
    });
  }

  Future<void> populateShop() async {
    final firestore = FirebaseFirestore.instance.collection('shop');
    for (final item in shopItems) {
      await firestore.doc(item.id).set({
        'id': item.id,
        'name': item.name,
        'type': item.type,
        'description': item.description,
        'cost': item.cost,
        'icon': item.icon,
      });
      setState(() {
        _description.insert(0, "Shop item ${item.name} added!");
      });
    }
  }

  Future<void> populateRewards() async {
    final firestore = FirebaseFirestore.instance.collection('rewards');
    for (final reward in rewards) {
      await firestore.doc(reward.id).set({
        'id': reward.id,
        'name': reward.name,
        'type': reward.type,
        'description': reward.description,
        'starPoints': reward.starPoints,
      });
      setState(() {
        _description.insert(0, "Reward ${reward.name} added!");
      });
    }
  }

  Future<void> authenticateAndCreateUsers() async {
    Map<String, Map<String, dynamic>> userDataMap =
        {}; // Map to store user data.

    for (var user in users) {
      try {
        final authResult =
            await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email,
          password: "123456789",
        );

        final uid = authResult.user?.uid;
        if (uid != null) {
          final userDoc =
              FirebaseFirestore.instance.collection('users').doc(uid);

          final userData = {
            'firstName': user.firstName,
            'lastName': user.lastName,
            'email': user.email,
            'username': user.username,
            'links': user.links,
            'starPoints': user.starPoints,
            'activeItems': user.activeItems.toJson(),
          };

          await userDoc.set(userData);

          // Assign initial rewards and purchases.
          await assignInitialRewardsAndPurchases(uid);

          // Store user data for later use in followers collection.
          userDataMap[uid] = userData;

          setState(() {
            _description.insert(0, "User ${user.email} created with UID $uid");
          });
        }
      } on auth.FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          setState(() {
            _description.insert(0, "User ${user.email} already exists.");
          });
        }
      }
    }

    // Add followers sub-collection.
    await addFollowersWithDetails(userDataMap);
  }

  Future<void> assignInitialRewardsAndPurchases(String userId) async {
    // Add rewards.
    final rewardsToAssign = ["first_login", "first_purchase"];
    for (final rewardId in rewardsToAssign) {
      final reward = rewards.firstWhere((r) => r.id == rewardId);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('rewards')
          .doc(reward.id)
          .set({
        'id': reward.id,
        'name': reward.name,
        'type': reward.type,
        'starPoints': reward.starPoints,
        'earnedAt': FieldValue.serverTimestamp(),
      });
    }

    // Add purchases.
    final purchasesToAssign = ["blue_card", "orange_card"];
    for (final itemId in purchasesToAssign) {
      final item = shopItems.firstWhere((i) => i.id == itemId);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('purchases')
          .doc(item.id)
          .set({
        'id': item.id,
        'name': item.name,
        'type': item.type,
        'icon': item.icon,
        'purchasedAt': FieldValue.serverTimestamp(),
      });
    }
  }

  Future<void> addFollowersWithDetails(
      Map<String, Map<String, dynamic>> userDataMap) async {
    final userUids = userDataMap.keys.toList();

    for (var uid in userUids) {
      final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);
      final followersCollection = userDoc.collection('followers');

      // Select a random number of followers.
      final followerCount = _random.nextInt(userUids.length - 1) + 1;

      // Shuffle and pick random followers.
      final List<String> randomFollowers = List<String>.from(userUids)
        ..remove(uid)
        ..shuffle();

      for (var i = 0; i < followerCount; i++) {
        final followerUid = randomFollowers[i];
        final followerData = userDataMap[followerUid];

        if (followerData != null) {
          await followersCollection.doc(followerUid).set({
            ...followerData,
            'timestamp': FieldValue.serverTimestamp(),
          });

          setState(() {
            _description.insert(
                0, "Added follower ${followerData['email']} to user ${uid}");
          });
        }
      }
    }
  }
}
