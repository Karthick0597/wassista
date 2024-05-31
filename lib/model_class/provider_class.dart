import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasissta_project/model_class/update_assistant.dart';
import 'package:wasissta_project/utilities/api_constant.dart';
import 'addassistant_model.dart';
import 'assistantlist_model.dart';
import 'package:http/http.dart' as http;

class AssistantContactListProvider extends ChangeNotifier {
  void setIsSelected(int index) {
    _isSelected = index;
    notifyListeners();
  }

  int _isSelected = 0;

  List<Assistant> get assistantList => _assistantList;
  List<Assistant> get originalAssistantList => _originalAssistantList;
  int get isSelected => _isSelected;

  void setAssistantList(List<Assistant> assistants) {
    _assistantList = assistants;
    _originalAssistantList = List.from(assistants);
    notifyListeners();
  }

  Future<void> fetchAssistantList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('authorization');
    if (kDebugMode) {
      print("access token $token");
    }
    try {
      var response = await http.get(
        Uri.parse(ApiConstants.get_assistant_list),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        print("statuscode:${response.statusCode}");
        var jsonData = json.decode(response.body);
        AssistantListModel assistantListModel =
            AssistantListModel.fromJson(jsonData);
        setAssistantList(assistantListModel.assistantList ?? []);
      } else {
        if (kDebugMode) {
          print('Failed to fetch assistant: ${response.statusCode}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching assistant: $error');
      }
    }
  }

  List<AssistantContacts> _assistantContact = [];
  List<AssistantContacts> get assistantContact => _assistantContact;
  List<Assistant> _assistantList = [];
  List<Assistant> _originalAssistantList = [];
  void setContactList(List<AssistantContacts> assistants) {
    _assistantContact = assistants;
    notifyListeners();
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      List<Assistant> filteredList = [];
      for (var item in _originalAssistantList) {
        if (item.assistantName!.toLowerCase().contains(query.toLowerCase())) {
          filteredList.add(item);
        }
        if (item.contactCount!
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase())) {
          filteredList.add(item);
        }
      }
      _assistantList = filteredList;
    } else {
      _assistantList = List.from(_originalAssistantList);
    }
    notifyListeners();
  }

  void fetchAddAssistantContact(String assistantID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('authorization');
    if (kDebugMode) {
      print("access token $token");
    }
    try {
      var response = await http.get(
        Uri.parse('${ApiConstants.get_assistant_contacts}/$assistantID'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("statuscode:${response.statusCode}");
        }
        var jsonData = json.decode(response.body);
        AssistantContactModel assistantListModel =
            AssistantContactModel.fromJson(jsonData);
        setContactList(assistantListModel.assistantContacts ?? []);
      } else {
        if (kDebugMode) {
          print('Failed to fetch assistant: ${response.statusCode}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching assistant: $error');
      }
    }
  }

  // void isActivated(int index) {
  //   if (index < assistantContact.length) {
  //     var currentStatus = assistantContact[index].assistantStatus;
  //     if (currentStatus == "Active") {
  //       assistantContact[index].assistantStatus = "InActive";
  //     } else if (currentStatus == "InActive") {
  //       assistantContact[index].assistantStatus = "Active";
  //     }
  //     notifyListeners();
  //   } else {
  //     if (kDebugMode) {
  //       print("Index out of range in isActivated method");
  //     }
  //   }
  // }

  List<UpdateAssistantModel> _updateAssistant = [];
  List<UpdateAssistantModel> get updateAssistant => _updateAssistant;

  void setUpdateAssistantList(List<UpdateAssistantModel> update) {
    _updateAssistant = update;
    notifyListeners();
  }

  void fetchUpdateAssistantContact(
    String assistantID,
    int contactID,
    String status,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('authorization');
    if (kDebugMode) {
      print("access token $token");
    }
    try {
      var response = await http.get(
        Uri.parse(
            '${ApiConstants.update_assistant_status}/$assistantID/$contactID/$status'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (kDebugMode) {
        print("contactID $contactID");
        print("status $status");
      }
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("statuscode:${response.statusCode}");
        }
        var jsonData = json.decode(response.body);
        UpdateAssistantModel updateAssistant =
            UpdateAssistantModel.fromJson(jsonData);
        setUpdateAssistantList([updateAssistant]);
      } else {
        if (kDebugMode) {
          print('Failed to fetch assistant: ${response.statusCode}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching assistant: $error');
      }
    }
  }
}
