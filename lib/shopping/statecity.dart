import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  var selectState;
  var selectCity;

  Map<String, String> stateCity = {
    "Surat": "Gujarat",
    "Ahmadabad": "Gujarat",
    "Vadodara": "Gujarat",
    "Indore": "Madhya Pradesh",
    "Bhopal": "Madhya Pradesh",
    "Jabalpur": "Madhya Pradesh",
    "Gwalior": "Madhya Pradesh",
    "Allahabad": "Utter Pradesh",
    "Kanpur": "Utter Pradesh",
    "Varanasi": "Utter Pradesh",
    "Fatehpur": "Utter Pradesh",
    "Faizabad": "Utter Pradesh",
    "Ludhiyana": "Punjab",
  };
  List<String> state = ['Gujarat', 'Madhya Pradesh', 'Utter Pradesh', 'Punjab'];
  List<String> city = [];
  filterCity() {
    stateCity.forEach((k, v) {
      if (selectState == v) {
        city.add(k);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DropdownButtonFormField<dynamic>(
                  isDense: true,
                  validator: (value) {
                    if (value == "Select") {
                      return "Select Semester";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  value: selectState,
                  items: state.map((items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      selectState = val.toString();
                      selectCity = null;
                      city.clear();
                      filterCity();
                    });
                  }),
              const SizedBox(
                height: 30,
              ),
              DropdownButtonFormField<dynamic>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  value: selectCity,
                  items: selectState != null
                      ? city.map((cities) {
                          return DropdownMenuItem(
                              value: cities, child: Text(cities));
                        }).toList()
                      : [],
                  onChanged: (val) {
                    setState(() {
                      selectCity = val.toString();
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
