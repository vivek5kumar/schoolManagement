import 'package:get/get.dart';
import 'package:schoolmanagement/drawerListScreen/teacherListPage.dart';

class DrawerController extends GetxController {
  _onTap(int index) {
    switch (index) {
      case 0:
        {
          break;
        }
      case 1:
        {
          Get.to(const TeacherList());
          break;
        }
      case 2:
        {
          break;
        }
      case 3:
        {
          break;
        }
    }
  }
}
