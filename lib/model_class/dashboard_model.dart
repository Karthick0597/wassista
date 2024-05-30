
class DashboardDetails {
  String? status;
  int? totalDevice;
  int? activeDevice;
  // int? tokens;
  List<String>? weeklyLabels;
  List<int>? weeklyMessages;
  List<int>? weeklyTokens;
  int? totalMessages;
  int? totalConversations;
  int? totalAssistants;
  int? activeAssistants;
  int? totalCampaigns;
  int? activeCampaigns;

  DashboardDetails(
      {this.status,
        this.totalDevice,
        this.activeDevice,
        // this.tokens,
        this.weeklyLabels,
        this.weeklyMessages,
        this.weeklyTokens,
        this.totalMessages,
        this.totalConversations,
        this.totalAssistants,
        this.activeAssistants,
        this.totalCampaigns,
        this.activeCampaigns});

  DashboardDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalDevice = json['total_device'];
    activeDevice = json['active_device'];
    // tokens = json['tokens'];
    weeklyLabels = json['weeklyLabels'].cast<String>();
    weeklyMessages = json['weeklyMessages'].cast<int>();
    weeklyTokens = json['weeklyTokens'].cast<int>();
    totalMessages = json['total_messages'];
    totalConversations = json['total_conversations'];
    totalAssistants = json['total_assistants'];
    activeAssistants = json['active_assistants'];
    totalCampaigns = json['total_campaigns'];
    activeCampaigns = json['active_campaigns'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['total_device'] = this.totalDevice;
    data['active_device'] = this.activeDevice;
    // data['tokens'] = this.tokens;
    data['weeklyLabels'] = this.weeklyLabels;
    data['weeklyMessages'] = this.weeklyMessages;
    data['weeklyTokens'] = this.weeklyTokens;
    data['total_messages'] = this.totalMessages;
    data['total_conversations'] = this.totalConversations;
    data['total_assistants'] = this.totalAssistants;
    data['active_assistants'] = this.activeAssistants;
    data['total_campaigns'] = this.totalCampaigns;
    data['active_campaigns'] = this.activeCampaigns;
    return data;
  }
}