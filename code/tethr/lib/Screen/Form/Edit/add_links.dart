import 'package:dto/models.dart' as dto;
import 'package:flutter/material.dart';
import 'package:tethr/Helpers/firestore_helper.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Styles/texts.dart';
import 'package:tethr/Widget/Form/custom_input_field.dart';
import 'package:tethr/custom_icons_icons.dart';

class AddLinks extends StatefulWidget {
  const AddLinks({super.key});

  @override
  State<AddLinks> createState() => _AddLinksScreenState();
}

class _AddLinksScreenState extends State<AddLinks> {
  dto.User? user;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _linkController = TextEditingController();
  final List<String> _links = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final userData = await FirestoreHelper.getUserData();
      if (userData != null) {
        setState(() {
          user = userData;
          _links.addAll(userData.links ?? []);
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: true,
          backgroundColor: kGrayLight,
          content: Text(kErrorFetchUser),
        ),
      );
    }
  }

  void _addLink() {
    if (!_formKey.currentState!.validate()) return;

    if (_linkController.text.isNotEmpty && _links.length < 8) {
      setState(() {
        _links.add(_linkController.text.trim());
        _linkController.clear();
      });
    } else if (_links.length >= 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          showCloseIcon: true,
          backgroundColor: kGrayLight,
          content: Text('Maximum of 8 links allowed'),
        ),
      );
    }
  }

  void _removeLink(String link) {
    setState(() {
      _links.remove(link);
    });
  }

  Future<void> _saveLinks() async {
    try {
      await FirestoreHelper.updateUserLinks(_links);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: true,
          backgroundColor: kGrayLight,
          content: Text(kProfileUpdatedSuccess),
        ),
      );
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add your links"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_outlined, color: kBlackText),
            onPressed: _saveLinks,
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _saveLinks();
            Navigator.of(context).pop();
          },
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: kYellow,
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 80.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Form(
                          key: _formKey,
                          child: CustomInputField(
                            label: 'Link',
                            hintText: 'https://tethr.tomcremer.be',
                            controller: _linkController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Link is required';
                              }
                              if (!Uri.parse(value).isAbsolute) {
                                return 'Invalid link';
                              }
                              if (_links.contains(value)) {
                                return 'Link already added';
                              }
                              final linkRegEx = RegExp(
                                  r'^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$');
                              if (!linkRegEx.hasMatch(value)) {
                                return 'Invalid link';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: _links.isEmpty
                        ? const Center(
                            child: Text(
                              "No links added.",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          )
                        : ListView.separated(
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: _links.length,
                            itemBuilder: (context, index) {
                              final link = _links[index];
                              return ListTile(
                                title: Text(link),
                                trailing: IconButton(
                                  icon: const Icon(CustomIcons.close,
                                      color: Colors.red),
                                  onPressed: () {
                                    _removeLink(link);
                                  },
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const Divider(color: kGrayLight),
                          ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addLink,
        backgroundColor: kGreen,
        child: const Icon(Icons.check),
      ),
    );
  }
}
