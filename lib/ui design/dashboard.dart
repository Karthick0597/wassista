import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wasissta_project/widget/small_text.dart';
import '../widget/constant.dart';
import '../widget/string.dart';
import 'contactlist_screen.dart';

class DashBoardScreen extends StatefulWidget {
  final bool isSelected;
  const DashBoardScreen({Key? key, required this.isSelected}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<_SalesData> data = [
    _SalesData('Mon', 28),
    _SalesData('Tue', 34),
    _SalesData('Wed', 32),
    _SalesData('Thu', 40),
    _SalesData('Fri', 38),
    _SalesData('Sat', 42),
    _SalesData('Sun', 35),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: widget.isSelected
            ? AppBar(
          elevation: 0,
          backgroundColor: whiteColor,
          notificationPredicate: (_) => false,
                automaticallyImplyLeading: true,
                title: Text(
                  "Dashboard",
                  style: TextStyle(
                    fontFamily:
                        MyStrings.outfit, // Make sure this is correctly defined
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    color: primaryColor, // Make sure this is correctly defined
                  ),
                ),
              )
            : null,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SmallText(
                    text: MyStrings.device,
                    fontWeight: FontWeight.w400,
                    fontFamily: MyStrings.outfit,
                    size: 18),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: [
                      CircularPercentIndicator(
                        radius: 50.0,
                        lineWidth: 9.0,
                        percent: 0.5,
                        progressColor: primaryColor,
                        center: Card(
                          shape: const CircleBorder(),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle
                            ),
                            child: SizedBox(
                              height: 60,
                              width: 60,
                              child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                      color: Color(0xffE7FDF1),
                                      shape: BoxShape.circle
                                  ),
                                  child: const Icon(Icons.phone_android_outlined)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Color(0xffC0C0C0),
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Center(
                                child: Text("18",
                                    style: TextStyle(
                                        fontFamily: MyStrings.outfit,
                                        fontSize: 13,color: whiteColor))),
                            Center(
                                child: SmallText(
                              text: MyStrings.totalDevice,
                              fontFamily: MyStrings.outfit,
                              color: whiteColor,
                              size: 10,
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Center(
                                child: Text("9",
                                    style: TextStyle(
                                        fontFamily: MyStrings.outfit,
                                        fontSize: 13,color: whiteColor))),
                            Center(
                                child: SmallText(
                              text: MyStrings.active,
                              fontFamily: MyStrings.outfit,
                              color: whiteColor,
                              size: 10,
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor,
                              blurRadius: 1.5, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                              offset: const Offset(
                                0.5, // Move to right 5  horizontally
                                0.5, // Move to bottom 5 Vertically
                              ),
                            )
                          ],
                        borderRadius: BorderRadius.circular(8),
                        color: whiteColor
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: SfCartesianChart(
                        primaryXAxis: const CategoryAxis(),
                        title: ChartTitle(
                            text: 'Number of message',
                            textStyle: TextStyle(
                                fontFamily: MyStrings.outfit,
                                color: blackColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14)),
                        legend: const Legend(isVisible: false),
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <CartesianSeries>[
                          ColumnSeries<_SalesData, String>(
                            borderRadius: BorderRadius.circular(6),
                            color: primaryColor,
                            dataSource: data,
                            xValueMapper: (_SalesData sales, _) => sales.year,
                            yValueMapper: (_SalesData sales, _) => sales.sales,
                            name: 'Message',
                            width: 0.4,
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 170,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primaryColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmallText(
                            color: whiteColor,
                            text: MyStrings.totalMessage,
                            fontFamily: MyStrings.outfit,
                            size: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          Text("1244",style: TextStyle(color: whiteColor,fontSize: 13,fontFamily: MyStrings.outfit)),
                        ],
                      ),
                    ),
                    Container(
                      width: 170,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primaryColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmallText(
                            color: whiteColor,
                            text: MyStrings.highestMessage,
                            fontFamily: MyStrings.outfit,
                            size: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          Text("1267",style: TextStyle(color: whiteColor,fontSize: 13,fontFamily: MyStrings.outfit)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const SmallText(
                    text: MyStrings.token,
                    fontWeight: FontWeight.w400,
                    fontFamily: MyStrings.outfit,
                    size: 18),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 160,
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: const Color(0xffF1FFFE)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.smart_toy_rounded,
                            size: 25,
                            color: primaryColor,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const SmallText(
                              text: MyStrings.activeAssistant,
                              fontWeight: FontWeight.w300,
                              fontFamily: MyStrings.outfit,
                              size: 14),
                          const SizedBox(
                            height: 15,
                          ),
                          CircularPercentIndicator(
                            radius: 35.0,
                            lineWidth: 6.0,
                            percent: 0.7,
                            center: const Text("6/10"),
                            progressColor: primaryColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: const Color(0xffF1FFFE)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.message_outlined,
                            size: 25,
                            color: primaryColor,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const SmallText(
                              text: MyStrings.availableMessages,
                              fontWeight: FontWeight.w300,
                              fontFamily: MyStrings.outfit,
                              size: 14),
                          const SizedBox(
                            height: 15,
                          ),
                          CircularPercentIndicator(
                            radius: 35.0,
                            lineWidth: 6.0,
                            percent: 0.5,
                            center: const Text("57%"),
                            progressColor: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
