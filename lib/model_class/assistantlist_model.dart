class AssistantListModel {
  String? status;
  List<Assistant>? assistantList;

  AssistantListModel({this.status, this.assistantList});

  AssistantListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['assistant_list'] != null) {
      assistantList = <Assistant>[];
      json['assistant_list'].forEach((v) {
        assistantList!.add(new Assistant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.assistantList != null) {
      data['assistant_list'] =
          this.assistantList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Assistant {
  String? assistantId;
  int? contactId;
  String? status;
  String? assistantName;
  int? createdBy;
  int? deviceId;
  int? contactCount;

  Assistant(
      {this.assistantId,
      this.contactId,
      this.status,
      this.assistantName,
      this.createdBy,
      this.deviceId,
      this.contactCount});

  Assistant.fromJson(Map<String, dynamic> json) {
    assistantId = json['assistant_id']?.toString();
    contactId = json['contact_id'];
    status = json['status']?.toString();
    assistantName = json['assistant_name']?.toString();
    createdBy = json['created_by'];
    deviceId = json['device_id'];
    contactCount = json['contact_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assistant_id'] = this.assistantId;
    data['contact_id'] = this.contactId;
    data['status'] = this.status;
    data['assistant_name'] = this.assistantName;
    data['created_by'] = this.createdBy;
    data['device_id'] = this.deviceId;
    data['contact_count'] = this.contactCount;
    return data;
  }
}
