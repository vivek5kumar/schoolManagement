import 'package:get/get.dart';
import 'package:schoolmanagement/Utils/auth.manager.dart';
import 'package:schoolmanagement/models/department.dart';

class DepartmentController extends GetxController {
  List<Data> departmentList = [];
  List<SubDepartments> subdepartmentList = [];
  String? selectDepartment;
  String? selectSubDepartment;

  department() async {
    departmentList.clear();
    await ApiManager().getDepartment().then((value) {
      if (value.status == "Success") {
        departmentList.addAll(value.data!);
      }
    });
    update();
  }

  getSubdepartmet(String name) {
    selectSubDepartment =
        null; // this use for asign null value change department
    subdepartmentList.clear();
    subdepartmentList.addAll(departmentList
        .where((element) => element.name == name)
        .first
        .subDepartments!);
    update();
  }
}
