import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';

part 'rest_client.freezed.dart';
part 'rest_client.g.dart';

@freezed
class RestClient with _$RestClient {
  const factory RestClient({
    required int id,
    required String title,
    required String type,
    required String url,
  }) = _RestClient;

  factory RestClient.fromJson(Map<String, Object?> json) =>
      _$RestClientFromJson(json);
}
