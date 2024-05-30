class ContactModel {
  String? status;
  List<UserContacts>? userContacts;
  List<AssistantContact>? assistantContact;

  ContactModel({this.status, this.userContacts, this.assistantContact});

  ContactModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['user_contacts'] != null) {
      userContacts = <UserContacts>[];
      json['user_contacts'].forEach((v) {
        userContacts!.add(UserContacts.fromJson(v));
      });
    }
    if (json['assistant_contact'] != null) {
      assistantContact = <AssistantContact>[];
      json['assistant_contact'].forEach((v) {
        assistantContact!.add(AssistantContact.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    if (this.userContacts != null) {
      data['user_contacts'] = this.userContacts!.map((v) => v.toJson()).toList();
    }
    if (this.assistantContact != null) {
      data['assistant_contact'] = this.assistantContact!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserContacts {
  int? id;
  int? userId;
  String? name;
  String? phone;
  String? createdAt;
  String? updatedAt;
  String? companyName;
  String? jobTitle;
  String? email;
  String? dateOfBirth;
  String? anniversaryDate;
  String? categoryId;
  String? countryCode;
  String? deviceUuid;
  String? devicePhone;
  String? profileImg;
  int? profileStatus;
  int? liteReceivedMsgCount;
  int? liteSentMsgCount;
  AssistantContact? assistantContact;

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
        this.devicePhone,
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
    devicePhone = json['device_phone'];
    profileImg = json['profile_img'];
    profileStatus = json['profile_status'];
    liteReceivedMsgCount = json['lite_received_msg_count'];
    liteSentMsgCount = json['lite_sent_msg_count'];
    assistantContact = json['assistant_contact'] != null
        ? AssistantContact.fromJson(json['assistant_contact'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['device_phone'] = this.devicePhone;
    data['profile_img'] = this.profileImg;
    data['profile_status'] = this.profileStatus;
    data['lite_received_msg_count'] = this.liteReceivedMsgCount;
    data['lite_sent_msg_count'] = this.liteSentMsgCount;
    if (this.assistantContact != null) {
      data['assistant_contact'] = this.assistantContact!.toJson();
    }
    return data;
  }
}

class AssistantContact {
  int? assistantId;
  int? contactId;
  String? threadId;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  String? startAt;
  String? startAtTimezone;
  List<dynamic>? fileIds;
  String? assistantName;
  String? assistantDesc;
  String? assistantAgentName;
  int? deviceId;

  AssistantContact(
      {this.assistantId,
        this.contactId,
        this.threadId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.startAt,
        this.startAtTimezone,
        this.fileIds,
        this.assistantName,
        this.assistantDesc,
        this.assistantAgentName,
        this.deviceId});

  AssistantContact.fromJson(Map<String, dynamic> json) {
    assistantId = json['assistant_id'];
    contactId = json['contact_id'];
    threadId = json['thread_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    startAt = json['start_at'];
    startAtTimezone = json['start_at_timezone'];
    fileIds = json['file_ids'];
    assistantName = json['assistant_name'];
    assistantDesc = json['assistant_desc'];
    assistantAgentName = json['assistant_agent_name'];
    deviceId = json['device_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assistant_id'] = this.assistantId;
    data['contact_id'] = this.contactId;
    data['thread_id'] = this.threadId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    data['start_at'] = this.startAt;
    data['start_at_timezone'] = this.startAtTimezone;
    data['file_ids'] = this.fileIds;
    data['assistant_name'] = this.assistantName;
    data['assistant_desc'] = this.assistantDesc;
    data['assistant_agent_name'] = this.assistantAgentName;
    data['device_id'] = this.deviceId;
    return data;
  }
}