import 'package:flutter/material.dart';
import 'package:planty/components/my_theme_colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderTable extends StatefulWidget {
  const CalenderTable({Key? key}) : super(key: key);

  @override
  _CalenderTableState createState() => _CalenderTableState();
}

class _CalenderTableState extends State<CalenderTable> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: TableCalendar(
        selectedDayPredicate: (day) {
          return isSameDay(selectedDay, day);
        },
        onDaySelected: (sDay, fDay) {
          setState(() {
            selectedDay = sDay;
            focusedDay = fDay; // update `_focusedDay` here as well
          });
        },
        holidayPredicate: (day) => false,
        focusedDay: focusedDay,
        firstDay: DateTime.now().subtract(const Duration(days: 365)),
        lastDay: DateTime.now().add(const Duration(days: 365)),
        calendarFormat: CalendarFormat.week,
        calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(
              color: MyThemeColors.mainDarkGreen,
              shape: BoxShape.rectangle),
          selectedTextStyle: const TextStyle(color: Colors.white),
          defaultDecoration: const BoxDecoration(shape: BoxShape.rectangle,
          ),
          defaultTextStyle:  const TextStyle(color: Colors.black),
          isTodayHighlighted: false,
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: Colors.black),
            decoration: BoxDecoration(
                color: Colors.white, shape: BoxShape.rectangle)),
        weekendDays: const [DateTime.friday],
      ),
    );
  }
}
