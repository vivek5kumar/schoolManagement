import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';

class DropPage extends StatefulWidget {
  @override
  _DropPageState createState() => _DropPageState();
}

class _DropPageState extends State<DropPage> {
  String selectState = "Select";
  String selectCity = "Select";
  final List<Map<String, dynamic>> _roles = [
    {"name": "Super Admin", "desc": "Having full access rights", "role": 1},
    {
      "name": "Admin",
      "desc": "Having full access rights of a Organization",
      "role": 2
    },
    {
      "name": "Manager",
      "desc": "Having Magenent access rights of a Organization",
      "role": 3
    },
    {
      "name": "Technician",
      "desc": "Having Technician Support access rights",
      "role": 4
    },
    {
      "name": "Customer Support",
      "desc": "Having Customer Support access rights",
      "role": 5
    },
    {"name": "User", "desc": "Having End User access rights", "role": 6},
  ];

  List<Map<String, dynamic>> stateName = [
    {"id": 0, "value": "Select"},
    {"id": 1, "value": "Utter-Pradesh"},
    {"id": 2, "value": "Madhya-Pradesh"},
    {"id": 3, "value": "Gujrat"},
    {"id": 4, "value": "Maharastra"},
    {"id": 5, "value": "Banguluru"},
    {"id": 6, "value": "Asam"},
    {"id": 7, "value": "Sikkim"},
    {"id": 8, "value": "Arunanchal"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Plus Demo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownFormField<Map<String, dynamic>>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.arrow_drop_down),
                // labelText: "State"
              ),
              validator: (val) {
                if (val!.isEmpty) {
                  return "required";
                }
              },
              onChanged: (dynamic val) {
                if (val != null) {
                  selectState = val.toString();
                }
              },
              displayItemFn: (dynamic item) => Text(
                (item ?? {})['value'] ?? '',
                style: const TextStyle(fontSize: 16),
              ),
              findFn: (dynamic str) async => stateName,
              filterFn: (dynamic item, str) =>
                  item['value'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
              dropdownItemFn: (dynamic item, int position, bool focused,
                      bool selected, Function() onTap) =>
                  ListTile(
                title: Text(item['value']),
                onTap: onTap,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            DropdownFormField<dynamic>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.arrow_drop_down),
                // labelText: "Access"
              ),
              validator: (val) {
                if (val!.isEmpty) {
                  return "required";
                }
              },
              onChanged: (dynamic val) {
                selectCity = val.toString();
              },
              displayItemFn: (dynamic item) => Text(
                (item ?? {})['name'] ?? '',
                style: const TextStyle(fontSize: 16),
              ),
              findFn: (dynamic str) async => _roles,
              filterFn: (dynamic item, str) =>
                  item['name'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
              dropdownItemFn: (dynamic item, int position, bool focused,
                      bool selected, Function() onTap) =>
                  ListTile(
                title: Text(item['name']),
                subtitle: Text(
                  item['desc'] ?? '',
                ),
                onTap: onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
