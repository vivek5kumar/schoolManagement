import 'package:flutter/material.dart';

class TestTextfield extends StatefulWidget {
  const TestTextfield({super.key});

  @override
  State<TestTextfield> createState() => _TestTextfieldState();
}

class _TestTextfieldState extends State<TestTextfield> {
  final ctrl = [for (int i = 0; i < 100; i++) TextEditingController()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Name"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          for (int i = 0; i < 100; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: ctrl[i],
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
          MaterialButton(
            color: Colors.red,
            onPressed: () {},
            child: Text("Submit"),
          )
        ],
      )),
    );
  }
}
