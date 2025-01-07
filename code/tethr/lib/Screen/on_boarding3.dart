import 'package:flutter/material.dart';
import 'package:tethr/Screen/Form/Register/register_screen.dart';
import 'package:tethr/Screen/Layouts/page_layout.dart';

import 'package:tethr/Widget/button.dart';
import 'package:tethr/Widget/logo_onboarding.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageLayout(
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
                subtitle: 'Get seen by others',
              ),
              Expanded(child: Container()),
              Button(
                label: 'Next',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
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
