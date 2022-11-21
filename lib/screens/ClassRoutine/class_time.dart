import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/classController.dart';

class ClassTimeTable extends StatefulWidget {
  const ClassTimeTable({super.key});

  @override
  State<ClassTimeTable> createState() => _ClassTimeTableState();
}

class _ClassTimeTableState extends State<ClassTimeTable> {
  final classCtrl = Get.put(ClassController());

  // int index = 0;
  // weekIncrease(isIncrease) {
  //   if (isIncrease ? (index < 6) : (index > 0)) {
  //     setState(() {
  //       isIncrease ? index++ : index--;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Icons.notifications),
          ),
        ],
        title: const Text("Class Timetable"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.bottomCenter,
                // fit: BoxFit.cover,
                opacity: 1,
                repeat: ImageRepeat.repeat,
                image: NetworkImage(
                  'https://registration.iimsambalpuradmissions.in/exphd/images/background.png',
                ))),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          classCtrl.weekFun(false);
                        });
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 35,
                        color: Colors.blue,
                      )),
                  const Text(
                    "STD:Class 1-No Section",
                    style: TextStyle(fontSize: 17),
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          classCtrl.weekFun(true);
                        });
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 35,
                        color: Colors.blue,
                      )),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            SizedBox(
              height: size.height * 0.05,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: classCtrl.weekName.length,
                  shrinkWrap: true,
                  itemBuilder: ((context, i) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                  color: classCtrl.index == i
                                      ? Colors.blue[200]
                                      : null),
                              child: Center(
                                  child: Text(
                                classCtrl.weekName[i],
                              ))),
                        ),
                      ],
                    );
                  })),
            ),
            const Divider(
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
