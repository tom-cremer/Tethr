import 'package:dto/models.dart' as dto;
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tethr/Screen/settings.dart';
import 'package:tethr/Styles/card_styles.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Widget/card_stack.dart';
import 'package:tethr/Screen/Form/Edit/edit_screen.dart';
import 'package:tethr/custom_icons_icons.dart';

class UserProfileScreen extends StatefulWidget {
  dto.User? userData;
  dto.Follow? follower;
  List<dto.UserPurchase> purchaseData = [];
  List<dto.UserReward> rewardsData = [];
  final bool isCurrentUser;

  UserProfileScreen({
    super.key,
    this.userData,
    this.follower,
    required this.purchaseData,
    required this.rewardsData,
    this.isCurrentUser = false, // Default to false for other users.
  });

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with TickerProviderStateMixin {
  bool _showOverlay = false;
  double _dragPosition = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradient = GradientStyles.getGradient(
        widget.userData?.activeItems.banner ??
            widget.follower?.activeItems.banner);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          if (widget.isCurrentUser)
            IconButton(
              icon: const Icon(CustomIcons.add),
              onPressed: () {
                // Action to add a new Link.
              },
            ),
          IconButton(
            icon: const Icon(CustomIcons.edit),
            onPressed: () {
              // Navigate to Edit Profile screen.
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => EditScreen()));
            },
          ),
          IconButton(
            icon: const Icon(CustomIcons.settings),
            onPressed: () {
              // Navigate to Rewards screen.
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Settings()));
            },
          )
        ],
        leading: widget.isCurrentUser
            ? IconButton(
                icon: const Icon(CustomIcons.medalstar),
                onPressed: () {
                  // Navigate to Reward screen.
                },
              )
            : null,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              Center(
                child: CardStack(
                  userData: widget.userData,
                  follower: widget.follower,
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
                                  child: QrImageView(
                                      data:
                                          'https://tomcremer.be/@${widget.userData?.username ?? widget.follower?.username}',
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: kBlue,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(CustomIcons.send),
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 30),
                                    Container(
                                      height: 50,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: kGreen,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {
                                            // Download the QR code
                                          },
                                          icon: const Icon(
                                              CustomIcons.scanner),
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 30),
                                    Container(
                                      height: 50,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: kPurple,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {
                                            // Action for the NFC button
                                          },
                                          icon: const Icon(CustomIcons.nfc),
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                    ),
                                  ],
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
}
