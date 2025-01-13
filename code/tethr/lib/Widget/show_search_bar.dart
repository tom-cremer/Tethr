import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tethr/Helpers/firestore_helper.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Widget/wallet.dart';
import 'package:dto/models.dart' as dto;

class SearchUserDialog extends StatefulWidget {
  @override
  _SearchUserDialogState createState() => _SearchUserDialogState();
}

class _SearchUserDialogState extends State<SearchUserDialog> {
  final TextEditingController _searchController = TextEditingController();
  List<dto.User> _allPeople = [];
  List<dto.User> _filteredPeople = [];
  bool isFiltering = true;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    try {
      final people = await FirestoreHelper.getAllUsersExceptLoggedIn();
      setState(() {
        _allPeople = people;
        _filteredPeople = people;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: true,
          backgroundColor: kGrayLight,
          content: Text('Oops! $e'),
        ),
      );
    } finally {
      setState(() {
        isFiltering = false;
      });
    }
  }

  void _filterPeople(String value) {
    if (value.isEmpty) {
      setState(() {
        _filteredPeople = _allPeople;
        isFiltering = false;
      });
      return;
    }
    final filteredPeople = _allPeople
        .where((user) =>
            user.firstName.toLowerCase().contains(value.toLowerCase()) ||
            user.email.toLowerCase().contains(value.toLowerCase()) ||
            user.lastName.toLowerCase().contains(value.toLowerCase()))
        .toList();
    setState(() {
      _filteredPeople = filteredPeople;
      isFiltering = false;
    });
  }

  delayedFilterPeople(String value) {
    setState(() {
      isFiltering = true;
      _filteredPeople = [];
    });
    Future.delayed(const Duration(milliseconds: 50), () {
      _filterPeople(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Close', style: TextStyle(color: kBlackText, fontSize: 16, fontFamily: 'Lexend', fontWeight: FontWeight.w600)),
        ),
      ],
      content: Column(
        children: [

          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              delayedFilterPeople(value);
            },
          ),
          const SizedBox(height: 10),
          isFiltering
              ? CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Column(
                    children: _filteredPeople
                        .map(
                          (user) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Wallet(uid: user.uid),
                          ),
                        )
                        .toList(),
                  ),
                ),
        ],
      ),
    );
  }
}
