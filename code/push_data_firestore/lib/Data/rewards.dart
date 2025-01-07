import 'package:dto/models.dart';

const List<Reward> rewards = [
  Reward(
    id: "first_login",
    name: "First Login",
    type: "achievement",
    description: "Earned for logging in for the first time.",
    starPoints: 50,
  ),
  Reward(
    id: "profile_completed",
    name: "Profile Completed",
    type: "achievement",
    description: "Earned for completing your profile.",
    starPoints: 100,
  ),
  Reward(
    id: "first_purchase",
    name: "First Purchase",
    type: "milestone",
    description: "Earned for making your first shop purchase.",
    starPoints: 75,
  ),
];
