import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/dashbordContro.dart';
import 'package:schoolmanagement/controller/drawerController.dart';
import 'package:schoolmanagement/controller/loginController.dart';
import 'package:schoolmanagement/custom_widgets/colors.dart';

import 'package:schoolmanagement/login/user_login.dart';

import '../../custom_widgets/custom_sizes.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({
    super.key,
  });

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final dashBordCtrl = Get.put(DashBordController());
  final loginCtrl = Get.put(LoginController());
  final drawerCtrl = Get.put(DrawerListController());

  openeDrawer() {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p14),
              child: Column(
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.blue,
                  //   ),
                  //   child: Text("School Master"),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleAvatar(
                        maxRadius: 20,
                        child: Text("Hi"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Student App"),
                          const Text("vivek.yadva@sapple.co.in")
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )),
            Flexible(
                child: ListView(
              // physics: const NeverScrollableScrollPhysics(),
              children: [
                for (int i = 0; i < drawerCtrl.drawerList.length; i++)
                  if ((i == 0 || i == 1) ||
                      (loginCtrl.isLogin &&
                          (i == 2 || i == 3 || i == 4 || i == 5 || i == 6)))
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            drawerCtrl.drawerFun(i);
                          },
                          child: ListTile(
                            leading: Icon(drawerCtrl.iconList[i]),
                            title: Text(drawerCtrl.drawerList[i]),
                          ),
                        )
                      ],
                    ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: loginCtrl.isLogin != true,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Card(
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 10),
                            child: Text(
                              "Create Your Own SoupFinder account",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? "),
                          InkWell(
                            onTap: () {
                              Get.back();
                              Get.to(() => StudentLoginPage());
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )

                //  ListView.builder(
                //     itemCount: drawerList.length,
                //     itemBuilder: (context, index) {
                //       return InkWell(
                //         onTap: () {
                //           drawerFun(index);
                //         },
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             if (index > 0)
                //               const Divider(
                //                 thickness: 1,
                //               ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text(
                //                 drawerList[index],
                //                 style: TextStyle(fontSize: FontSize.s18),
                //               ),
                //             ),
                //           ],
                //         ),
                //       );
                //     }),
                ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: openeDrawer(),
      appBar: AppBar(
        backgroundColor: kLightBlueColor,
        actions: [
          InkWell(
              onTap: () =>
                  loginCtrl.isLogin ? loginCtrl.showLogDialog(context) : null,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.logout),
              ))
        ],
        centerTitle: true,
        title: const Text("DashBoard"),
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              // childAspectRatio: 19 / 12,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0,
            ),
            itemCount: dashBordCtrl.dashboardIconList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  dashBordCtrl.onTap(index);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                        backgroundColor: dashBordCtrl.colorList[index],
                        maxRadius: 40,
                        child: GridTile(
                            child: Icon(
                          dashBordCtrl.dashboardIconList[index],
                          size: 45,
                          color: Colors.white,
                        ))),
                    Text(dashBordCtrl.dashBordName[index]),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
