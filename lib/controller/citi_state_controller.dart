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
    {"value": "Karnataka"},
    {"value": "Chennai"},
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
    },
    {
      "id": "Karnataka",
      "value": ["Vijayanagara", " Davanagere", "Chamarajanagara", " Ramanagara"]
    },
    {
      "id": "Chennai",
      "value": [
        "Aminjikarai",
        "Madhavaram",
        "Purasawalkam",
        "Shollinganallur",
        "Thiruvottiyur"
      ]
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
