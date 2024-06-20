import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:wasissta_project/widget/string.dart';
import '../../widget/constant.dart';
import '../../model_class/provider_class.dart';
import 'addassistantlist.dart';

class AssistantListScreen extends StatefulWidget {
  final bool isSelected;

  const AssistantListScreen({Key? key, required this.isSelected})
      : super(key: key);

  @override
  State<AssistantListScreen> createState() => _AssistantListScreenState();
}

class _AssistantListScreenState extends State<AssistantListScreen> {
  TextEditingController editingController = TextEditingController();
  Map<int, bool> switchStates = {};

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AssistantContactListProvider()..fetchAssistantList(),
      child: Consumer<AssistantContactListProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: widget.isSelected
                ? AppBar(
                    elevation: 0,
                    backgroundColor: whiteColor,
                    notificationPredicate: (_) => false,
                    automaticallyImplyLeading: true,
                    title: Text(
                      "Assistant",
                      style: TextStyle(
                        fontFamily: MyStrings
                            .outfit, // Make sure this is correctly defined
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color:
                            primaryColor, // Make sure this is correctly defined
                      ),
                    ),
                  )
                : null,
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
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
                            provider.filterSearchResults(value);
                          },
                          controller: editingController,
                          cursorColor: primaryColor,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xffBBB2B2),
                              size: 25,
                            ), // Search icon
                            hintText: 'Search assistant', // Hint text
                            hintStyle: TextStyle(
                              color: Color(0xffBBB2B2),
                              fontFamily: MyStrings.outfit,
                            ), // Hint text color
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.4,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: provider.assistantList.length,
                        itemBuilder: (context, index) {
                          bool isSwitched = switchStates[index] ?? true;

                          return GestureDetector(
                            onTap: () {
                              provider.setIsSelected(index);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddAssistantList(
                                    name: provider.assistantList[index]
                                            .assistantName ??
                                        '',
                                    assistantId: provider
                                            .assistantList[index].assistantId ??
                                        '',
                                    contactID:
                                        "${provider.assistantList[index].contactId}" ??
                                            '',
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                height: 55,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xffF1F8F7),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Text(
                                          provider.assistantList[index]
                                                  .assistantName ??
                                              '',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: MyStrings.outfit,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Card(
                                        color: whiteColor,
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: whiteColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "${provider.assistantList[index].contactCount}",
                                              style: TextStyle(
                                                color: primaryColor,
                                                fontFamily: MyStrings.outfit,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Transform.scale(
                                      scale: 0.9,
                                      child: Switch(
                                        value: isSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            switchStates[index] = value;
                                          });
                                        },
                                        activeTrackColor: primaryColor,
                                        inactiveThumbColor: primaryColor,
                                        activeColor: whiteColor,
                                        inactiveTrackColor: whiteColor,
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
