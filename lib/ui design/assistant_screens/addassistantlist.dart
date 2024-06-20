import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasissta_project/model_class/provider_class.dart';
import 'package:wasissta_project/widget/constant.dart';
import 'package:wasissta_project/widget/string.dart';

class AddAssistantList extends StatefulWidget {
  final String name;
  final String assistantId;
  final String contactID;

  const AddAssistantList({
    super.key,
    required this.name,
    required this.assistantId,
    required this.contactID,
  });

  @override
  State<AddAssistantList> createState() => _AddAssistantListState();
}

class _AddAssistantListState extends State<AddAssistantList> {
  late List<String> updateStatusList;
  String? updateStatus = "";

  @override
  void initState() {
    super.initState();
    updateStatusList = [];
  }

  void toggleStatus(
      int index, AssistantContactListProvider provider, String name) {
    setState(() {
      updateStatusList[index] = updateStatusList[index] == "Active"
          ? "Inactive"
          : updateStatusList[index] == "Inactive"
              ? "Active"
              : "Deleted";
      if (updateStatusList[index] == "Active") {
        updateStatus = "Active";
      } else if (updateStatusList[index] == "Inactive") {
        updateStatus = "Inactive";
      } else {
        updateStatus = "Deleted";
      }
      // No API call in Deleted Status
      if (updateStatusList[index] == "Deleted") {
      } else {
        //API call for changing status
        AssistantContactListProvider().fetchUpdateAssistantContact(
            widget.assistantId,
            provider.assistantContact[index].contactId ?? 1,
            updateStatus ?? '');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 800),
            content: Text(
              'Status changed to ${updateStatusList[index]}',
              style:
                  const TextStyle(fontFamily: MyStrings.outfit, fontSize: 12),
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AssistantContactListProvider>(
      create: (_) => AssistantContactListProvider()
        ..fetchAddAssistantContact(widget.assistantId),
      builder: (context, child) {
        final provider = Provider.of<AssistantContactListProvider>(context);
        if (updateStatusList.isEmpty && provider.assistantContact.isNotEmpty) {
          updateStatusList = provider.assistantContact
              .map((contact) => contact.assistantStatus ?? "Inactive")
              .toList();
        }

        return Scaffold(
          appBar: AppBar(
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.more_vert),
              ),
            ],
            backgroundColor: scaffoldBodyColor,
            centerTitle: true,
            title: Text(
              widget.name,
              style:
                  const TextStyle(fontSize: 16, fontFamily: MyStrings.outfit),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Column(
              children: [
                provider.assistantContact.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                          strokeWidth: 4,
                          backgroundColor: Colors.grey,
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: provider.assistantContact.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: provider
                                          .assistantContact[index].profileImg ??
                                      '',
                                  width: 40,
                                  height: 40,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Icon(
                                    Icons.error,
                                    color: inActiveColor,
                                    size: 45,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        provider.assistantContact[index].name ??
                                            '',
                                        style: const TextStyle(
                                          fontFamily: MyStrings.outfit,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        provider.assistantContact[index]
                                                .phone ??
                                            '',
                                        style: const TextStyle(
                                          fontFamily: MyStrings.outfit,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    toggleStatus(
                                      index,
                                      provider,
                                      provider.assistantContact[index].name ??
                                          '',
                                    );
                                    if (kDebugMode) {
                                      print("$index");
                                    }
                                  },
                                  child: Container(
                                    width: 75,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      color: updateStatusList[index] == "Active"
                                          ? primaryColor
                                          : updateStatusList[index] ==
                                                  "Inactive"
                                              ? inActiveColor
                                              : Colors.grey,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Text(
                                        updateStatusList[index],
                                        style: TextStyle(
                                          fontFamily: MyStrings.outfit,
                                          fontSize: 10,
                                          color: updateStatusList[index] ==
                                                  "Deleted"
                                              ? whiteColor
                                              : whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
