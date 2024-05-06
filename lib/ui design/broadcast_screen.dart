import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wasissta_project/widget/constant.dart';
import '../widget/string.dart';

import 'calender_screen.dart';

class ChatDetails {
  final String festival;
  final String template;
  final String status;
  final String date;
  final String percentage;

  ChatDetails({
    required this.festival,
    required this.template,
    required this.status,
    required this.date,
    required this.percentage,
  });
}

class MenuData {
  MenuData(this.icon, this.title);
  final IconData icon;
  final String title;
}

class BroadCastScreen extends StatefulWidget {
  final bool isSelected;
  final bool isIsClicked = false;

  const BroadCastScreen({Key? key, required this.isSelected}) : super(key: key);

  @override
  State<BroadCastScreen> createState() => _BroadCastScreenState();
}

class _BroadCastScreenState extends State<BroadCastScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final List<ChatDetails> festivalList = [
      ChatDetails(
        festival: "New year wish",
        template: "New_template_without_image",
        status: "Pending",
        date: "01-17-2024 19:28",
        percentage: '',
      ),
      ChatDetails(
        festival: "New year wish",
        template: "New_template_without_image",
        status: "Completed",
        date: "01-17-2024 19:28",
        percentage: '',
      ),
      ChatDetails(
        festival: "New year wish",
        template: "New_template_without_image",
        status: "Pending",
        date: "01-17-2024 19:28",
        percentage: '',
      ),
      ChatDetails(
        festival: "New year wish",
        template: "New_template_without_image",
        status: "Completed",
        date: "01-17-2024 19:28",
        percentage: '',
      ),
      ChatDetails(
        festival: "New year wish",
        template: "New_template_without_image",
        status: "Completed",
        date: "01-17-2024 19:28",
        percentage: '',
      ),
      ChatDetails(
        festival: "New year wish",
        template: "New_template_without_image",
        status: "Completed",
        date: "01-17-2024 19:28",
        percentage: '',
      ),
      ChatDetails(
        festival: "New year wish",
        template: "New_template_without_image",
        status: "Completed",
        date: "01-17-2024 19:28",
        percentage: '',
      ),
      ChatDetails(
        festival: "New year wish",
        template: "New_template_without_image",
        status: "Completed",
        date: "01-17-2024 19:28",
        percentage: '',
      ),
      ChatDetails(
        festival: "New year wish",
        template: "New_template_without_image",
        status: "Completed",
        date: "01-17-2024 19:28",
        percentage: '',
      ),
      ChatDetails(
        festival: "New year wish",
        template: "New_template_without_image",
        status: "Completed",
        date: "01-17-2024 19:28",
        percentage: '',
      ),
      ChatDetails(
        festival: "New year wish",
        template: "New_template_without_image",
        status: "Completed",
        date: "01-17-2024 19:28",
        percentage: '',
      ),
      ChatDetails(
        festival: "New year wish",
        template: "New_template_without_image",
        status: "Completed",
        date: "01-17-2024 19:28",
        percentage: '',
      ),
      ChatDetails(
        festival: "New year wish",
        template: "New_template_without_image",
        status: "Completed",
        date: "01-17-2024 19:28",
        percentage: '',
      ),
      ChatDetails(
        festival: "New year wish",
        template: "New_template_without_image",
        status: "Completed",
        date: "01-17-2024 19:28",
        percentage: '',
      ),
      ChatDetails(
        festival: "New year wish",
        template: "New_template_without_image",
        status: "Completed",
        date: "01-17-2024 19:28",
        percentage: '',
      ),
    ];
    return Scaffold(
      appBar: widget.isSelected == true
          ? AppBar(
              backgroundColor: whiteColor,
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: true,
              title: Text(
                "Broadcast",
                style: TextStyle(
                    fontFamily: MyStrings.outfit,
                    color: primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
            )
          : null,
      floatingActionButton: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: primaryColor),
        height: 48,
        width: 48,
        child: Icon(Icons.add, color: whiteColor),
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CalenderScreen(),
              ClipRRect(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: whiteColor,
                          blurRadius: 3, // soften the shadow
                          spreadRadius: 2, //extend the shadow
                          offset: const Offset(
                            4,
                            4,
                          ),
                        )
                      ],
                      border: Border.all(color: whiteColor, width: 0.3),
                      color: const Color(0xffFBFBFB),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextField(
                    cursorColor: primaryColor,
                    cursorHeight: 20,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search,
                          color: Color(0xffBBB2B2),
                          size: 28), // Add search icon
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          fontFamily: MyStrings.outfit,
                          color: Color(0xffB3B8C2),
                          fontSize: 16,
                          fontWeight: FontWeight.w400), // Set hint text
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: festivalList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffFBFBFB),
                      ),
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "asset/image/Rectangle 21.png",
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  festivalList[index].festival,
                                  style: const TextStyle(
                                    fontFamily: MyStrings.outfit,
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  festivalList[index].template,
                                  style: const TextStyle(
                                    fontFamily: MyStrings.outfit,
                                    fontSize: 11,
                                    color: Color(0xffB0BBB4),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 64,
                                  height: 19,
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF8ECEA),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      festivalList[index].status,
                                      style: TextStyle(
                                        fontFamily: MyStrings.outfit,
                                        color: festivalList[index].status ==
                                                "Completed"
                                            ? const Color(0xff64C974)
                                            : const Color(0xffFF0000),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 9,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          // New Container for Pending
                          if (festivalList[index].status == "Pending")
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: [
                                  CircularPercentIndicator(
                                    radius: 18,
                                    lineWidth: 3.5,
                                    percent: 0.85, // 85%
                                    center: const Center(
                                      child: Text(
                                        "85%",
                                        style: TextStyle(
                                          fontFamily: MyStrings.outfit,
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: const Color(0xff64C974),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    festivalList[index].date,
                                    style: const TextStyle(
                                      fontFamily: MyStrings.outfit,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xffB0BBB4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (festivalList[index].status == "Completed")
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: [
                                  // Add completed indicator here if needed
                                  Text(
                                    festivalList[index].date,
                                    style: const TextStyle(
                                      fontFamily: MyStrings.outfit,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xffB0BBB4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
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
  }
}
