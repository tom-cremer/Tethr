import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  final Map<String, dynamic> userData;
  final List<Map<String, dynamic>>? purchaseData;
  final List<Map<String, dynamic>>? rewardsData;
  final bool isCurrentUser;

  const UserProfileScreen({
    super.key,
    required this.userData,
    this.purchaseData,
    this.rewardsData,
    this.isCurrentUser = false, // Default to false for other users.
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          if (isCurrentUser)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Navigate to Edit Profile screen.
              },
            ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // Navigate to Rewards screen.
            },
          )
        ],
        leading: isCurrentUser
            ? IconButton(
                icon: const Icon(Icons.star),
                color: Colors.amber,
                onPressed: () {
                  // Navigate to Reward screen.
                },
              )
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              if (isCurrentUser) _buildEditAndRewardsButtons(context),
              const SizedBox(height: 20),
              _buildSectionTitle('Purchases'),
              _buildPurchasesList(),
              const SizedBox(height: 20),
              _buildSectionTitle('Rewards'),
              _buildRewardsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          child: userData['profilePicture'] == null
              ? const Icon(Icons.person, size: 40)
              : null,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userData['name'] ?? userData['username'] ?? 'Anonymous',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(userData['email'] ?? 'No email available'),
          ],
        ),
      ],
    );
  }

  Widget _buildEditAndRewardsButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            // Navigate to Edit Profile screen.
          },
          child: const Text('Edit Profile'),
        ),
        ElevatedButton(
          onPressed: () {
            // Navigate to Rewards screen.
          },
          child: const Text('View Rewards'),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildPurchasesList() {
    if (purchaseData == null || purchaseData!.isEmpty) {
      return const Text('No purchases yet.');
    }

    return Column(
      children: purchaseData!
          .map((purchase) => ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: Text(purchase['name'] ?? 'Unknown Item'),
                subtitle: Text(purchase['type'] ?? 'Unknown Type'),
              ))
          .toList(),
    );
  }

  Widget _buildRewardsList() {
    if (rewardsData == null || rewardsData!.isEmpty) {
      return const Text('No rewards earned yet.');
    }

    return Column(
      children: rewardsData!
          .map((reward) => ListTile(
                leading: const Icon(Icons.star, color: Colors.amber),
                title: Text(reward['name'] ?? 'Unknown Reward'),
                subtitle: Text(reward['description'] ?? 'No description'),
              ))
          .toList(),
    );
  }
}
