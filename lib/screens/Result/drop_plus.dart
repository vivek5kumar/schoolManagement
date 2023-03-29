import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DropPage extends StatefulWidget {
  @override
  _DropPageState createState() => _DropPageState();
}

class _DropPageState extends State<DropPage> {
  String? content =
      "Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dropdown Plus Demo'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), border: Border.all()),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReadMoreText(
              content.toString(),
              trimLines: 2,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
