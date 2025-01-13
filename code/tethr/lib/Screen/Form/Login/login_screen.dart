import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tethr/Helpers/shop_helper.dart';
import 'package:tethr/Screen/Form/Login/home_screen.dart';
import 'package:tethr/Screen/Form/Register/register_screen.dart';
import 'package:tethr/Screen/Layouts/page_layout.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Styles/texts.dart';
import 'package:tethr/Widget/Form/custom_input_field.dart';
import 'package:tethr/Widget/button.dart';
import 'package:tethr/Widget/logo_onboarding.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _loginUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          showCloseIcon: true,
          backgroundColor: kGrayLight,
          content: Text(kLoginSuccessful)));

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Oops! Something went wrong. Please try again.';
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password. Please try again.';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email address.';
          break;
        default:
          errorMessage = 'Error: ${e.message}';
          break;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageLayout(
          showBackButton: false,
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 30,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          const LogoOnboarding(
                            subtitle: 'Welcome Back!',
                          ),
                          const SizedBox(height: 40),
                          Column(
                            children: [
                              const Text(
                                "Login",
                                style: TextStyle(
                                  color: kBlackText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              const SizedBox(),
                              CustomInputField(
                                label: "Email",
                                hintText: "Enter your email",
                                controller: _emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email is required';
                                  }
                                  final emailRegex = RegExp(
                                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                  if (!emailRegex.hasMatch(value)) {
                                    return 'Enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomInputField(
                                label: "Password",
                                hintText: "Enter your password",
                                isPassword: true,
                                controller: _passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  }
                                  if (value.length < 8) {
                                    return 'Password must be at least 8 characters';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Column(
                            children: [
                              _isLoading
                                  ? const CircularProgressIndicator()
                                  : Button(
                                      onTap: _loginUser,
                                      label: 'Login',
                                    ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Don’t have an account? Register!',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: kGray,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lexend'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
