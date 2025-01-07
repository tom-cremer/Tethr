import 'package:flutter/material.dart';
import 'package:tethr/Screen/Form/Login/login_screen.dart';
import 'package:tethr/Screen/Layouts/page_layout.dart';
import 'package:tethr/Widget/button.dart';
import 'package:tethr/Screen/on_boarding1.dart';
import 'package:tethr/Styles/spacings.dart';
import 'package:tethr/Styles/colors.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: PageLayout(
          showBackButton: false,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            const Text(
              'Welcome to Tethr',
              style: TextStyle(
                  color: kBlackText,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  fontFamily: 'Lexend'),
            ),
            const SizedBox(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: kWelcomePadding),
              child: SizedBox(
                width: 250,
                child: Text(
                  'Share your links around the world in an instant !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kBlackText,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Lexend'),
                ),
              ),
            ),
            Expanded(child: Container()),
            Button(
              label: 'Let\'s Start',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const OnBoarding1(),
                  ),
                );
              },
            ),
            TextButton(onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen()),
              );
            }, child: const Text('Already have an account? Login'),),

          ],
        ),
      ),
    ));
  }
}
