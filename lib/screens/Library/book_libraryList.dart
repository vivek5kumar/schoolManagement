import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/screens/Library/book_details.dart';

class BookLibrary extends StatefulWidget {
  BookLibrary({super.key});

  @override
  State<BookLibrary> createState() => _BookLibraryState();
}

class _BookLibraryState extends State<BookLibrary> {
  List<Map<String, dynamic>> bookList = [
    {
      "id": 1,
      "bookName": "Hindi",
    },
    {"id": 2, "bookName": "Communication English", "Price": 280},
    {"id": 3, "bookName": "Mathmetics", "Price": 300},
    {"id": 4, "bookName": "Networking", "Price": 500},
    {"id": 5, "bookName": "Computer", "Price": 530},
    {"id": 6, "bookName": "Electronic ", "Price": 430},
    {"id": 7, "bookName": "Electrical", "Price": 600},
    {"id": 8, "bookName": "Enviromental", "Price": 320},
    {"id": 9, "bookName": "Control System", "Price": 380},
    {
      "id": 10,
      "bookName": " Data Structures",
    },
    {"id": 11, "bookName": "Electronic Device Circuits", "Price": 380},
    {"id": 12, "bookName": "Building Materials", "Price": 380},
    {"id": 13, "bookName": "Fluid Mechanic", "Price": 380},
    {"id": 14, "bookName": "Strength of Materials", "Price": 380},
    {"id": 15, "bookName": "Surveying", "Price": 380},
    {"id": 16, "bookName": "Microprocessors", "Price": 380},
    {"id": 17, "bookName": "VLSI Technology", "Price": 380},
  ];

  List<Map<String, dynamic>> foundBook = [];

  @override
  void initState() {
    foundBook = bookList;
    super.initState();
  }

  void searchBook(String searchKeyValue) {
    List<Map<String, dynamic>> boolResult = [];
    if (searchKeyValue.isEmpty) {
      boolResult = bookList;
    } else {
      boolResult = bookList
          .where((book) => book["bookName"]
              .toLowerCase()
              .contains(searchKeyValue.toLowerCase()))
          .toList();
    }
    setState(() {
      foundBook = boolResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Book Library"),
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
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: TextField(
                  onChanged: (val) => searchBook(val),
                  decoration: InputDecoration(
                      hintText: "search here...",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Books Name',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.arrow_back),
                      const Icon(Icons.arrow_forward),
                      const Text(
                        "Prices",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: foundBook.isNotEmpty
                    ? ListView.builder(
                        itemCount: foundBook.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Get.to(BookDetailsPage(
                                  name: foundBook[index]["bookName"],
                                ));
                              },
                              child: Card(
                                elevation: 3,
                                shadowColor: Colors.red,
                                child: ListTile(
                                    title: Text(foundBook[index]["bookName"]),
                                    trailing: foundBook[index]
                                            .containsKey("Price")
                                        ? Text(foundBook[index]["Price"]
                                            .toString())
                                        : Container(
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(5.0)),
                                            width: 100,
                                            height: 30,
                                            child: const Center(
                                              child: Text(
                                                "Out of stocks",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ))),
                              ),
                            ),
                          );
                        })
                    : const Center(
                        child: Text("Not available in Library",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline)),
                      ),
              )
            ],
          ),
        ));
  }
}
