import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

const firestoreSerializable = JsonSerializable(
  converters: firestoreJsonConverters,
  explicitToJson: true,
  createFieldMap: true,
  createPerFieldToJson: true,
);

/// User details stored in the global `users` collection.
@firestoreSerializable
class User {
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final List<String>? links;
  final int starPoints;
  final ActiveItems activeItems;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    this.links,
    this.starPoints = 0,
    this.activeItems = const ActiveItems(),
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}

/// Customization details for active user items.
@JsonSerializable()
class ActiveItems {
  final String? banner;
  final String? iconDecoration;
  final String? backgroundDecoration;
  final String? nameTag;

  const ActiveItems({
    this.banner,
    this.iconDecoration,
    this.backgroundDecoration,
    this.nameTag,
  });

  factory ActiveItems.fromJson(Map<String, dynamic> json) => _$ActiveItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ActiveItemsToJson(this);

}

/// Follower data stored in the `followers` sub-collection of each user.
@firestoreSerializable
class Follow {
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final List<String>? links;
  final ActiveItems activeItems;

  const Follow({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    this.links,
    this.activeItems = const ActiveItems(),
  });

  factory Follow.fromJson(Map<String, dynamic> json) => _$FollowFromJson(json);
  Map<String, dynamic> toJson() => _$FollowToJson(this);
}

/// Reward details stored in the global `rewards` collection.
@firestoreSerializable
class Reward {
  final String id;
  final String name;
  final String type;
  final String description;
  final int starPoints;

  const Reward({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.starPoints,
  });

  factory Reward.fromJson(Map<String, dynamic> json) => _$RewardFromJson(json);
  Map<String, dynamic> toJson() => _$RewardToJson(this);
}

/// User-specific reward details stored in `users/{userId}/rewards`.
@firestoreSerializable
class UserReward {
  final String rewardId;
  final String name;
  final String type;
  final int starPoints;
  final Timestamp earnedAt;

  const UserReward({
    required this.rewardId,
    required this.name,
    required this.type,
    required this.starPoints,
    required this.earnedAt,
  });

  factory UserReward.fromJson(Map<String, dynamic> json) => _$UserRewardFromJson(json);
  Map<String, dynamic> toJson() => _$UserRewardToJson(this);
}

/// Item details stored in the global `shop` collection.
@firestoreSerializable
class ShopItem {
  final String id;
  final String name;
  final String type; //"banner", "iconDecoration", "backgroundDecoration", "nameTag"
  final String description;
  final int cost;
  final String icon;

  const ShopItem({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.cost,
    required this.icon,
  });

  factory ShopItem.fromJson(Map<String, dynamic> json) => _$ShopItemFromJson(json);
  Map<String, dynamic> toJson() => _$ShopItemToJson(this);
}

/// User-specific purchased item stored in `users/{userId}/purchases`.
@firestoreSerializable
class UserPurchase {
  final String itemId;
  final String name;
  final String type; // "banner", "iconDecoration", "backgroundDecoration", "nameTag"
  final String icon;
  final Timestamp purchasedAt;

  const UserPurchase({
    required this.itemId,
    required this.name,
    required this.type,
    required this.icon,
    required this.purchasedAt,
  });

  factory UserPurchase.fromJson(Map<String, dynamic> json) => _$UserPurchaseFromJson(json);
  Map<String, dynamic> toJson() => _$UserPurchaseToJson(this);
}

@Collection<User>('users', prefix: 'Users')
@Collection<User>('users/*/followers', prefix: 'Followers')
@Collection<UserReward>('users/*/rewards', prefix: 'UserRewards')
@Collection<UserPurchase>('users/*/purchases', prefix: 'UserPurchases')
final usersRef = UsersCollectionReference();

@Collection<Reward>('rewards', prefix: 'Rewards')
final rewardsRef = RewardsCollectionReference();

@Collection<ShopItem>('shop', prefix: 'Shop')
final shopRef = ShopCollectionReference();

