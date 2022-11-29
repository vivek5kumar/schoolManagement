import 'package:get/get.dart';

class LibraryController extends GetxController {
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

  void searchBook(String searchKeyValue) {
    List<Map<String, dynamic>> bookResult = [];
    if (searchKeyValue.isEmpty) {
      bookResult = bookList;
    } else {
      bookResult = bookList
          .where((book) => book["bookName"]
              .toLowerCase()
              .contains(searchKeyValue.toLowerCase()))
          .toList();
    }
    foundBook = bookResult;
  }
}
