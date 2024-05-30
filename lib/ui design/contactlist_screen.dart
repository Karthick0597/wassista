import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasissta_project/utilities/api_constant.dart';
import '../model_class/contactlist_model.dart';
import '../widget/constant.dart';
import '../widget/small_text.dart';
import '../widget/string.dart';
import 'package:intl/intl.dart';

class ContactListScreen extends StatefulWidget {
  final bool isSelected;
  const ContactListScreen(
      {Key? key,
      required this.isSelected,
      required Null Function(String assistantName) onAssistantSelected})
      : super(key: key);

  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<UserContacts> _userContacts = [];
  List<UserContacts> _filteredContacts = [];
  Map<int, String?> selectedChatTypes = {};
  bool _isLoading = false;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchContactDetails();
  }

  @override
  Widget build(BuildContext context) {
    _userContacts.sort((a, b) {
      if (a.assistantContact?.status == "Active" &&
          b.assistantContact?.status != "Active") {
        return -1;
      } else if (a.assistantContact?.status != "Active" &&
          b.assistantContact?.status == "Active") {
        return 1;
      } else {
        return 0;
      }
    });
    _filteredContacts = _userContacts.where((contact) {
      final name = contact.name?.toLowerCase() ?? '';
      final phone = contact.phone?.toLowerCase() ?? '';
      final query = _searchQuery.toLowerCase();
      return name.contains(query) || phone.contains(query);
    }).toList();

    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: primaryColor,
                color: Colors.grey,
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                        cursorColor: primaryColor,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xffBBB2B2),
                            size: 25,
                          ), // Search icon
                          hintText: 'Search Contacts...', // Hint text
                          hintStyle: TextStyle(
                              color: Color(0xffBBB2B2),
                              fontFamily: MyStrings.outfit), // Hint text color
                          enabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _filteredContacts.length,
                    itemBuilder: (context, index) {
                      String selectedChatType = selectedChatTypes[index] ?? '';
                      if (selectedChatType.isEmpty) {
                        selectedChatType = 'Select Chat Type';
                      }
                      UserContacts userContact = _filteredContacts[index];
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: primaryColor, // Optional: background color while loading
                              child: ClipOval(
                                child: userContact.profileImg != null
                                    ? CachedNetworkImage(
                                        imageUrl: userContact.profileImg!,
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(), // Optional: placeholder while loading
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons
                                                .error), // Optional: error widget
                                        fit: BoxFit.cover,
                                        width: 50.0,
                                        height: 50.0,
                                      )
                                    : Center(
                                        child: Text(
                                          'W',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: whiteColor,
                                            fontFamily: MyStrings.outfit,
                                            letterSpacing: 3,
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                            const SizedBox(
                                width: 10), // Adjust the spacing as needed
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  userContact.name != null
                                      ? Text(
                                          userContact.name!,
                                          style: const TextStyle(
                                              fontFamily: MyStrings.outfit),
                                        )
                                      : const SizedBox(), // To maintain alignment
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          userContact.phone ?? 'No Phone',
                                          style: const TextStyle(
                                              fontFamily: MyStrings.outfit),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                width: 10), // Adjust the spacing as needed
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              1,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 20,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SmallText(
                                              text:
                                                  MyStrings.selectTheAssistant,
                                              fontFamily: MyStrings.outfit,
                                              color: primaryColor,
                                            ),
                                            const SizedBox(height: 10),
                                            Expanded(
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: _userContacts.length,
                                                itemBuilder: (context, index) {
                                                  final userContact =
                                                      _userContacts[index];
                                                  bool hasAssistantContact = userContact
                                                              .assistantContact !=
                                                          null &&
                                                      userContact
                                                              .assistantContact!
                                                              .assistantName !=
                                                          null &&
                                                      userContact
                                                              .assistantContact!
                                                              .createdAt !=
                                                          null;

                                                  if (!hasAssistantContact ||
                                                      userContact
                                                              .assistantContact!
                                                              .assistantName ==
                                                          null ||
                                                      userContact
                                                              .assistantContact!
                                                              .createdAt ==
                                                          null) {
                                                    return const SizedBox();
                                                  }

                                                  if (userContact
                                                          .assistantContact!
                                                          .status ==
                                                      "Active") {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        // Your onTap logic
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16),
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 16,
                                                            vertical: 8),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    userContact
                                                                        .assistantContact!
                                                                        .assistantName
                                                                        .toString(),
                                                                    style: const TextStyle(
                                                                        fontFamily:
                                                                            MyStrings.outfit),
                                                                  ),
                                                                  Text(
                                                                    DateFormat(
                                                                            'yyyy-MM-dd')
                                                                        .format(
                                                                      DateTime
                                                                          .parse(
                                                                        userContact
                                                                            .assistantContact!
                                                                            .createdAt
                                                                            .toString(),
                                                                      ),
                                                                    ),
                                                                    style: const TextStyle(
                                                                        fontFamily:
                                                                            MyStrings.outfit),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 10),
                                                            Container(
                                                              width: 100,
                                                              height: 30,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                color:
                                                                    primaryColor, // Use primaryColor for active status
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  "Active",
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        whiteColor,
                                                                    fontFamily:
                                                                        MyStrings
                                                                            .outfit,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    // Display inactive contacts with both assistant name and creation date
                                                    return GestureDetector(
                                                      onTap: () {
                                                        // Your onTap logic
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16),
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 16,
                                                            vertical: 8),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    userContact
                                                                        .assistantContact!
                                                                        .assistantName
                                                                        .toString(),
                                                                    style: const TextStyle(
                                                                        fontFamily:
                                                                            MyStrings.outfit),
                                                                  ),
                                                                  Text(
                                                                    DateFormat(
                                                                            'yyyy-MM-dd')
                                                                        .format(
                                                                      DateTime
                                                                          .parse(
                                                                        userContact
                                                                            .assistantContact!
                                                                            .createdAt
                                                                            .toString(),
                                                                      ),
                                                                    ),
                                                                    style: const TextStyle(
                                                                        fontFamily:
                                                                            MyStrings.outfit),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 10),
                                                            Container(
                                                              width: 100,
                                                              height: 30,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                color: Colors
                                                                    .red, // Use red color for inactive status
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  "Inactive",
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        whiteColor,
                                                                    fontFamily:
                                                                        MyStrings
                                                                            .outfit,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: userContact
                                                  .assistantContact?.status ==
                                              "Active"
                                          ? primaryColor // Use primary color if status is active
                                          : Colors.grey, // Otherwise, use grey
                                    ),
                                    child: Icon(
                                      Icons.smart_toy_outlined,
                                      color: userContact
                                                  .assistantContact?.status ==
                                              "Active"
                                          ? Colors
                                              .white // Use white color if status is active
                                          : Colors.white, // Otherwise, use grey
                                    ),
                                  ),
                                  selectedChatType == 'Select Chat Type'
                                      ? const SizedBox(width: 0, height: 0)
                                      : SmallText(
                                          text: selectedChatType,
                                          size: 10,
                                          fontFamily: MyStrings.outfit,
                                          color: selectedChatType ==
                                                  "Select Chat Type"
                                              ? const Color(0xffEDEDED)
                                              : const Color(0xff00A397),
                                        ),
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
    );
  }

  void _fetchContactDetails() async {
    setState(() {
      _isLoading = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('authorization');
    if (kDebugMode) {
      print("access token $token");
    }
    try {
      var response = await http.get(
        Uri.parse(ApiConstants.get_contact_datas),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("statuscode:${response.statusCode}");
        }
        var jsonData = json.decode(response.body);
        ContactModel contactModel = ContactModel.fromJson(jsonData);
        setState(() {
          _userContacts = contactModel.userContacts ?? [];
          if (kDebugMode) {
            print(_userContacts);
          }
        });
      } else {
        if (kDebugMode) {
          print('Failed to fetch contacts: ${response.statusCode}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching contacts: $error');
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
