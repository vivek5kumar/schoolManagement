import 'package:flutter/material.dart';

class ShowNamePage extends StatefulWidget {
  const ShowNamePage({super.key});

  @override
  State<ShowNamePage> createState() => _ShowNamePageState();
}

class _ShowNamePageState extends State<ShowNamePage> {
  String name = "Name";
  @override
  Widget build(BuildContext context) {
    final ctrl = [for (int i = 0; i < 100; i++) TextEditingController()];
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              for (int i = 0; i < 100; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: ctrl[i],
                    decoration: InputDecoration(
                        label: Text("Enter name ${i}"),
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
              MaterialButton(
                onPressed: () {
                  for (int i = 0; i < 100; i++) {
                    if (ctrl[i].text != "") {
                      setState(() {
                        name = ctrl[i].text;
                      });
                    }
                  }
                },
                child: const Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
