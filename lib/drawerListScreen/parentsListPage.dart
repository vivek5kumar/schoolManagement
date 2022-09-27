import 'package:flutter/material.dart';

class ParentsList extends StatefulWidget {
  const ParentsList({super.key});

  @override
  State<ParentsList> createState() => _ParentsListState();
}

class _ParentsListState extends State<ParentsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parents List"),
      ),
    );
  }
}
