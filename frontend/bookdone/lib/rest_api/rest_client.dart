import 'package:bookdone/onboard/model/user_res.dart';
import 'package:bookdone/rest_api/app_dio.dart';
import 'package:bookdone/rest_api/auth_dio.dart';
import 'package:bookdone/search/model/book.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rest_client.g.dart';

@riverpod
RestClient restApiClient(RestApiClientRef ref) {
  return RestClient(ref.watch(dioProvider));
}

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  // @Header({'Authorization : $subToken'})
  @GET('/api/books/search/{title}')
  Future<Book> searchBook(@Path() String title);

  @GET('/api/books/detail/{isbn}')
  Future<BookDetail> getDetailBook(@Path() String isbn);

  @GET('/api/books/auto-completion/{title}')
  Future<AutoList> getAutoCompletion(@Path() String title);

  @GET('/api/members/check-nickname/{nickname}')
  Future<CheckNickname> checkNickname(@Path() String nickname);

  @PATCH('/api/members/additional-info')
  Future<void> postAdditionalInfo(@Body() Map<String, dynamic> map);
}
