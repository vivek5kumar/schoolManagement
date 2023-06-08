// class ApiManager {
//   var response;
//   Future<UserLoginResponse> login(_map) async {
//     var url = Uri.parse(EndPoint().userLogin);
//     response = await http.post(url, body: _map);
//     return UserLoginResponse.fromJson(jsonDecode(response.body.toString()));
//   }
// }

import 'dart:convert';

import 'package:schoolmanagement/Utils/url.dart';
import 'package:schoolmanagement/models/department.dart';
import 'package:schoolmanagement/models/login_model.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  var response;
  var url;
  Future<UserLoginResponse> getLogin(_map) async {
    var url = Uri.parse(EndPoint().userLogin);
    response = await http.post(url, body: _map);
    return UserLoginResponse.fromJson(jsonDecode(response.body.toString()));
  }

  Future<DepartmentModel> getDepartment() async {
    url = Uri.parse(EndPoint().department);
    response = await http.get(url);
    return DepartmentModel.fromJson(jsonDecode(response.body.toString()));
  }
}
