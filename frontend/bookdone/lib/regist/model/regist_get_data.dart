import 'package:freezed_annotation/freezed_annotation.dart';

part 'regist_get_data.freezed.dart';
part 'regist_get_data.g.dart';

@freezed
class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    required bool success,
    required String msg,
    required int data,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@freezed
class RegisterId with _$RegisterId {
  const factory RegisterId({
    required int id,
  }) = _RegisterId;

  factory RegisterId.fromJson(Map<String, dynamic> json) =>
      _$RegisterIdFromJson(json);
}
