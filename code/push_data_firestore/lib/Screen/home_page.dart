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

  /// Delete all collections in Firestore.
  Future<void> deleteAllData() async {
    final firestore = FirebaseFirestore.instance;

    await firestore.collection('users').get().then((snapshot) {
      for (var doc in snapshot.docs) {
        doc.reference.delete();
      }
    });

    await firestore.collection('rewards').get().then((snapshot) {
      for (var doc in snapshot.docs) {
        doc.reference.delete();
      }
    });

    await firestore.collection('shop').get().then((snapshot) {
      for (var doc in snapshot.docs) {
        doc.reference.delete();
      }
    });

    setState(() {
      _description.insert(0, "All data deleted!");
    });
  }

  /// Populate Firestore with test data.
  Future<void> populateFirestore() async {
    await populateShop();
    await populateRewards();
    await authenticateAndCreateUsers();

    setState(() {
      _description.insert(0, "All data successfully pushed!");
    });
  }

  /// Populate shop collection using DTOs.
  Future<void> populateShop() async {
    for (final item in shopItems) {
      await shopRef.doc(item.id).set(item);
      setState(() {
        _description.insert(0, "Shop item ${item.name} added!");
      });
    }
  }

  /// Populate rewards collection using DTOs.
  Future<void> populateRewards() async {
    for (final reward in rewards) {
      await rewardsRef.doc(reward.id).set(reward);
      setState(() {
        _description.insert(0, "Reward ${reward.name} added!");
      });
    }
  }

  /// Authenticate and create users in Firestore using DTOs.
  Future<void> authenticateAndCreateUsers() async {
    Map<String, User> userMap = {}; // Map to store user data by UID.

    for (var user in users) {
      try {
        final authResult =
        await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email,
          password: "123456789",
        );

        final uid = authResult.user?.uid;

        if (uid != null) {
          final newUser = User(
            uid: uid,
            firstName: user.firstName,
            lastName: user.lastName,
            email: user.email,
            username: user.username,
            links: user.links,
            starPoints: user.starPoints,
            activeItems: user.activeItems,
          );

          // Save the user with UID to Firestore.
          await usersRef.doc(uid).set(newUser);

          // Assign initial rewards and purchases.
          await assignInitialRewardsAndPurchases(uid);

          // Store the user in the map for use in followers.
          userMap[uid] = newUser;

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
    await addFollowersWithDetails(userMap);
  }

  /// Assign random rewards and purchases to a user.
  Future<void> assignInitialRewardsAndPurchases(String userId) async {
    final Random random = Random();

    // Add a random number of rewards.
    final userRewardsCollection = usersRef.doc(userId).rewards;
    final rewardCount =
        random.nextInt(rewards.length) + 1; // 1 to rewards.length
    final shuffledRewards = List.of(rewards)..shuffle(random);
    final selectedRewards = shuffledRewards.take(rewardCount);

    for (var reward in selectedRewards) {
      final userReward = UserReward(
        rewardId: reward.id,
        name: reward.name,
        type: reward.type,
        starPoints: reward.starPoints,
        earnedAt: Timestamp.now(),
      );

      await userRewardsCollection.doc(reward.id).set(userReward);
      setState(() {
        _description.insert(
            0, "Added random reward ${reward.name} to user $userId");
      });
    }

    // Add a random number of purchases.
    final userPurchasesCollection = usersRef.doc(userId).purchases;
    final purchaseCount =
        random.nextInt(shopItems.length) + 1; // 1 to shopItems.length
    final shuffledShopItems = List.of(shopItems)..shuffle(random);
    final selectedShopItems = shuffledShopItems.take(purchaseCount);

    for (var item in selectedShopItems) {
      final userPurchase = UserPurchase(
        itemId: item.id,
        name: item.name,
        type: item.type,
        icon: item.icon,
        purchasedAt: Timestamp.now(),
      );

      await userPurchasesCollection.doc(item.id).set(userPurchase);
      setState(() {
        _description.insert(
            0, "Added random purchase ${item.name} to user $userId");
      });
    }
  }

  /// Add followers to each user.
  Future<void> addFollowersWithDetails(Map<String, User> userMap) async {
    final userUids = userMap.keys.toList();

    for (var uid in userUids) {
      final followersCollection = usersRef.doc(uid).followers;

      // Select a random number of followers.
      final followerCount = _random.nextInt(userUids.length - 1) + 1;

      // Shuffle and pick random followers.
      final List<String> randomFollowers = List<String>.from(userUids)
        ..remove(uid)
        ..shuffle();

      for (var i = 0; i < followerCount; i++) {
        final followerUid = randomFollowers[i];
        final followerData = userMap[followerUid];

        if (followerData != null) {
          await followersCollection.doc(followerUid).set(followerData);
          setState(() {
            _description.insert(
                0, "Added follower ${followerData.email} to user $uid");
          });
        }
      }
    }
  }
}
