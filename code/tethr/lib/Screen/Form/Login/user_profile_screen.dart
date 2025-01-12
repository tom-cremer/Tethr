import 'package:dto/models.dart' as dto;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tethr/Helpers/firestore_helper.dart';
import 'package:tethr/Helpers/qrHelpers.dart';
import 'package:tethr/Styles/card_styles.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Widget/button.dart';
import 'package:tethr/Widget/card_stack.dart';
import 'package:tethr/Widget/show_wallet_dialog.dart';
import 'package:tethr/Widget/tiny_button.dart';
import 'package:tethr/Widget/wallet.dart';
import 'package:tethr/custom_icons_icons.dart';
import 'package:tethr/main.dart';

class UserProfileScreen extends StatefulWidget {
  final String? uid;

  const UserProfileScreen({super.key, this.uid});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with TickerProviderStateMixin {
  dto.User? userData;
  bool _isCurrentUser = false;
  bool _isLoading = true;

  bool _showOverlay = false;
  double _dragPosition = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _showOverlay = true;
      });
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  Future<void> _fetchUserData() async {
    try {
      final userData = await FirestoreHelper.getUserDataByUid(widget.uid);
      if (userData == null) {
        throw Exception('User document not found in Firestore.');
      }

      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null && currentUser.uid == widget.uid) {
        _isCurrentUser = true;
      }

      setState(() {
        this.userData = userData;
        _isLoading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(showCloseIcon: true,
            backgroundColor: kGrayLight,
            content: Text('Oups! Couldn\'t fetch user data 😶')),
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  String? scannedData;
  bool isScanning = false;

  @override
  Widget build(BuildContext context) {
    final gradient = GradientStyles.getGradient(userData?.activeItems.banner);
    if (_isLoading) {
      return const Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          color: kYellow,
        )),
      );
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (_isCurrentUser)
            IconButton(
              icon: const Icon(CustomIcons.edit),
              onPressed: () {
                // Navigate to Edit Profile screen
              },
            ),
          IconButton(
            icon: const Icon(CustomIcons.settings),
            onPressed: () {
              // Navigate to Settings screen
            },
          ),
        ],
        leading: _isCurrentUser
            ? IconButton(
                icon: const Icon(CustomIcons.medalstar),
                onPressed: () {
                  // Navigate to Rewards screen
                },
              )
            : null,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Center(
                child: CardStack(
                  uid: widget.uid,
                ),
              ),
              const SizedBox(height: 25),
              GestureDetector(
                onVerticalDragUpdate: (details) {
                  setState(() {
                    // Track vertical drag and update the position
                    _dragPosition += details.primaryDelta!;
                  });
                },
                onVerticalDragEnd: (details) {
                  // If the drag exceeds a certain threshold, go back to the previous screen
                  if (_dragPosition > 200) {
                    Navigator.pop(context); // Go back to the previous screen
                  } else {
                    // Otherwise, animate back to the original position
                    _animationController.forward(
                        from: 0); // Reset animation to 0
                    setState(() {
                      _dragPosition = 0; // Reset the drag position
                    });
                  }
                },
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        top: _showOverlay
                            ? (_dragPosition < 0 ? 0 : _dragPosition)
                            : MediaQuery.of(context).size.height,
                      ),
                      // Use the full screen height for the overlay
                      height: MediaQuery.of(context).size.height -
                          AppBar().preferredSize.height -
                          kLargeCardHeight -
                          25,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              width: 40,
                              height: 4,
                              decoration: BoxDecoration(
                                gradient: gradient,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 230,
                                  width: 230,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: isScanning
                                      ? Expanded(
                                          child: QRCodeDartScanView(
                                            scanInvertedQRCode: true,
                                            onCapture: (data) async {
                                              final decodedData = QrHelpers.decodeQRCodeData(data.text);
                                              if (decodedData == null) {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                      showCloseIcon: true,
                                                      backgroundColor: kGrayLight,
                                                      content: Text('Oups! This Qr Code is not valid 🤨')),
                                                );
                                                return;
                                              }
                                              final userExists = await FirestoreHelper.checkUserExist(decodedData);
                                              if (userExists) {
                                                setState(() {
                                                  scannedData = decodedData;
                                                  isScanning = false;
                                                });
                                                if (decodedData == widget.uid) {
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      showCloseIcon: true,
                                                      backgroundColor: kGrayLight,
                                                      content: Text('Nice Try! But you cannot scan own QR code 😆'),
                                                    ),
                                                  );
                                                  return;
                                                }
                                                _showWalletDialog(decodedData);
                                              } else {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                      showCloseIcon: true,
                                                      backgroundColor: kGrayLight,
                                                      content: Text('Oups! Unfortunatly this user does not exist 😔')),
                                                );
                                              }
                                            },
                                          ),
                                        )
                                      : QrImageView(
                                          data: QrHelpers.encodeQRCodeData(widget.uid),
                                          eyeStyle: QrEyeStyle(
                                            eyeShape: QrEyeShape.square,
                                            color: gradient.colors[1],
                                          ),
                                          dataModuleStyle: QrDataModuleStyle(
                                            dataModuleShape:
                                                QrDataModuleShape.square,
                                            color: gradient.colors[1],
                                          ),
                                          version: QrVersions.auto,
                                          size: 200),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      if (!_isCurrentUser)
                                        TinyButton(
                                            icon: CustomIcons.heart,
                                            label: 'Follow',
                                            containerColor: kBlue),
                                      Container(
                                        height: 50,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: kGreen,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              // Activate the scanner
                                              if (isScanning) {
                                                setState(() {
                                                  isScanning = false;
                                                });
                                              } else {
                                                setState(() {
                                                  isScanning = true;
                                                });
                                              }
                                            },
                                            icon: const Icon(
                                                CustomIcons.scanqrcode),
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: kPurple,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              // Activate the NFC
                                            },
                                            icon: const Icon(CustomIcons.nfc),
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showWalletDialog(String uid) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ShowWalletDialog(uid: uid);
      },
    );
  }
}
