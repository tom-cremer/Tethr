import 'package:flutter/material.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Styles/spacings.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController? controller;
  final String? initialValue;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const CustomInputField({
    required this.label,
    required this.hintText,
    this.controller,
    this.initialValue,
    this.isEmail = false,
    this.isPassword = false,
    this.validator,
    this.onSaved,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kMarginDefault,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            onSaved: onSaved,
            controller: controller ?? TextEditingController(text: initialValue),
            obscureText: isPassword,
            validator: validator,
            keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14.0,
                horizontal: 16.0,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.grey, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: kYellow, width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.red, width: 2.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
