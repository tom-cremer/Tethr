import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreHelper {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Get logged-in user's data.
  static Future<Map<String, dynamic>?> getUserData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in.');
    }

    final DocumentSnapshot userDoc =
    await _firestore.collection('users').doc(user.uid).get();

    if (userDoc.exists) {
      return userDoc.data() as Map<String, dynamic>;
    }
    return null;
  }

  /// Get user data by UID.
  static Future<Map<String, dynamic>?> getUserDataByUid(String uid) async {
    final DocumentSnapshot userDoc =
    await _firestore.collection('users').doc(uid).get();

    if (userDoc.exists) {
      return userDoc.data() as Map<String, dynamic>;
    }
    return null;
  }

  /// Get logged-in user's followers.
  static Future<List<Map<String, dynamic>>> getUserFollowers() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in.');
    }

    final QuerySnapshot followersSnapshot = await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('followers')
        .get();

    return followersSnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  /// Get logged-in user's purchase history.
  static Future<List<Map<String, dynamic>>> getUserPurchases() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in.');
    }

    final QuerySnapshot purchasesSnapshot = await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('purchases')
        .get();

    return purchasesSnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  /// Get logged-in user's rewards history.
  static Future<List<Map<String, dynamic>>> getUserRewards() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in.');
    }

    final QuerySnapshot rewardsSnapshot = await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('rewards')
        .get();

    return rewardsSnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  /// Update logged-in user's data.
  static Future<void> updateUserData(Map<String, dynamic> updatedData) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in.');
    }

    final DocumentReference userDocRef =
    _firestore.collection('users').doc(user.uid);

    await userDocRef.update(updatedData);
  }

  /// Update a user's data in all followers' sub-collections.
  static Future<void> updateUserInFollowers(String userUid) async {
    try {
      // Step 1: Fetch the user's latest data using the helper method.
      final DocumentSnapshot userDoc =
      await _firestore.collection('users').doc(userUid).get();

      if (!userDoc.exists) {
        throw Exception("User with UID $userUid does not exist in Firestore.");
      }

      final Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

      // Step 2: Get all users to search for the followers sub-collections.
      final QuerySnapshot usersSnapshot = await _firestore.collection('users').get();

      for (var doc in usersSnapshot.docs) {
        final CollectionReference followersCollection =
        doc.reference.collection('followers');

        final DocumentReference followerDoc = followersCollection.doc(userUid);

        // Step 3: Check if this user exists in the current followers sub-collection.
        final DocumentSnapshot followerDocSnapshot = await followerDoc.get();

        if (followerDocSnapshot.exists) {
          // Step 4: Update the user's data in the followers sub-collection.
          await followerDoc.update(userData);
        }
      }
    } catch (e) {
      throw Exception("Error updating user in followers: $e");
    }
  }

  /// Fetch all shop items.
  static Future<List<Map<String, dynamic>>> getShopItems() async {
    final QuerySnapshot shopSnapshot = await _firestore.collection('shop').get();
    return shopSnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  /// Fetch all rewards.
  static Future<List<Map<String, dynamic>>> getAllRewards() async {
    final QuerySnapshot rewardsSnapshot =
    await _firestore.collection('rewards').get();
    return rewardsSnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  /// Purchase an item for the logged-in user.
  static Future<void> purchaseItem(String itemId) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in.');
    }

    final DocumentSnapshot itemSnapshot =
    await _firestore.collection('shop').doc(itemId).get();

    if (!itemSnapshot.exists) {
      throw Exception("Item with ID $itemId does not exist in the shop.");
    }

    final itemData = itemSnapshot.data() as Map<String, dynamic>;

    final DocumentReference userDocRef =
    _firestore.collection('users').doc(user.uid);
    final DocumentReference purchaseRef =
    userDocRef.collection('purchases').doc(itemId);

    await _firestore.runTransaction((transaction) async {
      final userDoc = await transaction.get(userDocRef);

      if (!userDoc.exists) {
        throw Exception("User document does not exist.");
      }

      final currentPoints = (userDoc.data() as Map<String, dynamic>)['starPoints'] ?? 0;

      if (currentPoints < itemData['cost']) {
        throw Exception("Insufficient star points.");
      }

      // Deduct star points and save the purchase.
      transaction.update(userDocRef, {'starPoints': currentPoints - itemData['cost']});
      transaction.set(purchaseRef, {
        'id': itemId,
        ...itemData,
        'purchasedAt': FieldValue.serverTimestamp(),
      });
    });
  }
}
