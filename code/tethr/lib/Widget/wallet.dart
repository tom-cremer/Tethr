import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tethr/Helpers/firestore_helper.dart';
import 'package:tethr/Screen/Form/Login/user_profile_screen.dart';
import 'package:tethr/Styles/card_styles.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Widget/card_background.dart';
import 'package:dto/models.dart' as dto;

class Wallet extends StatefulWidget {
  final String uid;

  Wallet({
    super.key,
    required this.uid,
  });

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  dto.User? userData;

  Future<void> _fetchUserData() async {
    try {
      final userData = await FirestoreHelper.getUserDataByUid(widget.uid);
      if (userData == null) {
        throw Exception('User document not found in Firestore.');
      }

      setState(() {
        this.userData = userData;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching user data: $e')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    final gradient = GradientStyles.getGradient(
        userData?.activeItems.banner);

    return GestureDetector(
      onTap: () {
        context.go('/profile/${widget.uid}');
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
                userData?.username ?? "Loading...",
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
