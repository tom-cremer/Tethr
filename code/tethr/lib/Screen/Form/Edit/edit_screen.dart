import 'package:flutter/material.dart';
import 'package:tethr/Helpers/firestore_helper.dart';
import 'package:tethr/Styles/card_styles.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Styles/texts.dart';
import 'package:tethr/Widget/Form/custom_input_field.dart';
import 'package:tethr/Widget/button.dart';
import 'package:dto/models.dart' as dto;
import 'package:tethr/Widget/card_background.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  dto.User? user;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  List<dto.UserPurchase>? _purchaseItems;
  String backgroundDecoration = '';
  String newBanner = '';
  String iconDecoration = '';
  String nameTag = '';

  bool isLoading = true;

  Future<void> _fetchUserData() async {
    try {
      final user = await FirestoreHelper.getUserData();
      final purchaseItems = await FirestoreHelper.getUserPurchases();

      setState(() {
        this.user = user;
        this._purchaseItems = purchaseItems;
        isLoading = false;
      });

      if (this.user != null) {
        _firstNameController.text = this.user!.firstName;
        _lastNameController.text = this.user!.lastName;
        _usernameController.text = this.user!.username;
        backgroundDecoration = this.user!.activeItems.backgroundDecoration!;
        newBanner = this.user!.activeItems.banner!;
        iconDecoration = this.user!.activeItems.iconDecoration!;
        nameTag = this.user!.activeItems.nameTag!;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: true,
          backgroundColor: kGrayLight,
          content: Text(kErrorFetchUser),
        ),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: isLoading
          ? CircularProgressIndicator(color: kYellow)
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    CustomInputField(
                      label: 'First Name',
                      hintText: 'Enter your first name',
                      controller: _firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomInputField(
                      label: 'Last Name',
                      hintText: 'Enter your last name',
                      controller: _lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomInputField(
                      label: 'Username',
                      hintText: 'Enter your username',
                      controller: _usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Card Style',
                          style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lexend',
                          )),
                    ),
                    if (_purchaseItems != null && _purchaseItems!.isNotEmpty)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: _purchaseItems!.map((purchase) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    newBanner = purchase.itemId;
                                  });
                                },
                                child: newBanner == purchase.itemId
                                    ? Center(
                                        child: Stack(
                                          children: [
                                            CardWidget(
                                              gradient:
                                                  GradientStyles.getGradient(
                                                      purchase.itemId),
                                              width: kMediumCardWidth,
                                              height: kMediumCardHeight,
                                              radius: kMediumCardRadius,
                                              iconSize: kMediumCardIconSize,
                                            ),
                                            Container(
                                              width: kMediumCardWidth,
                                              height: kMediumCardHeight,
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                border: Border.all(
                                                  color: kGreen,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        kMediumCardRadius),
                                              ),
                                              child: Icon(
                                                Icons
                                                    .check_circle_outline_rounded,
                                                color: kGreen,
                                                size: 40,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : CardWidget(
                                        gradient: GradientStyles.getGradient(
                                            purchase.itemId),
                                        width: kMediumCardWidth,
                                        height: kMediumCardHeight,
                                        radius: kMediumCardRadius,
                                        iconSize: kMediumCardIconSize,
                                      ),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    else
                      const Center(child: Text('No purchase items available.')),
                    const SizedBox(height: 20),
                    Button(
                      label: 'Save',
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            await FirestoreHelper.updateUserData(
                              dto.User(
                                uid: user!.uid,
                                firstName: _firstNameController.text.trim(),
                                lastName: _lastNameController.text.trim(),
                                username: _usernameController.text.trim(),
                                email: user!.email,
                                links: user?.links,
                                starPoints: user!.starPoints,
                                activeItems: dto.ActiveItems(
                                  backgroundDecoration: backgroundDecoration
                                          .isEmpty
                                      ? user?.activeItems.backgroundDecoration
                                      : backgroundDecoration,
                                  banner: newBanner.isEmpty
                                      ? user?.activeItems.banner
                                      : newBanner,
                                  iconDecoration: iconDecoration.isEmpty
                                      ? user?.activeItems.iconDecoration
                                      : iconDecoration,
                                  nameTag: nameTag.isEmpty
                                      ? user?.activeItems.nameTag
                                      : nameTag,
                                ),
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                showCloseIcon: true,
                                backgroundColor: kGrayLight,
                                content: Text(kProfileUpdatedSuccess),
                              ),
                            );
                            try {
                              await FirestoreHelper.updateFollowers();
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Oops: $e'),
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Oops! $e'),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
