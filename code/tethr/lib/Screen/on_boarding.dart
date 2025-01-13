import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:tethr/Screen/Form/Login/login_screen.dart';
import 'package:tethr/Screen/Form/Register/register_screen.dart';
import 'package:tethr/Screen/Layouts/page_layout.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Widget/button.dart';
import 'package:tethr/Widget/logo_onboarding.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to the next screen after the last onboarding page
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        ),
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageLayout(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                _buildPage(
                  context,
                  'Add your links!',
                  'assets/gifs/add.gif',
                ),
                _buildPage(
                  context,
                  'Share it!',
                  'assets/gifs/share.gif',
                ),
                _buildPage(
                  context,
                  'Get seen by others!',
                  'assets/gifs/views.gif',
                ),
              ],
            ),
          ),
          Positioned(
            top: 25,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                _previousPage();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(BuildContext context, String subtitle, String gifPath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        LogoOnboarding(
          subtitle: subtitle,
        ),
        Expanded(

          child: GifView.asset(
            gifPath,
            height: 200,
            width: 200,
            frameRate: 50,
            color: Colors.black,
            colorBlendMode: BlendMode.dstIn,
            fadeDuration: const Duration(milliseconds: 300),
          ),
        ),
        Button(
          label: 'Next',
          onTap: _nextPage,
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const RegisterScreen()),
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                  fontSize: 14,
                  color: kGray,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lexend'),
            )),
      ],
    );
  }
}
