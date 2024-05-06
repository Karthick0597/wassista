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
