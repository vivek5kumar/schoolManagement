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
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
        [
      CleanCalendarEvent("Event B",
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 13, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 15, 30),
          description: "special event"),
      CleanCalendarEvent("Event C",
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 18, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 19, 30),
          description: "special event"),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 3):
        [
      CleanCalendarEvent("Birthday Party",
          color: Colors.green,
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 20, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 23, 0),
          description: "Invited by Sapple System Pvt.Ltd"),
    ]
  };

  @override
  void initState() {
    selectedEvent = event[selectedDay] ?? [];
    super.initState();
  }

  void _handleDate(date) {
    setState(() {
      selectedDay = date;
      selectedEvent = event[selectedDay] ?? [];
    });
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Calendar(
            isExpandable: true,
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
        ),
      )),
    );
  }
}
