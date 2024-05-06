import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import '../widget/constant.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration());
  }

  @override
  Widget build(BuildContext context) {
    return CalendarTimeline(
      shrink: true,
      dayNameColor: whiteColor,
      showYears: true,
      initialDate: _selectedDate,
      firstDate: DateTime(2019, 1, 15),
      lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
      onDateSelected: (date) => setState(() => _selectedDate = date),
      leftMargin: 2,
      monthColor: Colors.grey,
      dayColor: Colors.grey,
      activeDayColor: Colors.white,
      activeBackgroundDayColor: primaryColor,
      dotsColor: const Color(0xFF333A47),
      // selectableDayPredicate: (date) => date.day != 23,
      locale: 'en',
    );
  }
}
