import 'package:dto/models.dart' as dto;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tethr/Helpers/firestore_helper.dart';
import 'package:tethr/Screen/Form/Login/shop_screen.dart';
import 'package:tethr/Screen/settings.dart';
import 'package:tethr/Styles/colors.dart';
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
  List<dto.UserPurchase> _purchaseData = [];
  List<dto.UserReward> _rewardsData = [];
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
            icon: const Icon(CustomIcons.search),
            onPressed: () {
              // Action for the notifications button (left side)
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
          ? const Center(child: CircularProgressIndicator(color: kYellow,))
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
                  );
                },
              ),
            ),
    );
  }

  // Helper method for building the followers list
  Widget _buildFollowersList(List<dto.Follow> followersData,
      List<dto.UserPurchase> purchaseData, List<dto.UserReward> rewardsData) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: followersData.length,
      itemBuilder: (context, index) {
        final follower = followersData[index];
        return Wallet(
          follower: follower,
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
