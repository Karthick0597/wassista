import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wasissta_project/widget/small_text.dart';
import '../../model_class/dashboard_model.dart';
import '../../utilities/api_constant.dart';
import '../../widget/constant.dart';
import '../../widget/string.dart';
import 'package:http/http.dart' as http;

class DashBoardScreen extends StatefulWidget {
  final bool isSelected;
  const DashBoardScreen({Key? key, required this.isSelected}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  late DashboardDetails _dashboardDetails = DashboardDetails(
    status: '',
    totalDevice: 0,
    activeDevice: 0,
    // tokens: 0,
    weeklyLabels: [],
    weeklyMessages: [],
    weeklyTokens: [],
    totalMessages: 0,
    totalConversations: 0,
    totalAssistants: 0,
    activeAssistants: 0,
    totalCampaigns: 0,
    activeCampaigns: 0,
  );

  @override
  void initState() {
    super.initState();
    fetchDashboardDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF1FFFE),
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
        body: _dashboardDetails != null
            ? ListView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Container(
                            padding: const EdgeInsets.only(top: 15),
                            height: 280,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: whiteColor),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        width: 160,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Color(0xffdef6ff)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              BoxShape.circle),
                                                  child: const Icon(
                                                    Icons.device_hub,
                                                    color: Color(0xff6675dd),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  "${_dashboardDetails.activeDevice}",
                                                  style: const TextStyle(
                                                      color: Color(0xff3a54d4),
                                                      fontFamily:
                                                          MyStrings.outfit,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                              ),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(
                                                  "Active Device",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          MyStrings.outfit),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                    Container(
                                        width: 160,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color(0xffdefce4)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              BoxShape.circle),
                                                  child: Center(
                                                    child: Icon(
                                                        Icons.device_hub,
                                                        color:
                                                            Color(0xff64a579)),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 13),
                                                child: Text(
                                                  "${_dashboardDetails.totalDevice}",
                                                  style: const TextStyle(
                                                      color: Color(0xff328345),
                                                      fontFamily:
                                                          MyStrings.outfit,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                              ),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 13),
                                                child: Text(
                                                  "Total Device",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          MyStrings.outfit),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        width: 160,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color(0xfffefff5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              BoxShape.circle),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons
                                                          .generating_tokens_outlined,
                                                      color: Color(0xffa38627),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  "${_dashboardDetails.totalDevice}",
                                                  style: const TextStyle(
                                                      color: Color(0xffa38627),
                                                      fontFamily:
                                                          MyStrings.outfit,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                              ),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(
                                                  "Tokens",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          MyStrings.outfit),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                    Container(
                                        width: 160,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color(0xffE1FEFC)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              BoxShape.circle),
                                                  child: const Icon(
                                                      Icons
                                                          .supervisor_account_outlined,
                                                      color: Color(0xff3A82AB)),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 13),
                                                child: Text(
                                                  "${_dashboardDetails.totalDevice}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff4282a6),
                                                      fontFamily:
                                                          MyStrings.outfit,
                                                      fontSize: 20),
                                                ),
                                              ),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 13),
                                                child: Text(
                                                  "Lead Count",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black,
                                                      fontFamily:
                                                          MyStrings.outfit),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 1,
                            color: whiteColor,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: whiteColor,
                              ),
                              child: SfCartesianChart(
                                primaryXAxis:
                                    const CategoryAxis(), // Check for any changes in syntax
                                title: ChartTitle(
                                  text: 'Number of messages and tokens',
                                  textStyle: TextStyle(
                                    fontFamily: MyStrings.outfit,
                                    color: blackColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                legend: Legend(isVisible: false),
                                tooltipBehavior: TooltipBehavior(enable: true),
                                series: <ColumnSeries>[
                                  ColumnSeries<_SalesData, String>(
                                    dataSource: _dashboardDetails.weeklyLabels
                                        ?.map(
                                          (label) => _SalesData(
                                            label,
                                            _dashboardDetails.weeklyMessages![
                                                _dashboardDetails.weeklyLabels!
                                                    .indexOf(label)],
                                          ),
                                        )
                                        .toList(),
                                    xValueMapper: (_SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (_SalesData sales, _) =>
                                        sales.sales,
                                    name: 'Message',
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: false),
                                  ),
                                  ColumnSeries<_SalesData, String>(
                                    dataSource: _dashboardDetails.weeklyLabels
                                        ?.map(
                                          (label) => _SalesData(
                                            label,
                                            _dashboardDetails.weeklyMessages![
                                                _dashboardDetails.weeklyLabels!
                                                    .indexOf(label)],
                                          ),
                                        )
                                        .toList(),
                                    xValueMapper: (_SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (_SalesData sales, _) =>
                                        sales.sales,
                                    name: 'Message',
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: false),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Container(
                                height: 70,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xffdef6ff)),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: primaryColor),
                                          child: const Icon(
                                            Icons.message,
                                            size: 30,
                                            color: Colors.white,
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const SmallText(
                                        color: Colors.black,
                                        text: MyStrings.totalMessage,
                                        fontFamily: MyStrings.outfit,
                                        size: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      const Spacer(),
                                      Text(
                                          _dashboardDetails.totalMessages
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: MyStrings.outfit)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 70,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xffdefce4)),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: primaryColor),
                                          child: const Icon(
                                            Icons.message,
                                            size: 30,
                                            color: Colors.white,
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const SmallText(
                                        color: Colors.black,
                                        text: MyStrings.totalConversations,
                                        fontFamily: MyStrings.outfit,
                                        size: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      const Spacer(),
                                      Text(
                                          _dashboardDetails.totalConversations
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: MyStrings.outfit)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 70,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xfffefff5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: primaryColor),
                                          child: const Icon(
                                            Icons.smart_toy_outlined,
                                            size: 30,
                                            color: Colors.white,
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SmallText(
                                            color: Colors.black,
                                            text: MyStrings.activeAssistant,
                                            fontFamily: MyStrings.outfit,
                                            size: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          SmallText(
                                            color: Colors.grey,
                                            text: MyStrings.totalAssistant,
                                            fontFamily: MyStrings.outfit,
                                            size: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        children: [
                                          Text(
                                              _dashboardDetails.activeAssistants
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily:
                                                      MyStrings.outfit)),
                                          Text(
                                              _dashboardDetails.totalAssistants
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                  fontFamily:
                                                      MyStrings.outfit)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 70,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xffE1FEFC)),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: primaryColor),
                                          child: const Icon(
                                            Icons.campaign_outlined,
                                            color: Colors.white,
                                            size: 30,
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SmallText(
                                            color: Colors.black,
                                            text: MyStrings.activeCampaigns,
                                            fontFamily: MyStrings.outfit,
                                            size: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          SmallText(
                                            color: Colors.grey,
                                            text: MyStrings.totalCampaigns,
                                            fontFamily: MyStrings.outfit,
                                            size: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        children: [
                                          Text(
                                              _dashboardDetails.activeCampaigns
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily:
                                                      MyStrings.outfit)),
                                          Text(
                                              _dashboardDetails.totalCampaigns
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                  fontFamily:
                                                      MyStrings.outfit)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : null,
      ),
    );
  }

  void fetchDashboardDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('authorization');
    if (kDebugMode) {
      print("access token $token");
    }
    try {
      var response = await http.get(
        Uri.parse(ApiConstants.get_dashboard_details),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("statuscode:${response.statusCode}");
        }
        var jsonData = json.decode(response.body);
        DashboardDetails dashboardDetails = DashboardDetails.fromJson(jsonData);
        setState(() {
          _dashboardDetails = dashboardDetails;
        });
      } else {
        if (kDebugMode) {
          print('Failed to fetch dashboard: ${response.statusCode}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching dashboard: $error');
      }
    }
  }
}

class _SalesData {
  final String year;
  final int sales;
  _SalesData(this.year, this.sales);
}
