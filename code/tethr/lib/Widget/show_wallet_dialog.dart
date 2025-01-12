import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tethr/Widget/wallet.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Widget/button.dart';
import 'package:tethr/custom_icons_icons.dart';

class ShowWalletDialog extends StatelessWidget {
  final String uid;

  const ShowWalletDialog({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(12),
      iconPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('You Scanned a New Card!',
                  style: TextStyle(
                      color: kBlackText,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontFamily: 'Lexend')),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(CustomIcons.close))
            ],
          ),
          const SizedBox(height: 10),
          IgnorePointer(child: Wallet(uid: uid)),
          const SizedBox(height: 15),
          Button(
            label: 'Go to Profile',
            verticalMargin: 10.0,
            verticalPadding: 10.0,
            horizontalMargin: 0.0,
            borderRadius: 12.0,
            color: kGreen,
            onTap: () {
              context.go('/profile/$uid');
            },
          )
        ],
      ),
    );
  }
}