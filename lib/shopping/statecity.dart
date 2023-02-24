import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/citi_state_controller.dart';

class DropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CitiesStateController>(
      init: Get.put(CitiesStateController()),
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownFormField(
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.arrow_drop_down,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      dropdownItemFn: (dynamic item, int position, bool focused,
                              bool selected, Function() onTap) =>
                          ListTile(
                            title: Text(item['value']),
                            onTap: onTap,
                          ),
                      onChanged: (item) {
                        controller.selectState = item['value'];
                        controller.citiesFun(controller.selectState);
                      },
                      displayItemFn: (dynamic item) => Text(
                            controller.selectState,
                            style: const TextStyle(fontSize: 16),
                          ),
                      findFn: (dynamic str) async => controller.state),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IgnorePointer(
                    ignoring: controller.selectState == "Select State",
                    child: DropdownFormField(
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.arrow_drop_down,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                        ),
                        dropdownItemFn: (dynamic item,
                                int position,
                                bool focused,
                                bool selected,
                                Function() onTap) =>
                            ListTile(
                              title: Text(item.toString()),
                              onTap: onTap,
                            ),
                        onChanged: (item) {
                          controller.selectCity = item.toString();
                        },
                        displayItemFn: (dynamic item) => Text(
                              controller.selectCity,
                              style: const TextStyle(fontSize: 16),
                            ),
                        findFn: (dynamic str) async => controller.filterCity),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
