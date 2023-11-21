<<<<<<< HEAD
import 'package:bookdone/search/model/book.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/retrofit.dart';

// class SearchService extends ChangeNotifier {
//   List<Book> searchedList = [];

//   void getBookList(String q) async {
//     searchedList.clear();

//     Response res = await Dio().get(
//       "https://www.googleapis.com/books/v1/volumes?q=$q&startIndex=0&maxResults=10",
//     );
//     List items = res.data["items"];
//     for (Map<String, dynamic> item in items) {
//       Map<String, dynamic> volumeInfo = item["volumeInfo"];
//       Book book = Book.fromJson(volumeInfo); // Map -> Book
//       searchedList.add(book);
//     }

//     // 화면 갱신
//     notifyListeners();
//   }
// }
// part 'search_service.g.dart';

// // String url = dotenv.get('API_URL');

// @RestApi(baseUrl: String.fromEnvironment('API_URL'))
// abstract class SearchService {
//   factory SearchService(Dio dio, {String? baseUrl}) = _SearchService;

//   @GET('/api/books/search/{title}')
//   Future<Book> searchBook(@Path() String title);

//   @GET('/api/books/detail/{isbn}')
//   Future<BookDetail> getDetailBook(@Path() String isbn);

//   @GET('/api/books/auto-completion/{title}')
//   Future<AutoList> getAutoCompletion(@Path() String title);
// }


=======
import 'package:bookdone/search/model/book.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/retrofit.dart';

// class SearchService extends ChangeNotifier {
//   List<Book> searchedList = [];

//   void getBookList(String q) async {
//     searchedList.clear();

//     Response res = await Dio().get(
//       "https://www.googleapis.com/books/v1/volumes?q=$q&startIndex=0&maxResults=10",
//     );
//     List items = res.data["items"];
//     for (Map<String, dynamic> item in items) {
//       Map<String, dynamic> volumeInfo = item["volumeInfo"];
//       Book book = Book.fromJson(volumeInfo); // Map -> Book
//       searchedList.add(book);
//     }

//     // 화면 갱신
//     notifyListeners();
//   }
// }
// part 'search_service.g.dart';

// // String url = dotenv.get('API_URL');

// @RestApi(baseUrl: String.fromEnvironment('API_URL'))
// abstract class SearchService {
//   factory SearchService(Dio dio, {String? baseUrl}) = _SearchService;

//   @GET('/api/books/search/{title}')
//   Future<Book> searchBook(@Path() String title);

//   @GET('/api/books/detail/{isbn}')
//   Future<BookDetail> getDetailBook(@Path() String isbn);

//   @GET('/api/books/auto-completion/{title}')
//   Future<AutoList> getAutoCompletion(@Path() String title);
// }


>>>>>>> origin/front
// Futurebuilder 와야대