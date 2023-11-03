import 'package:bookdone/search/model/book.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

// String url = dotenv.get('API_URL');

@RestApi(baseUrl: String.fromEnvironment('API_URL'))
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/api/books/search/{title}')
  Future<Book> searchBook(@Path() String title);

  @GET('/api/books/detail/{isbn}')
  Future<BookDetail> getDetailBook(@Path() String isbn);

  @GET('/api/books/auto-completion/{title}')
  Future<AutoList> getAutoCompletion(@Path() String title);
}
