import 'dart:io';

import 'package:bookdone/onboard/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_dio.g.dart';

/// dio의 baseOption을 전달해요
@riverpod
BaseOptions baseOptions(BaseOptionsRef ref) {
  return BaseOptions(
    baseUrl: dotenv.get('API_URL'),
    connectTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  );
}

/// dio를 가져와요
@riverpod
Dio dio(DioRef ref) {
  final baseOptions = ref.watch(baseOptionsProvider);
  final interceptors = <Interceptor>[];
  interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final accessToken =
            await ref.read(userRepositoryProvider).restoreAuth();
        options.headers
            .putIfAbsent('Authorization', () => 'Bearer $accessToken');
        // print('옵션 확인 ${options.headers}');

        handler.next(options);
      },
      onError: (e, handler) {
        // TODO: 에러 추후 처리 ex.401
        // 후속 처리를 실행한당
        // 리턴하지 않으면 이후의 처리가 모두 중단된다
        handler.next(e);
      },
    ),
  );
  return Dio(baseOptions)..interceptors.addAll(interceptors);
}
