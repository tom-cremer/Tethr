import 'package:dto/models.dart' as dto;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tethr/Helpers/firestore_helper.dart';
import 'package:tethr/Screen/Form/Edit/add_links.dart';
import 'package:tethr/Screen/Form/Edit/edit_screen.dart';
import 'package:tethr/Screen/settings.dart';
import 'package:tethr/Styles/card_styles.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Styles/texts.dart';
import 'package:tethr/Widget/card_stack.dart';
import 'package:tethr/Widget/show_wallet_dialog.dart';
import 'package:tethr/Widget/tiny_button.dart';
import 'package:tethr/custom_icons_icons.dart';

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
  bool _isFollowing = false;

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

      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null && currentUser.uid == widget.uid) {
        _isCurrentUser = true;
      }

      // Check if the current user is following the profile user
      final List<dto.Follow> followers =
      await FirestoreHelper.getUserFollowers();
      _isFollowing = followers.any((follower) => follower.uid == widget.uid);

      setState(() {
        this.userData = userData;
        _isLoading = false;
      });
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
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void onReresh() async {
    setState(() {
      _isLoading = true;
    });
    await _fetchUserData();
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
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddLinks()));
                },
                icon: Icon(CustomIcons.add)),
          if (_isCurrentUser)
            IconButton(
              icon: const Icon(CustomIcons.edit),
              onPressed: () {
                // Navigate to Edit Profile screen
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditScreen(),
                  ),
                );
              },
            ),
          IconButton(
            icon: const Icon(CustomIcons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Settings()),
              );
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
      body: _isLoading
          ? const Center(
          child: CircularProgressIndicator(
            color: kYellow,
          ))
          : RefreshIndicator(
        color: kYellow,
        onRefresh: () async {
          onReresh();
        },
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                        Navigator.pop(context);
                      } else {
                        // Otherwise, animate back to the original position
                        _animationController.forward(from: 0);
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
                                : MediaQuery
                                .of(context)
                                .size
                                .height,
                          ),
                          // Use the full screen height for the overlay
                          height: MediaQuery
                              .of(context)
                              .size
                              .height -
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
                                    borderRadius:
                                    BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 230,
                                      width: 230,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(5),
                                      ),
                                      child: isScanning
                                          ? QRCodeDartScanView(
                                        scanInvertedQRCode: true,
                                        onCapture: (data) async {
                                          final uri =
                                          Uri.parse(data.text);
                                          final decodedData =
                                              uri.pathSegments.last;
                                          final userExists =
                                          await FirestoreHelper
                                              .checkUserExist(
                                              decodedData);
                                          if (userExists) {
                                            setState(() {
                                              scannedData =
                                                  decodedData;
                                              isScanning = false;
                                            });
                                            if (decodedData ==
                                                userData!.uid) {
                                              ScaffoldMessenger.of(
                                                  context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  showCloseIcon:
                                                  true,
                                                  backgroundColor:
                                                  kGrayLight,
                                                  content: Text(
                                                      kNiceTry),
                                                ),
                                              );
                                              return;
                                            }
                                            _showWalletDialog(
                                                decodedData);
                                          } else {
                                            ScaffoldMessenger.of(
                                                context)
                                                .showSnackBar(
                                              SnackBar(
                                                showCloseIcon: true,
                                                backgroundColor:
                                                kGrayLight,
                                                content: Text(
                                                    kUserDoesntExist),
                                              ),
                                            );
                                          }
                                        },
                                      )
                                          : QrImageView(
                                          data:
                                          'https://tethr.tomcremer.be/profile/${widget
                                              .uid}',
                                          eyeStyle: QrEyeStyle(
                                            eyeShape:
                                            QrEyeShape.square,
                                            color: gradient.colors[1],
                                          ),
                                          dataModuleStyle:
                                          QrDataModuleStyle(
                                            dataModuleShape:
                                            QrDataModuleShape
                                                .square,
                                            color: gradient.colors[1],
                                          ),
                                          version: QrVersions.auto,
                                          size: 200),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          if (!_isCurrentUser)
                                            TinyButton(
                                              onTap: () async {
                                                // Follow or unfollow the user
                                                if (_isFollowing) {
                                                  try {
                                                    await FirestoreHelper
                                                        .removeUserFromFollowers(
                                                        widget.uid);
                                                  } catch (e) {
                                                    ScaffoldMessenger.of(
                                                        context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        showCloseIcon:
                                                        true,
                                                        backgroundColor:
                                                        kGrayLight,
                                                        content: Text(
                                                            kErrorUnfollow),
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  try {
                                                    await FirestoreHelper
                                                        .addUserToFollowers(
                                                        widget.uid);
                                                  } catch (e) {
                                                    ScaffoldMessenger.of(
                                                        context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        showCloseIcon:
                                                        true,
                                                        backgroundColor:
                                                        kGrayLight,
                                                        content: Text(
                                                            kErrorUnfollow),
                                                      ),
                                                    );
                                                  }
                                                }
                                                setState(() {
                                                  _isFollowing =
                                                  !_isFollowing;
                                                });
                                              },
                                              icon: _isFollowing
                                                  ? Icons.favorite_rounded
                                                  : CustomIcons.heart,
                                              label: _isFollowing
                                            ? 'Unfollow'
                                                : 'Follow',
                                              iconColor: _isFollowing
                                                  ? kRed
                                                  : kBlack,
                                              containerColor: kBlue,
                                            ),
                                          if (_isCurrentUser)
                                            TinyButton(
                                              onTap: () {
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
                                              icon:
                                              CustomIcons.scanqrcode,
                                              label: 'Scan',
                                              containerColor: kGreen,
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
          );
        }),
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
