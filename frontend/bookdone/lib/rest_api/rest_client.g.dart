// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://k9a308.p.ssafy.io:8000';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Book> searchBook(String title) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Book>(Options(
      method: 'GET',
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI2IiwiaXNzIjoiYm9va2RvbmUuY29tIiwiZXhwIjoxNjk5MTU3Mzc3LCJpYXQiOjE2OTg5NzczNzd9.frLOrgTajuakbtTiK5MWDOyUaiP9su906TTD2Dfa3NN2HYNDT6PDzc4Mzo_hFd2X8wn-AF8cz_KJp-lFt2eKEQ'
      },
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/books/search/${title}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Book.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BookDetail> getDetailBook(String isbn) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BookDetail>(Options(
      method: 'GET',
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI2IiwiaXNzIjoiYm9va2RvbmUuY29tIiwiZXhwIjoxNjk5MTU3Mzc3LCJpYXQiOjE2OTg5NzczNzd9.frLOrgTajuakbtTiK5MWDOyUaiP9su906TTD2Dfa3NN2HYNDT6PDzc4Mzo_hFd2X8wn-AF8cz_KJp-lFt2eKEQ'
      },
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/books/detail/${isbn}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BookDetail.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AutoList> getAutoCompletion(String title) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<AutoList>(Options(
      method: 'GET',
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI2IiwiaXNzIjoiYm9va2RvbmUuY29tIiwiZXhwIjoxNjk5MTU3Mzc3LCJpYXQiOjE2OTg5NzczNzd9.frLOrgTajuakbtTiK5MWDOyUaiP9su906TTD2Dfa3NN2HYNDT6PDzc4Mzo_hFd2X8wn-AF8cz_KJp-lFt2eKEQ'
      },
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/books/auto-completion/${title}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = AutoList.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
