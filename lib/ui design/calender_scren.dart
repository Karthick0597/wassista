import 'package:flutter/material.dart';

class ListofDay extends StatefulWidget {
  const ListofDay({super.key, this.onDaySelected, required this.height});
  final int numberOfDays = 30;
  final double height;
  final Function(String, String)? onDaySelected;
  @override
  State<ListofDay> createState() => _ListofDayState();
}

class _ListofDayState extends State<ListofDay> {
  int selectedIndex = 0;

  void select(index) {
    setState(() {
      selectedIndex = index % widget.numberOfDays;
    });
  }

  // Adjust the number of days as needed
  @override
  Widget build(BuildContext context) {
    List<DateTime> dates = generateDateList();
    List<String> days = generateDayList();

    return Container(
      height: 68,
      margin: const EdgeInsets.only(top: 24, left: 25),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: dates.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              select(index);
              widget.onDaySelected!(days[index], dates[index].toString());
            },
            child: Container(
              width: 44,
              height: widget.height,
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 12,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: selectedIndex == index
                      ? const Color(0xfffaaa14)
                      : Colors.white),
              child: Column(
                children: [
                  Text(
                    days[index],
                    style: TextStyle(
                        color: selectedIndex == index
                            ? const Color(0xffE5F9FF)
                            : const Color(0xff111111)),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${dates[index].day}",
                    style: TextStyle(
                        color: selectedIndex == index
                            ? const Color(0xffE5F9FF)
                            : const Color(0xff666666)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<DateTime> generateDateList() {
    DateTime today = DateTime.now();
    List<DateTime> dates = [];

    for (int i = 0; i < widget.numberOfDays; i++) {
      DateTime date = today.add(Duration(days: i));
      dates.add(date);
    }

    return dates;
  }

  List<String> generateDayList() {
    DateTime today = DateTime.now();
    List<String> days = [];

    for (int i = 0; i < widget.numberOfDays; i++) {
      DateTime date = today.add(Duration(days: i));
      String dayName = getDayName(date.weekday);
      days.add(dayName);
    }

    return days;
  }

  String getDayName(int dayOfWeek) {
    switch (dayOfWeek) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }
}
