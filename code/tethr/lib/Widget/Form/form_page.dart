import 'package:flutter/material.dart';
import 'package:tethr/Widget/button.dart';

class FormPage extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final String buttonText;
  final VoidCallback? onButtonPressed;

  const FormPage({
    super.key,
    required this.title,
    required this.children,
    required this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ...children,
            const SizedBox(height: 20),
            Button(
              label: buttonText,
              onTap: onButtonPressed,
            ),
          ],
        ),
      ),
    );
  }
}
