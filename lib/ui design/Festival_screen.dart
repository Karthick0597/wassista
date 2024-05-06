import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:wasissta_project/widget/string.dart';

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

class FestivalScreen extends StatefulWidget {
  const FestivalScreen({Key? key}) : super(key: key);

  @override
  State<FestivalScreen> createState() => _FestivalScreenState();
}

class _FestivalScreenState extends State<FestivalScreen> {
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

  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: festivalList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(8), // Border radius added here
                  color: const Color(0xffFBFBFB),
                ),
                margin: const EdgeInsets.only(
                  bottom: 10,
                ), // Add bottom margin
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
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xffF8ECEA),
                              borderRadius: BorderRadius.circular(
                                  12), // Border radius added here
                            ),
                            child: Center(
                              child: Text(
                                festivalList[index].status,
                                style: TextStyle(
                                  fontFamily: MyStrings.outfit,
                                  color: festivalList[index].status == "Completed"
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
                          borderRadius: BorderRadius.circular(
                              5), // Border radius added here
                        ),
                        child: Column(
                          children: [
                            CircularPercentIndicator(
                              radius: 18,
                              lineWidth: 3.5,
                              percent: 0.85, // 85%
                              center: const Center(
                                child: Center(
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
                          borderRadius: BorderRadius.circular(
                              5), // Border radius added here
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
        ],
      ),
    );
  }
}
