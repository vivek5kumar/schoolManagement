import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeBoard extends StatefulWidget {
  NoticeBoard({super.key});

  @override
  State<NoticeBoard> createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  var pageNo = [
    "vivek",
    "anand",
    "mnaosh",
    "rohan",
    "vaibhav",
  ];

  int initialPage = 0;
  int index = 0;

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 50,
              child: Text("Questions: ${index + 1}/${pageNo.length}")),
          Expanded(
            child: Card(
              child: PageView.builder(
                  allowImplicitScrolling: true,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _controller,
                  itemCount: pageNo.length,
                  onPageChanged: (page) {
                    setState(() {
                      index = page;
                    });
                  },
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        SizedBox(
                            width: 250,
                            height: 500,
                            child: Text(pageNo[i].toString()))
                      ],
                    );
                  }),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Visibility(
                visible: index > 0,
                child: ElevatedButton(
                  child: const Text('Prev Page'),
                  onPressed: () {
                    // Get.snackbar("Error", "${index}");
                    setState(() {
                      _controller.previousPage(
                          duration: const Duration(microseconds: 500),
                          curve: Curves.ease);
                    });
                  },
                ),
              ),
              ElevatedButton(
                child: const Text('Next Page'),
                onPressed: () {
                  setState(() {
                    _controller.nextPage(
                        duration: const Duration(microseconds: 500),
                        curve: Curves.ease);
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
