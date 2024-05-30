import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:wasissta_project/ui%20design/dash_screen/dashboard.dart';
import 'package:wasissta_project/widget/small_text.dart';
import 'package:wasissta_project/widget/string.dart';
import '../service/service.dart';
import '../ui design/contactlist_screen.dart';
import '../ui design/signinscreen.dart';
import 'constant.dart';
import '../ui design/assistant_screens/assistantlist_screen.dart';
import '../ui design/broadcast_screen.dart';
import 'hidden_drawer.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  bool isSelected = false;
  final List<Widget> _children = [
    const DashBoardScreen(
      isSelected: false,
    ),
    ContactListScreen(
      isSelected: true,
      onAssistantSelected: (String assistantName) {},
    ),
    const BroadCastScreen(
      isSelected: false,
    ),
    const AssistantListScreen(
      isSelected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        scrolledUnderElevation: 0,
        title: _currentIndex == 0
            ? Text(
                "Dashboard",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: primaryColor,
                ),
              )
            : _currentIndex == 1
                ? Text(
                    "contact",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: primaryColor,
                    ),
                  )
                : _currentIndex == 2
                    ? Text(
                        "Broadcast",
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          color: primaryColor,
                        ),
                      )
                    : Text(
                        "Assistant",
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          color: primaryColor,
                        ),
                      ),
        actions: [
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
                                  Image.asset(
                                      "asset/image/WhatsApp Business.png",
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
          // SizedBox(width: 10,),
          // Padding(
          //   padding: const EdgeInsets.only(right: 8),
          //   child: Text("Import",style: TextStyle(fontFamily: MyStrings.outfit,color: primaryColor),),
          // ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Dashboard",
        labels: const ["Dashboard", "Contact", "Broadcast", "Assistant"],
        icons: const [
          Icons.dashboard_outlined,
          Icons.person_outline_outlined,
          Icons.send_outlined,
          Icons.home_max_outlined,
        ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: primaryColor,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: primaryColor,
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.white,
        onTabItemSelected: (int value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
      drawer: HiddenDrawerScreen(),

      // Drawer(
      //   width: MediaQuery.of(context).size.width / 1.1,
      //   backgroundColor: const Color(0xffFFFFFF),
      //   child: Container(
      //     decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.topRight,
      //         colors: [Color(0xffCAFCFF), Color(0xffFFFFFF)],
      //         // Add more colors as needed
      //       ),
      //     ),
      //     child: ListView(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.only(top: 30, left: 15),
      //           child: Row(
      //             children: [
      //               Image.asset(
      //                 "asset/image/drawerpicture.png",
      //               ),
      //               const SizedBox(
      //                 width: 20,
      //               ),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     "Praveen",
      //                     style: TextStyle(
      //                       fontFamily: MyStrings.outfit,
      //                       color: primaryColor,
      //                       fontWeight: FontWeight.w500,
      //                       fontSize: 16,
      //                     ),
      //                   ),
      //                   const Text(
      //                     "abcd@gmail.com",
      //                     style: TextStyle(
      //                       fontFamily: MyStrings.outfit,
      //                       color: Color(0xff8B8E8C),
      //                       fontWeight: FontWeight.w500,
      //                       fontSize: 16,
      //                     ),
      //                   ),
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 30,
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(left: 15),
      //           child: Column(
      //             children: [
      //               TextButton(
      //                 style: ButtonStyle(
      //                   textStyle: MaterialStateProperty.all<TextStyle>(
      //                     TextStyle(
      //                       color: blackColor,
      //                       fontWeight: FontWeight.w300,
      //                       fontSize: 16,
      //                     ),
      //                   ),
      //                 ),
      //                 onPressed: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) => const DashBoardScreen(
      //                         isSelected: true,
      //                       ),
      //                     ),
      //                   );
      //                 },
      //                 child: Row(
      //                   children: [
      //                     Icon(Icons.dashboard_outlined, color: primaryColor),
      //                     const SizedBox(width: 8),
      //                     Text('Dashboard',
      //                         style: TextStyle(
      //                             color: primaryColor,
      //                             fontFamily: MyStrings.outfit)),
      //                   ],
      //                 ),
      //               ),
      //               TextButton(
      //                 onPressed: () {},
      //                 child: Row(
      //                   children: [
      //                     Icon(Icons.view_module_outlined, color: primaryColor),
      //                     const SizedBox(width: 8),
      //                     Text(
      //                       'Templates',
      //                       style: TextStyle(
      //                           color: primaryColor,
      //                           fontWeight: FontWeight.w300,
      //                           fontSize: 16,
      //                           fontFamily: MyStrings.outfit),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               TextButton(
      //                 onPressed: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) => const BroadCastScreen(
      //                         isSelected: true,
      //                       ),
      //                     ),
      //                   );
      //                 },
      //                 child: Row(
      //                   children: [
      //                     Icon(Icons.wifi_tethering, color: primaryColor),
      //                     const SizedBox(width: 8),
      //                     Text(
      //                       'Broadcast',
      //                       style: TextStyle(
      //                           color: primaryColor,
      //                           fontWeight: FontWeight.w300,
      //                           fontSize: 16,
      //                           fontFamily: MyStrings.outfit),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               TextButton(
      //                 onPressed: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) => ContactListScreen(
      //                         isSelected: true,
      //                         onAssistantSelected: (String assistantName) {},
      //                       ),
      //                     ),
      //                   );
      //                 },
      //                 child: Row(
      //                   children: [
      //                     Icon(Icons.person_outline_outlined,
      //                         color: primaryColor),
      //                     const SizedBox(width: 8),
      //                     Text(
      //                       'contact',
      //                       style: TextStyle(
      //                           color: primaryColor,
      //                           fontWeight: FontWeight.w300,
      //                           fontSize: 16,
      //                           fontFamily: MyStrings.outfit),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               TextButton(
      //                 onPressed: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) => const AssistantListScreen(
      //                         isSelected: true,
      //                       ),
      //                     ),
      //                   );
      //                 },
      //                 child: Row(
      //                   children: [
      //                     Icon(Icons.assignment_ind_outlined,
      //                         color: primaryColor),
      //                     const SizedBox(width: 8),
      //                     Text(
      //                       'Assistant',
      //                       style: TextStyle(
      //                           color: primaryColor,
      //                           fontWeight: FontWeight.w300,
      //                           fontSize: 16,
      //                           fontFamily: MyStrings.outfit),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               const SizedBox(
      //                 height: 40,
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(right: 20, top: 40),
      //                 child: Divider(thickness: 0.5, color: dividerLineColor),
      //               ),
      //               TextButton(
      //                 onPressed: () {},
      //                 child: Row(
      //                   children: [
      //                     Icon(Icons.person_outline_outlined,
      //                         color: primaryColor),
      //                     const SizedBox(width: 8),
      //                     Text(
      //                       'My Profile',
      //                       style: TextStyle(
      //                           color: primaryColor,
      //                           fontWeight: FontWeight.w300,
      //                           fontSize: 16,
      //                           fontFamily: MyStrings.outfit),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               TextButton(
      //                 onPressed: () {},
      //                 child: Row(
      //                   children: [
      //                     Icon(Icons.shopping_bag_outlined,
      //                         color: primaryColor),
      //                     const SizedBox(width: 8),
      //                     Text(
      //                       'Subscription',
      //                       style: TextStyle(
      //                           color: primaryColor,
      //                           fontWeight: FontWeight.w300,
      //                           fontSize: 16,
      //                           fontFamily: MyStrings.outfit),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               TextButton(
      //                 onPressed: () {},
      //                 child: Row(
      //                   children: [
      //                     Icon(Icons.assignment_ind_outlined,
      //                         color: primaryColor),
      //                     const SizedBox(width: 8),
      //                     Text(
      //                       'Api Config',
      //                       style: TextStyle(
      //                           color: primaryColor,
      //                           fontWeight: FontWeight.w300,
      //                           fontSize: 16,
      //                           fontFamily: MyStrings.outfit),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               TextButton(
      //                 onPressed: () {},
      //                 child: Row(
      //                   children: [
      //                     Icon(Icons.support_outlined, color: primaryColor),
      //                     const SizedBox(width: 8),
      //                     Text(
      //                       'Support',
      //                       style: TextStyle(
      //                           color: primaryColor,
      //                           fontWeight: FontWeight.w300,
      //                           fontSize: 16,
      //                           fontFamily: MyStrings.outfit),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               const SizedBox(
      //                 height: 40,
      //               ),
      //               GestureDetector(
      //                 onTap: () {
      //                   _logOut(context);
      //                 },
      //                 child: Container(
      //                   width: MediaQuery.of(context).size.width / 1.2,
      //                   height: 40,
      //                   decoration: BoxDecoration(
      //                     color: primaryColor,
      //                     borderRadius: BorderRadius.circular(9),
      //                   ),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       IconButton(
      //                           onPressed: () {},
      //                           icon: const Icon(Icons.logout_outlined,
      //                               color: Colors.white, size: 20)),
      //                       const SmallText(
      //                         text: MyStrings.logOut,
      //                         size: 16,
      //                         fontFamily: MyStrings.outfit,
      //                         fontWeight: FontWeight.w400,
      //                         color: Colors.white,
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //               const SizedBox(
      //                 height: 30,
      //               )
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  _logOut(BuildContext context) async {
    // startLoader();
    Webservice().callLogOutService(context).then((onResponse) async {
      // stopLoader();
      if (onResponse != null) {
        if (kDebugMode) {
          print(onResponse.success);
        }
        if (onResponse.success == true) {
          await Future.delayed(const Duration(milliseconds: 800));
          Future.microtask(() {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const SignInScreen()),
              (route) => false,
            );
          });
          Fluttertoast.showToast(msg: 'Logout Successfully');
        } else {
          Fluttertoast.showToast(msg: "Failed to logout");
        }
      }
    }).catchError((error) {
      // stopLoader();
      if (kDebugMode) {
        print(error);
      }
    });
  }

// startLoader() {
//   LoadingDialog.showLoaderDialog(context, 'Please Wait..');
// }
//
// stopLoader() {
//   Navigator.of(context).pop();
// }
}
