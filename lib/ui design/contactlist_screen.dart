import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/constant.dart';
import '../widget/small_text.dart';
import '../widget/string.dart';

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
  Map<int, String?> selectedChatTypes = {};
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchContactDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: primaryColor,
                color: Colors.grey,
              ),
            )
          : ListView.builder(
              itemCount: _userContacts.length,
              itemBuilder: (context, index) {
                String selectedChatType = selectedChatTypes[index] ?? '';
                if (selectedChatType.isEmpty) {
                  selectedChatType = 'Select Chat Type';
                }
                UserContacts userContact = _userContacts[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: userContact.profileImg != null
                        ? NetworkImage(userContact.profileImg!)
                        : null,
                    child: userContact.profileImg == null
                        ? Text(
                            'W',
                            style: TextStyle(
                              fontSize: 16,
                              color: primaryColor,
                              fontFamily: MyStrings.outfit,
                              letterSpacing: 3,
                            ),
                          )
                        : null,
                  ),
                  title: Text(
                    userContact.name ?? '',
                    style: const TextStyle(fontFamily: MyStrings.outfit),
                  ),
                  subtitle: Text(
                    userContact.phone ?? 'No Phone',
                    style: const TextStyle(fontFamily: MyStrings.outfit),
                  ),
                  trailing: GestureDetector(
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
                            height: 150,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SmallText(
                                    text: MyStrings.selectTheAssistant,
                                    fontFamily: MyStrings.outfit,
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedChatTypes[index] =
                                                MyStrings.personalChat;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 100,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: selectedChatTypes[index] ==
                                                    MyStrings.personalChat
                                                ? const Color(0xff00A397)
                                                : const Color(0xffEDEDED),
                                          ),
                                          child: Center(
                                            child: SmallText(
                                              text: MyStrings.personalChat,
                                              size: 10,
                                              fontFamily: MyStrings.outfit,
                                              color: selectedChatTypes[index] ==
                                                      MyStrings.personalChat
                                                  ? Colors.white
                                                  : const Color(0xff8B8E8C),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Similar GestureDetector widgets for other chat types
                                    ],
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
                            color: selectedChatType == "Select Chat Type"
                                ? Colors.grey
                                : Colors.white,
                          ),
                          child: Icon(
                            Icons.smart_toy_outlined,
                            color: selectedChatType == "Select Chat Type"
                                ? const Color(0xffEDEDED)
                                : const Color(0xff00A397),
                          ),
                        ),
                        selectedChatType == 'Select Chat Type'
                            ? const SizedBox(width: 0, height: 0)
                            : SmallText(
                                text: selectedChatType,
                                size: 10,
                                fontFamily: MyStrings.outfit,
                                color: selectedChatType == "Select Chat Type"
                                    ? const Color(0xffEDEDED)
                                    : const Color(0xff00A397),
                              ),
                      ],
                    ),
                  ),
                );
              },
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
        Uri.parse('https://wassista.com/api/get_contact_datas'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("hello");
        }
        if (kDebugMode) {
          print("statuscode:${response.statusCode}");
        }
        var jsonData = json.decode(response.body);
        ContactModel contactModel = ContactModel.fromJson(jsonData);
        setState(() {
          _userContacts = contactModel.userContacts ?? [];
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

class ContactModel {
  String? status;
  List<UserContacts>? userContacts;

  ContactModel({this.status, this.userContacts});

  ContactModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['user_contacts'] != null) {
      userContacts = <UserContacts>[];
      json['user_contacts'].forEach((v) {
        userContacts!.add(new UserContacts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.userContacts != null) {
      data['user_contacts'] =
          this.userContacts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserContacts {
  int? id;
  int? userId;
  Null? name;
  String? phone;
  String? createdAt;
  String? updatedAt;
  Null? companyName;
  Null? jobTitle;
  Null? email;
  Null? dateOfBirth;
  Null? anniversaryDate;
  Null? categoryId;
  Null? countryCode;
  String? deviceUuid;
  String? profileImg;
  int? profileStatus;
  int? liteReceivedMsgCount;
  int? liteSentMsgCount;
  Null? assistantContact;

  UserContacts(
      {this.id,
      this.userId,
      this.name,
      this.phone,
      this.createdAt,
      this.updatedAt,
      this.companyName,
      this.jobTitle,
      this.email,
      this.dateOfBirth,
      this.anniversaryDate,
      this.categoryId,
      this.countryCode,
      this.deviceUuid,
      this.profileImg,
      this.profileStatus,
      this.liteReceivedMsgCount,
      this.liteSentMsgCount,
      this.assistantContact});

  UserContacts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    companyName = json['company_name'];
    jobTitle = json['job_title'];
    email = json['email'];
    dateOfBirth = json['date_of_birth'];
    anniversaryDate = json['anniversary_date'];
    categoryId = json['category_id'];
    countryCode = json['country_code'];
    deviceUuid = json['device_uuid'];
    profileImg = json['profile_img'];
    profileStatus = json['profile_status'];
    liteReceivedMsgCount = json['lite_received_msg_count'];
    liteSentMsgCount = json['lite_sent_msg_count'];
    assistantContact = json['assistant_contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['company_name'] = this.companyName;
    data['job_title'] = this.jobTitle;
    data['email'] = this.email;
    data['date_of_birth'] = this.dateOfBirth;
    data['anniversary_date'] = this.anniversaryDate;
    data['category_id'] = this.categoryId;
    data['country_code'] = this.countryCode;
    data['device_uuid'] = this.deviceUuid;
    data['profile_img'] = this.profileImg;
    data['profile_status'] = this.profileStatus;
    data['lite_received_msg_count'] = this.liteReceivedMsgCount;
    data['lite_sent_msg_count'] = this.liteSentMsgCount;
    data['assistant_contact'] = this.assistantContact;
    return data;
  }
}
