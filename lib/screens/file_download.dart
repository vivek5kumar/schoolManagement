import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FilePage extends StatefulWidget {
  const FilePage({super.key});

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  FilePickerResult? result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (result != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selected file:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: result?.files.length ?? 0,
                      itemBuilder: (context, index) {
                        return Text(result?.files[index].name ?? '',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold));
                      })
                ],
              ),
            ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                result =
                    await FilePicker.platform.pickFiles(allowMultiple: true);
                if (result == null) {
                  print("No file selected");
                } else {
                  setState(() {});
                  result?.files.forEach((element) {
                    print(element.name);
                  });
                }
              },
              child: const Text("File Picker"),
            ),
          ),
        ],
      ),
    );
  }
}
