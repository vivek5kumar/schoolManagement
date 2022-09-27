import 'package:flutter/material.dart';

class BookLibrary extends StatelessWidget {
  BookLibrary({super.key});
  List bookList = [
    "Hindi",
    "English",
    "Sanskriti",
    "BioLlogy",
    "Mathematic",
    "Physics",
    "Chemistry",
    "Social Science",
    "Phsycology"
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Book Library"),
      ),
      body: ListView.builder(
          itemCount: bookList.length,
          itemBuilder: (context, index) {
            return Center(
                child: Column(
              children: [
                Container(
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()),
                    child: Text(bookList[index])),
              ],
            ));
          }),
    );
  }
}
