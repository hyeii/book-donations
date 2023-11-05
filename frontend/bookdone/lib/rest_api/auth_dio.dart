import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<Dio> authDio(BuildContext context) async {
  var dio = Dio();

  // final storage = new FlutterSecureStorage();

  dio.interceptors.clear();

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    // 기기에 저장된 AccessToken 로드
    SharedPreferences pref = await SharedPreferences.getInstance();
    // String? accessToken = pref.getString("accessToken");
    String accessToken =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI5IiwiaXNzIjoiYm9va2RvbmUuY29tIiwiZXhwIjoxNjk5Mjc4MzIxLCJpYXQiOjE2OTkwOTgzMjF9.zLYgXeapvsaJGpvVFA-5H_6KXNJ2C7tgkwsi3-QyFYG_JnPFfnIhyT0y-b9n9oJzeeqJc_B8VnUrOPXUIn7UMA';

    // 매 요청마다 헤더에 AccessToken을 포함
    options.headers['Authorization'] = accessToken;
    return handler.next(options);
  }, onError: (error, handler) async {
    // 인증 오류가 발생했을 경우: AccessToken의 만료
    if (error.response?.statusCode == 401) {
      var refreshDio = Dio();
      refreshDio.interceptors.clear();
      refreshDio.interceptors
          .add(InterceptorsWrapper(onError: (error, handler) async {
        return handler.next(error);
      }));
    }

    return handler.next(error);
  }));

  return dio;
}
