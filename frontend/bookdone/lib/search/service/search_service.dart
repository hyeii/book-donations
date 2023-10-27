import 'package:bookdone/search/model/book.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SearchService extends ChangeNotifier {
  List<Book> searchedList = [];

  void getBookList(String q) async {
    searchedList.clear();

    Response res = await Dio().get(
      "https://www.googleapis.com/books/v1/volumes?q=$q&startIndex=0&maxResults=10",
    );
    List items = res.data["items"];
    for (Map<String, dynamic> item in items) {
      Map<String, dynamic> volumeInfo = item["volumeInfo"];
      Book book = Book.fromJson(volumeInfo); // Map -> Book
      searchedList.add(book);
    }

    // 화면 갱신
    notifyListeners();
  }
}
