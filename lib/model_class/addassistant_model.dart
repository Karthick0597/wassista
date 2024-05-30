class AssistantContactModel {
  String? status;
  List<AssistantContacts>? assistantContacts;

  AssistantContactModel({this.status, this.assistantContacts});

  AssistantContactModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['assistant_contacts'] != null) {
      assistantContacts = <AssistantContacts>[];
      json['assistant_contacts'].forEach((v) {
        assistantContacts!.add(new AssistantContacts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.assistantContacts != null) {
      data['assistant_contacts'] =
          this.assistantContacts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AssistantContacts {
  String? name;
  String? phone;
  String? profileImg;
  String? assistantStatus;

  AssistantContacts(
      {this.name, this.phone, this.profileImg, this.assistantStatus});

  AssistantContacts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    profileImg = json['profile_img'];
    assistantStatus = json['assistant_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['profile_img'] = this.profileImg;
    data['assistant_status'] = this.assistantStatus;
    return data;
  }
}
