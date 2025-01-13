import 'dart:async';
import 'package:dto/models.dart' as dto;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:tethr/Helpers/firestore_helper.dart';
import 'package:tethr/Screen/Form/Login/shop_screen.dart';
import 'package:tethr/Screen/settings.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Styles/texts.dart';
import 'package:tethr/Widget/show_search_bar.dart';
import 'package:tethr/Widget/show_wallet_dialog.dart';
import 'package:tethr/Widget/wallet.dart';
import 'package:tethr/custom_icons_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dto.User? _userData;
  List<dto.Follow> _followersData = [];
  bool _isLoading = true;
  String? scannedData;
  bool isScanning = false;

  @override
  void initState() {
    super.initState();
    _fetchUserDataAndFollowers();
  }

  Future<void> _fetchUserDataAndFollowers() async {
    try {
      final userData = await FirestoreHelper.getUserData();
      if (userData == null) {
        throw Exception('User document not found in Firestore.');
      }

      setState(() {
        _userData = userData;
      });

      final followersData = await FirestoreHelper.getUserFollowers();

      setState(() {
        _followersData = followersData;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            showCloseIcon: true,
            backgroundColor: kGrayLight,
            content: Text(kErrorFetchUser)),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _onRefresh() async {
    setState(() {
      _isLoading = true;
    });
    await _fetchUserDataAndFollowers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(CustomIcons.search),
            onPressed: () {
              // Action for the notifications button (left side)
              _showSearchBar();
            },
          ),
          IconButton(
            icon: const Icon(CustomIcons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Settings(),
                ),
              );
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(CustomIcons.shop),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ShopScreen(),
              ),
            );
          },
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: kYellow,
            ))
          : RefreshIndicator(
              color: kYellow,
              onRefresh: _onRefresh,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 30.0, right: 30.0, bottom: 50.0),
                        child: Stack(
                          children: [
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      isScanning = true;
                                    });
                                    _launchScanner();
                                  },
                                  backgroundColor: kGreen,
                                  child: Icon(CustomIcons.scanqrcode),
                                )),
                            Column(
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/logo.svg'),
                                      const Text(
                                        'Wallet',
                                        style: TextStyle(
                                          color: kBlackText,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24,
                                          fontFamily: 'Lexend',
                                        ),
                                      ),
                                    ]),
                                const SizedBox(height: 20),
                                const Row(
                                  children: [
                                    Text(
                                      'You',
                                      style: TextStyle(
                                          color: kBlackText,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          fontFamily: 'Lexend'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Wallet(
                                  uid: _userData!.uid,
                                ),
                                const SizedBox(height: 30),
                                const Row(
                                  children: [
                                    Text(
                                      'Followings',
                                      style: TextStyle(
                                          color: kBlackText,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          fontFamily: 'Lexend'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                _buildFollowersList(_followersData),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }

  // Helper method for building the followers list
  Widget _buildFollowersList(List<dto.Follow> followersData) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: followersData.length,
      itemBuilder: (context, index) {
        final follower = followersData[index];
        return Wallet(
          uid: follower.uid,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
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

  void _showSearchBar() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SearchUserDialog();
      },
    );
  }

  void _launchScanner() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Scan QR Code',
                        style: TextStyle(
                            color: kBlackText,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            fontFamily: 'Lexend')),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(CustomIcons.close))
                  ],
                ),
                Container(
                  height: 230,
                  width: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: QRCodeDartScanView(
                    scanInvertedQRCode: true,
                    onCapture: (data) async {
                      final uri = Uri.parse(data.text);
                      final decodedData = uri.pathSegments.last;
                      final userExists =
                          await FirestoreHelper.checkUserExist(decodedData);
                      if (userExists) {
                        setState(() {
                          scannedData = decodedData;
                          isScanning = false;
                        });
                        if (decodedData == _userData!.uid) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              showCloseIcon: true,
                              backgroundColor: kGrayLight,
                              content: Text(kNiceTry),
                            ),
                          );
                          return;
                        }
                        Navigator.pop(context);
                        _showWalletDialog(decodedData);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              showCloseIcon: true,
                              backgroundColor: kGrayLight,
                              content: Text(kUserDoesntExist)),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
