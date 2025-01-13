import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tethr/Screen/Form/Login/login_screen.dart';
import 'package:tethr/Screen/Form/Register/register_complete.dart';
import 'package:tethr/Screen/Layouts/page_layout.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Widget/Form/custom_input_field.dart';
import 'package:tethr/Widget/button.dart';
import 'package:tethr/Widget/logo_onboarding.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _showPersonalInfo = true;

  Future<void> _registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      // Register user logic
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      final User? user = userCredential.user;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'firstName': _firstNameController.text.trim(),
          'lastName': _lastNameController.text.trim(),
          'username': _usernameController.text.trim(),
          'email': user.email,
          'links': [],
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              showCloseIcon: true, content: Text('Registration successful!')),
        );

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => RegisterComplete()),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Oops! Something went wrong. Please try again.😣';
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email.😣';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password. Please try again.😣';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email address.😣';
          break;
        default:
          errorMessage = 'Oops! ${e.message}';
          break;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            showCloseIcon: true,
            backgroundColor: kGrayLight,
            content: Text(errorMessage)),
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
        child: LayoutBuilder(builder: (context, constraints) {
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
                      subtitle: 'Add your links!',
                    ),
                    Column(
                      children: [
                        const Text(
                          "Register",
                          style: TextStyle(
                            color: kBlackText,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 20),
                        if (_showPersonalInfo) ...[
                          CustomInputField(
                            label: "First Name",
                            hintText: "Enter your first name",
                            controller: _firstNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'First name is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInputField(
                            label: "Last Name",
                            hintText: "Enter your last name",
                            controller: _lastNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Last name is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInputField(
                            label: "Username",
                            hintText: "Enter your username",
                            controller: _usernameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Username is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          Button(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() => _showPersonalInfo = false);
                              }
                            },
                            label: 'Next',
                          ),
                        ] else ...[
                          CustomInputField(
                            label: "Email",
                            hintText: "Enter your email",
                            controller: _emailController,
                            isEmail: true,
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
                              if (value.contains(RegExp('A-Z'))) {
                                return 'Password must contain at least one uppercase letter';
                              }
                              if (value.contains(RegExp('a-z'))) {
                                return 'Password must contain at least one lowercase letter';
                              }
                              if (value.contains(RegExp(r'[0-9]'))) {
                                return 'Password must contain at least one number';
                              }
                              if (value.contains(
                                  RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                                return 'Password must contain at least one special character';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          _isLoading
                              ? const CircularProgressIndicator()
                              : Button(
                                  onTap: _registerUser,
                                  label: 'Register',
                                ),
                        ],
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Already have an account? Login!',
                        style: TextStyle(
                            fontSize: 14,
                            color: kGray,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lexend'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
