import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:tethr/Screen/Form/Login/home_screen.dart';
import 'package:tethr/Screen/Layouts/page_layout.dart';
import 'package:tethr/Widget/button.dart';
import 'package:tethr/Widget/logo_onboarding.dart';

class RegisterComplete extends StatelessWidget {
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              const LogoOnboarding(
                subtitle: 'You\'re all set!',
              ),
              Expanded(

                child: GifView.asset(
                  'assets/gifs/yay.gif',
                  height: 200,
                  width: 200,
                  frameRate: 50,
                  color: Colors.black,
                  colorBlendMode: BlendMode.dstIn,
                  fadeDuration: const Duration(milliseconds: 300),
                ),
              ),
              Button(
                label: 'Let\'s Go',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );

  }
}
