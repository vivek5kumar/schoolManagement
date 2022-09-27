import 'package:flutter/material.dart';
import 'package:schoolmanagement/custom_widgets/custom_sizes.dart';

class ClassTimeTable extends StatefulWidget {
  const ClassTimeTable({super.key});

  @override
  State<ClassTimeTable> createState() => _ClassTimeTableState();
}

class _ClassTimeTableState extends State<ClassTimeTable> {
  List<String> weekName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.notifications)],
        title: const Text("Class Timetable"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 35,
                    color: Colors.grey,
                  )),
              const Text("STD:Class 1-No Section"),
              InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: FontSize.s20,
                    color: Colors.grey,
                  )),
            ],
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: size.height * 0.05,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: weekName.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Text(weekName[index]),
                  );
                })),
          ),
          const Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}
