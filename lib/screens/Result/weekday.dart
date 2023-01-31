import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeekDays extends StatefulWidget {
  WeekDays({super.key});

  @override
  State<WeekDays> createState() => _WeekDaysState();
}

class _WeekDaysState extends State<WeekDays> {
  RxList setDays = [].obs;
 
  List<String> daysCheckbox = [
    "Every day",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ];

  List<RxBool> isChecked = [for (int i = 0; i < 8; i++) RxBool(false)];

  setCheck() {
    for (int i = 0; i < setDays.length; i++) {
      for (int j = 0; j < daysCheckbox.length; j++) {
        if (setDays[i] == daysCheckbox[j].substring(0, 3).toUpperCase()) {
          isChecked[j].value = true;
        }
        ;
      }
    }
  }

  storeDays() {
    setDays.clear();
    for (int i = 0; i < isChecked.length; i++) {
      if (isChecked[i].value == true) {
        setDays.add(daysCheckbox[i].substring(0, 3).toUpperCase());
      }
    }
  }

  @override
  void initState() {
    setCheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WeekDays"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Container(
          height: 130,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      checkBox(
                          0,
                          setDays.contains("EVE") ? true.obs : false.obs,
                          true.obs),
                      checkBox(
                          4,
                          setDays.contains("THU") ? true.obs : false.obs,
                          !setDays.contains("EVE") ? true.obs : false.obs)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      checkBox(
                          1,
                          setDays.contains("MON") ? true.obs : false.obs,
                          !setDays.contains("EVE") ? true.obs : false.obs),
                      checkBox(
                          5,
                          setDays.contains("FRI") ? true.obs : false.obs,
                          !setDays.contains("EVE") ? true.obs : false.obs)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      checkBox(
                          2,
                          setDays.contains("TUE") ? true.obs : false.obs,
                          !setDays.contains("EVE") ? true.obs : false.obs),
                      checkBox(
                          6,
                          setDays.contains("SAT") ? true.obs : false.obs,
                          !setDays.contains("EVE") ? true.obs : false.obs)
                    ],
                  ),
                  Column(
                    children: [
                      checkBox(
                          3,
                          setDays.contains("WED") ? true.obs : false.obs,
                          !setDays.contains("EVE") ? true.obs : false.obs),
                      checkBox(
                          7,
                          setDays.contains("SUN") ? true.obs : false.obs,
                          !setDays.contains("EVE") ? true.obs : false.obs)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  checkBox(int index, RxBool isSet, RxBool isEnable) {
    return Obx(() => Row(
          children: [
            Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: isChecked[index].value,
                onChanged: isEnable.value
                    ? (val) async {
                        isChecked[index].value = val!;
                        if (isChecked[0].value) {
                          for (int i = 1; i < isChecked.length; i++) {
                            isChecked[i].value = false;
                          }
                        } else if (isChecked[1].value &&
                            isChecked[2].value &&
                            isChecked[3].value &&
                            isChecked[4].value &&
                            isChecked[5].value &&
                            isChecked[6].value &&
                            isChecked[7].value) {
                          for (int i = 0; i < isChecked.length; i++) {
                            isChecked[i].value = false;
                          }
                          isChecked[0].value = true;
                        }
                        storeDays();
                      }
                    : null),
            Text(daysCheckbox[index].toString())
          ],
        ));
  }
}
