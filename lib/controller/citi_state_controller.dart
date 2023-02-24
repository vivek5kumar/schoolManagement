import 'package:get/get.dart';

class CitiesStateController extends GetxController {
  String selectState = "Select State";
  String selectCity = "Select City";
  List state = [
    {"value": "Select State"},
    {"value": "Mumbai"},
    {"value": "Madhya Pradesh"},
    {"value": "Uttar Pradesh"},
    {"value": "Gujarat"},
  ];

  List stateCity = [
    {
      "id": "Mumbai",
      "value": ["Andheri", "Bandra", "Dahisar", "Boribali", "Goregaov"]
    },
    {
      "id": "Madhya Pradesh",
      "value": [
        "Gwaliar",
        "Bhpal",
        "Indor",
        "Jablpur",
        "Ujjain",
        "Sagar",
        "Satana"
      ]
    },
    {
      "id": "Uttar Pradesh",
      "value": ["Allahabad", "Lucknow", "Varanasi", "Jhansi", "Kanpur"]
    },
    {
      "id": "Gujarat",
      "value": ["Varodara", "Rajkot", "Patan", "Anand", "Baruch"]
    }
  ];
  var filterCity = [];
  citiesFun(value) {
    filterCity.clear();
    if (value == "Select State") {
    } else {
      if (stateCity.where((element) {
        return element['id'] == value;
      }).isNotEmpty) {
        filterCity.add("Select City");

        var data = stateCity.where((element) {
          return element['id'] == value;
        }).first['value'];

        filterCity.addAll(data);
      }
    }
    update();
  }
}
