import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tethr/Helpers/firestore_helper.dart';
import 'package:tethr/Screen/welcome.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Widget/button.dart';
import 'package:tethr/Widget/wallet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> _userData = {};
  List<Map<String, dynamic>> _followersData = [];
  List<Map<String, dynamic>> _purchaseData = [];
  List<Map<String, dynamic>> _rewardsData = [];
  bool _isLoading = true;

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
      final purchaseData = await FirestoreHelper.getUserPurchases();
      final rewardsData = await FirestoreHelper.getUserRewards();

      setState(() {
        _followersData = followersData;
        _purchaseData = purchaseData;
        _rewardsData = rewardsData;
      });
    } catch (e) {
      // Handle errors and display a snackbar.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching user or followers data: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _onRefresh() async {
    await _fetchUserDataAndFollowers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Action for the notifications button (left side)
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // Action for the search button (left side)
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.shopping_bag_outlined),
          onPressed: () {
            // Action for the right icon button (menu)
          },
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _onRefresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/logo.svg'),
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
                      Button(
                        label: 'Sign out',
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => Welcome(),
                            ),
                          );
                        },
                      ),
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
                        userData: _userData,
                        purchaseData: _purchaseData,
                        rewardsData: _rewardsData,
                        isCurrentUser: true,
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
                      _buildFollowersList(
                          _followersData, _purchaseData, _rewardsData),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  // Helper method for building the followers list
  Widget _buildFollowersList(
    List<Map<String, dynamic>> followersData,
    List<Map<String, dynamic>> purchaseData,
    List<Map<String, dynamic>> rewardsData,
  ) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: followersData.length,
      itemBuilder: (context, index) {
        final follower = followersData[index];
        return Wallet(
          userData: follower,
          purchaseData: purchaseData,
          rewardsData: rewardsData,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
    );
  }
}
