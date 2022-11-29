import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

class HolidayCalender extends StatefulWidget {
  const HolidayCalender({super.key});

  @override
  State<HolidayCalender> createState() => _HolidayCalenderState();
}

class _HolidayCalenderState extends State<HolidayCalender> {
  DateTime selectedDay = DateTime.now();
  List<CleanCalendarEvent> selectedEvent = [];

  Map<DateTime, List<CleanCalendarEvent>> event = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent("Event A",
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: "special event"),
      CleanCalendarEvent("Event B",
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          description: "special event C "),
      CleanCalendarEvent("Event B",
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          description: "special event B"),
    ]
  };

  void _handleDate(date) {
    setState(() {
      selectedDay = date;
      selectedEvent = event[selectedDay] ?? [];
    });
  }

  @override
  void initState() {
    selectedEvent = event[selectedDay] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Holiday List"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.bottomCenter,
                // fit: BoxFit.cover,
                opacity: 1,
                repeat: ImageRepeat.repeat,
                image: NetworkImage(
                  'https://registration.iimsambalpuradmissions.in/exphd/images/background.png',
                ))),
        child: Calendar(
          startOnMonday: true,
          selectedColor: Colors.blue,
          todayColor: Colors.red,
          eventColor: Colors.green,
          bottomBarColor: Colors.deepOrange,
          onRangeSelected: (range) {
            print("Select Day ${range.from},${range.to}");
          },
          onDateSelected: (date) {
            return _handleDate(date);
          },
          events: event,
          isExpanded: true,
          dayOfWeekStyle: const TextStyle(fontSize: 15),
          weekDays: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
          hideBottomBar: false,
          hideArrows: false,
        ),
      )),
    );
  }
}
