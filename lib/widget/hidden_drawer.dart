import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:wasissta_project/widget/constant.dart';
import 'package:wasissta_project/widget/small_text.dart';
import 'package:wasissta_project/widget/string.dart';
import '../ui design/assistant_screens/assistantlist_screen.dart';
import '../ui design/broadcast_screen.dart';
import '../ui design/contactlist_screen.dart';
import '../ui design/dash_screen/dashboard.dart';

class HiddenDrawerScreen extends StatefulWidget {
  const HiddenDrawerScreen({super.key});

  @override
  State<HiddenDrawerScreen> createState() => _HiddenDrawerScreenState();
}

class _HiddenDrawerScreenState extends State<HiddenDrawerScreen> {
  List<ScreenHiddenDrawer> _page = [];

  @override
  void initState() {
    super.initState();
    _page = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "", // Empty name for the header
          baseStyle: TextStyle(), // Empty style
          selectedStyle: TextStyle(), // Empty style
        ),
        DrawerHeaderWidget(), // Add the header widget here
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "DashBoardScreen",
          baseStyle: TextStyle(
            fontFamily: MyStrings.outfit,
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: whiteColor,
          ),
          selectedStyle: TextStyle(),
        ),
        const DashBoardScreen(
          isSelected: false,
        ),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "contact",
          baseStyle: TextStyle(
            fontFamily: MyStrings.outfit,
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: whiteColor,
          ),
          selectedStyle: TextStyle(
            fontFamily: MyStrings.outfit,
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: whiteColor,
          ),
        ),
        ContactListScreen(
          isSelected: true,
          onAssistantSelected: (String assistantName) {},
        ),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Broadcast",
          baseStyle: TextStyle(
            fontFamily: MyStrings.outfit,
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: whiteColor,
          ),
          selectedStyle: TextStyle(),
        ),
        const BroadCastScreen(
          isSelected: false,
        ),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Assistant",
          baseStyle: TextStyle(
            fontFamily: MyStrings.outfit,
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: whiteColor,
          ),
          selectedStyle: TextStyle(),
        ),
        const AssistantListScreen(
          isSelected: false,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorAppBar: whiteColor,
      actionsAppBar: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_outlined,
              color: blackColor,
            )),
        IconButton(
          onPressed: () {
            double screenHeight = MediaQuery.of(context).size.height;
            double bottomSheetHeight = screenHeight * 0.2;
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: bottomSheetHeight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SmallText(
                            text: MyStrings.ourProducts,
                            size: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: MyStrings.outfit),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                    "asset/image/logos_whatsapp-icon.png"),
                                const SizedBox(
                                  height: 10,
                                ),
                                SmallText(
                                  text: MyStrings.whatsapp,
                                  size: 13,
                                  fontFamily: MyStrings.outfit,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("asset/image/WhatsApp Business.png",
                                    height: 50),
                                const SizedBox(
                                  height: 10,
                                ),
                                SmallText(
                                  text: MyStrings.business,
                                  size: 13,
                                  fontFamily: MyStrings.outfit,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset("asset/image/instagramLogo.png"),
                                const SizedBox(
                                  height: 10,
                                ),
                                SmallText(
                                  text: MyStrings.instagram,
                                  size: 13,
                                  fontFamily: MyStrings.outfit,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor,
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          icon: Icon(
            Icons.category_outlined,
            color: blackColor,
          ),
        ),
      ],
      styleAutoTittleName: TextStyle(
          fontWeight: FontWeight.w500,
          color: primaryColor,
          fontFamily: MyStrings.outfit),
      isTitleCentered: false,
      leadingAppBar: const Icon(Icons.menu),
      backgroundColorMenu: primaryColor,
      screens: _page,
      initPositionSelected: 1, // Change initial position to skip the header
      slidePercent: 50,
      isDraggable: true,
    );
  }
}

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "asset/image/contactprofile.png", // Update with your image path
            height: 100, // Adjust the height as needed
            // errorBuilder: (context, error, stackTrace) {
            //   return Text(
            //     'Image not found',
            //     style: TextStyle(color: Colors.red),
            //   );
            // },
          ),
          SizedBox(height: 10),
          Text(
            "Your App Name",
            style: TextStyle(
              fontFamily: MyStrings.outfit,
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
