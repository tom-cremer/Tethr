import 'dart:core';
import 'package:dto/models.dart' as dto;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tethr/Helpers/firestore_helper.dart';
import 'package:tethr/Screen/settings.dart';
import 'package:tethr/Styles/card_styles.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Widget/button.dart';
import 'package:tethr/Widget/card_background.dart';
import 'package:tethr/custom_icons_icons.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  dto.User? userdata;
  List<dto.ShopItem> shopItems = [];
  bool _isLoading = true;
  bool _isUserLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchShopItems();
    _fetchUser();
  }

  Future<void> _fetchUser() async {
    try {
      userdata = (await FirestoreHelper.getUserData())!;
      setState(() {
        _isUserLoading = false;
      });
    } catch (e) {
      setState(() {
        _isUserLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching user data: $e')),
      );
    }
  }

  Future<void> _fetchShopItems() async {
    try {
      shopItems = await FirestoreHelper.removePurchasedItems();
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching shop items: $e')),
      );
    }
  }

  Future<void> _onRefresh() async {
    await _fetchShopItems();
    await _fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(CustomIcons.archivebox),
            onPressed: () {

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
          icon: const Icon(CustomIcons.arrowleft),
          onPressed: () {
            Navigator.of(context).pop();
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
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/images/logo.svg'),
                                const Text(
                                  'Shop',
                                  style: TextStyle(
                                    color: kBlackText,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                    fontFamily: 'Lexend',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _isUserLoading
                                    ? const CircularProgressIndicator(
                                        backgroundColor: kYellow,
                                      )
                                    : Text(
                                        '${userdata?.starPoints}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Lexend',
                                          color: kBlackText,
                                        ),
                                      ),
                                const SizedBox(width: 5),
                                Icon(Icons.star_rounded, color: kYellow),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Cards',
                              style: TextStyle(
                                  color: kBlackText,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  fontFamily: 'Lexend'),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: kMediumCardHeight + 15,
                              child: _buildBanners(),
                            ),
                            const SizedBox(height: 20),
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

  Widget _buildBanners() {
    if (shopItems.isEmpty) {
      return Center(
        child: Text(
          'New Cards Coming Soon!',
          style: TextStyle(
            color: kBlackText,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: 'Lexend',
          ),
        ),
      );
    } else {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: shopItems.length,
        itemBuilder: (context, index) {
          final item = shopItems[index];
          return GestureDetector(
            onTap: () async {
              //Show pop up to purchase item
              showDialog(
                  context: context,
                  builder: (context) {
                    return _showItemToPurchasePopUp(item);
                  });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(
                children: [
                  CardWidget(
                    gradient: GradientStyles.getGradient(item.id),
                    width: kMediumCardWidth,
                    height: kMediumCardHeight,
                    radius: kMediumCardRadius,
                    iconSize: kMediumCardIconSize,
                  ),
                  Container(
                    width: kMediumCardWidth,
                    height: kMediumCardHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kMediumCardRadius),
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                  SizedBox(
                    width: kMediumCardWidth,
                    height: kMediumCardHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            color: kWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lexend',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${item.cost}',
                              style: const TextStyle(
                                color: kWhite,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Lexend',
                              ),
                            ),
                            Icon(Icons.star_rounded, color: kYellow),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  // Make a pop up on top of everything that shows the item not yet purchased
  Widget _showItemToPurchasePopUp(dto.ShopItem item) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (item.type == 'card') ...{
            CardWidget(
              gradient: GradientStyles.getGradient(item.id),
              width: kMediumCardWidth,
              height: kMediumCardHeight,
              radius: kMediumCardRadius,
              iconSize: kMediumCardIconSize,
            ),
          },
          const SizedBox(height: 10),
          SizedBox(
            width: 200,
            child: Text(
              'You need ${item.cost} stars to purchase ${item.name}.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kBlackText,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Lexend',
              ),
            ),
          ),
          const SizedBox(height: 10),
          Button(
            label: 'Ok',
            verticalMargin: 10.0,
            verticalPadding: 10.0,
            horizontalMargin: 0.0,
            borderRadius: 12.0,
            color: kYellow,
            onTap: () async {
              try {
                await FirestoreHelper.purchaseItem(item.id);
                await _fetchShopItems();
                await _fetchUser();
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (context) => _showItemPurchasedPopUp(item),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error purchasing item: $e')),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  // Make a pop up on top of everything that shows the new item purchased
  Widget _showItemPurchasedPopUp(dto.ShopItem item) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CardWidget(
            gradient: GradientStyles.getGradient(item.id),
            width: kMediumCardWidth,
            height: kMediumCardHeight,
            radius: kMediumCardRadius,
            iconSize: kMediumCardIconSize,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 200,
            child: Text(
              'You have successfully purchased ${item.name}!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kBlackText,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Lexend',
              ),
            ),
          ),
          const SizedBox(height: 10),
          Button(
            label: 'Yay!',
            verticalMargin: 10.0,
            verticalPadding: 10.0,
            horizontalMargin: 0.0,
            borderRadius: 12.0,
            color: kYellow,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
