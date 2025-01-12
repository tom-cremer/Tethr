import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:dto/models.dart' as dto;

class FirestoreHelper {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// References
  static final CollectionReference<dto.User> usersRef =
  _firestore.collection('users').withConverter<dto.User>(
    fromFirestore: (snapshot, _) => dto.User.fromJson(snapshot.data()!),
    toFirestore: (user, _) => user.toJson(),
  );

  static final CollectionReference<dto.ShopItem> shopRef =
  _firestore.collection('shop').withConverter<dto.ShopItem>(
    fromFirestore: (snapshot, _) =>
        dto.ShopItem.fromJson(snapshot.data()!),
    toFirestore: (item, _) => item.toJson(),
  );

  static final CollectionReference<dto.Reward> rewardsRef =
  _firestore.collection('rewards').withConverter<dto.Reward>(
    fromFirestore: (snapshot, _) =>
        dto.Reward.fromJson(snapshot.data()!),
    toFirestore: (reward, _) => reward.toJson(),
  );

  /// Get logged-in user's data as a `User` DTO.
  static Future<dto.User?> getUserData() async {
    final auth.User? authUser = auth.FirebaseAuth.instance.currentUser;
    if (authUser == null) {
      throw Exception('No user is currently logged in.');
    }

    final userDoc = await usersRef.doc(authUser.uid).get();
    return userDoc.data();
  }

  /// Create a new user in Firestore.
  static Future<void> createUser(String uid, dto.User newUser) async {
    await usersRef.doc(uid).set(newUser);
  }

  /// Get user data by UID as a `User` DTO.
  static Future<dto.User?> getUserDataByUid(String? uid) async {
    final userDoc = await usersRef.doc(uid).get();
    return userDoc.data();
  }

  /// Get logged-in user's followers as a list of `Follow` DTOs.
  static Future<List<dto.Follow>> getUserFollowers() async {
    final auth.User? authUser = auth.FirebaseAuth.instance.currentUser;
    if (authUser == null) {
      throw Exception('No user is currently logged in.');
    }

    final followersRef = usersRef.doc(authUser.uid).collection('followers').withConverter<dto.Follow>(
      fromFirestore: (snapshot, _) => dto.Follow.fromJson(snapshot.data()!),
      toFirestore: (follow, _) => follow.toJson(),
    );

    final followersSnapshot = await followersRef.get();
    return followersSnapshot.docs.map((doc) => doc.data()).toList();
  }

  /// Get logged-in user's purchase history as a list of `UserPurchase` DTOs.
  static Future<List<dto.UserPurchase>> getUserPurchases() async {
    final auth.User? authUser = auth.FirebaseAuth.instance.currentUser;
    if (authUser == null) {
      throw Exception('No user is currently logged in.');
    }

    final purchasesRef = usersRef.doc(authUser.uid).collection('purchases').withConverter<dto.UserPurchase>(
      fromFirestore: (snapshot, _) =>
          dto.UserPurchase.fromJson(snapshot.data()!),
      toFirestore: (purchase, _) => purchase.toJson(),
    );

    final purchasesSnapshot = await purchasesRef.get();
    return purchasesSnapshot.docs.map((doc) => doc.data()).toList();
  }

  /// Get logged-in user's rewards history as a list of `UserReward` DTOs.
  static Future<List<dto.UserReward>> getUserRewards() async {
    final auth.User? authUser = auth.FirebaseAuth.instance.currentUser;
    if (authUser == null) {
      throw Exception('No user is currently logged in.');
    }

    final rewardsRef = usersRef.doc(authUser.uid).collection('rewards').withConverter<dto.UserReward>(
      fromFirestore: (snapshot, _) =>
          dto.UserReward.fromJson(snapshot.data()!),
      toFirestore: (reward, _) => reward.toJson(),
    );

    final rewardsSnapshot = await rewardsRef.get();
    return rewardsSnapshot.docs.map((doc) => doc.data()).toList();
  }

  /// Update logged-in user's data.
  static Future<void> updateUserData(dto.User updatedUser) async {
    final auth.User? authUser = auth.FirebaseAuth.instance.currentUser;
    if (authUser == null) {
      throw Exception('No user is currently logged in.');
    }

    await usersRef.doc(authUser.uid).set(updatedUser);
  }

  /// Fetch all shop items as a list of `ShopItem` DTOs.
  static Future<List<dto.ShopItem>> getShopItems() async {
    final shopSnapshot = await shopRef.get();
    return shopSnapshot.docs.map((doc) => doc.data()).toList();
  }

  /// Fetch all rewards as a list of `Reward` DTOs.
  static Future<List<dto.Reward>> getAllRewards() async {
    final rewardsSnapshot = await rewardsRef.get();
    return rewardsSnapshot.docs.map((doc) => doc.data()).toList();
  }

  /// Remove the purchased items from the shop items list. (Logged-in user)
  static Future<List<dto.ShopItem>> removePurchasedItems() async{
    final shopItems = await getShopItems();
    final purchaseData = await getUserPurchases();
    for (final purchase in purchaseData) {
      shopItems.removeWhere((item) => item.id == purchase.itemId);
    }
    return shopItems;
  }

  /// Purchase an item for the logged-in user.
  static Future<void> purchaseItem(String itemId) async {
    final auth.User? authUser = auth.FirebaseAuth.instance.currentUser;
    if (authUser == null) {
      throw Exception('No user is currently logged in.');
    }

    final itemSnapshot = await shopRef.doc(itemId).get();
    if (!itemSnapshot.exists) {
      throw Exception("Item with ID $itemId does not exist in the shop.");
    }

    final dto.ShopItem item = itemSnapshot.data()!;
    final userDocRef = usersRef.doc(authUser.uid);

    await _firestore.runTransaction((transaction) async {
      final userDoc = await transaction.get(userDocRef);
      if (!userDoc.exists) {
        throw Exception("User document does not exist.");
      }

      final dto.User user = userDoc.data()!;
      if (user.starPoints < item.cost) {
        throw Exception("Insufficient star points.");
      }

      final updatedUser = dto.User(
        uid: user.uid,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        username: user.username,
        starPoints: user.starPoints - item.cost,
        links: user.links,
        activeItems: user.activeItems,
      );

      transaction.set(userDocRef, updatedUser);

      final purchaseRef = userDocRef.collection('purchases').doc(item.id).withConverter<dto.UserPurchase>(
        fromFirestore: (snapshot, _) =>
            dto.UserPurchase.fromJson(snapshot.data()!),
        toFirestore: (purchase, _) => purchase.toJson(),
      );

      transaction.set(
        purchaseRef,
        dto.UserPurchase(
          itemId: item.id,
          name: item.name,
          type: item.type,
          icon: item.icon,
          purchasedAt: Timestamp.now(),
        ),
      );
    });
  }
  
  /// Check if user exist in Firestore.
  static Future<bool> checkUserExist(String uid) async {
    final userDoc = await usersRef.doc(uid).get();
    return userDoc.exists;
  }

}
