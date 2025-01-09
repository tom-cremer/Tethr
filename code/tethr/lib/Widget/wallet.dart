import 'package:flutter/material.dart';
import 'package:tethr/Screen/Form/Login/user_profile_screen.dart';
import 'package:tethr/Styles/card_styles.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Widget/card_background.dart';

class Wallet extends StatelessWidget {
  final Map<String, dynamic> userData;
  final List<Map<String, dynamic>> purchaseData;
  final List<Map<String, dynamic>> rewardsData;
  final bool isCurrentUser;

  const Wallet({
    super.key,
    required this.userData,
    required this.purchaseData,
    required this.rewardsData,
    this.isCurrentUser = false,
  });

  @override
  Widget build(BuildContext context) {
    final gradient = GradientStyles.getGradient(userData['activeItems']['iconDecoration']); // Determine the gradient based on `iconDecoration`.

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserProfileScreen(
              userData: userData,
              purchaseData: purchaseData,
              rewardsData: rewardsData,
              isCurrentUser: isCurrentUser,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(7),
          boxShadow: const [
            BoxShadow(
              color: Color(0x18000000),
              blurRadius: 8,
              offset: Offset(4, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            CardWidget(
              gradient: gradient,
              width: kSmallCardWidth,
              height: kSmallCardHeight,
              radius: kSmallCardRadius,
              iconSize: kSmallCardIconSize,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                userData['username'] ?? 'Oups! No username found',
                style: const TextStyle(
                  color: Color(0xFF3D3D3D),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
