import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/library_controller.dart';
import 'package:schoolmanagement/custom_widgets/colors.dart';
import 'package:schoolmanagement/screens/Library/book_details.dart';

class BookLibrary extends StatefulWidget {
  BookLibrary({super.key});

  @override
  State<BookLibrary> createState() => _BookLibraryState();
}

class _BookLibraryState extends State<BookLibrary> {
  final libraryCtrl = Get.put(LibraryController());
  final searchCtrl = TextEditingController();
  @override
  void initState() {
    libraryCtrl.foundBook = libraryCtrl.bookList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kDarkBlueColor,
          centerTitle: true,
          title: const Text("Book Library"),
        ),
        body: RefreshIndicator(
          color: Colors.red,
          onRefresh: () async {},
          child: Container(
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  child: TextField(
                    controller: searchCtrl,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    onChanged: (val) {
                      setState(() {
                        libraryCtrl.searchBook(val);
                      });
                    },
                    decoration: InputDecoration(
                        fillColor: kDarkBlueColor,
                        filled: true,
                        hintText: "search here...",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: kDarkBlueColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'Books Name',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const Text(
                            "Prices",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: libraryCtrl.foundBook.isNotEmpty
                      ? ListView.builder(
                          itemCount: libraryCtrl.foundBook.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: InkWell(
                                onTap: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  Get.to(BookDetailsPage(
                                    name: libraryCtrl.foundBook[index]
                                        ["bookName"],
                                  ));
                                },
                                child: Card(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: kDarkBlueColor,
                                  elevation: 3,
                                  shadowColor: Colors.red,
                                  child: ListTile(
                                      title: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              libraryCtrl.foundBook[index]
                                                  ["bookName"],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                libraryCtrl.foundBook[index]
                                                        .containsKey(
                                                            "authorName")
                                                    ? Row(
                                                        children: [
                                                          const Text(
                                                            "Issued by :",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8.0),
                                                            child: Text(
                                                              libraryCtrl.foundBook[
                                                                      index][
                                                                  "authorName"],
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    : const Text(
                                                        "No author",
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      trailing: libraryCtrl.foundBook[index]
                                                  .containsKey("Price") ||
                                              libraryCtrl.foundBook[index]
                                                  .containsKey("date")
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                "Rs: ${libraryCtrl.foundBook[index]["Price"].toString()}/",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0)),
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
                      : Center(
                          child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.red[400],
                                borderRadius: BorderRadius.circular(5)),
                            child: const Center(
                              child: Text("Not available in Library",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                )
              ],
            ),
          ),
        ));
  }
}
