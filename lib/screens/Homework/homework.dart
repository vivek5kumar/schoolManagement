import 'package:flutter/material.dart';

class HomeworkPage extends StatefulWidget {
  HomeworkPage({super.key});

  @override
  State<HomeworkPage> createState() => _HomeworkPageState();
}

class _HomeworkPageState extends State<HomeworkPage> {
  List<Map<String, dynamic>> allProduct = [];

  List<Map<String, dynamic>> newProduct = [];
  @override
  void initState() {
    newProduct = allProduct;
    super.initState();
  }

  void searchProduct(String searchKey) {
    List<Map<String, dynamic>> resultProduct = [];
    if (searchKey.isEmpty) {
      resultProduct = allProduct;
    } else {
      resultProduct = allProduct
          .where((product) =>
              product["name"].toLowerCase().contains(searchKey.toLowerCase()))
          .toList();
    }
    setState(() {
      newProduct = resultProduct;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homework List"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text("coming soon...")],
        ),
      ),
    );
  }
}
