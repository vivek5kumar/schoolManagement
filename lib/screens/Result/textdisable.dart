import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  MyPage({super.key});
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool submit = false;
  List<TextEditingController> controller =
      List.generate(5, (i) => TextEditingController());
  @override
  void initState() {
    super.initState();
    controller[0].addListener(() {
      setState(() {
        submit = controller[0].text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              controller: controller[0],
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              controller: controller[1],
            ),
            MaterialButton(
                onPressed: submit ? () => submitData() : null,
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }

  void submitData() {}
}
