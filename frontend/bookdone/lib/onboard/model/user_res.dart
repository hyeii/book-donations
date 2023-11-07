import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_res.freezed.dart';
part 'user_res.g.dart';

@freezed
class UserRes with _$UserRes {
  const factory UserRes({
    required bool success,
    required String msg,
    required UserData data,
  }) = _UserRes;

  factory UserRes.fromJson(Map<String, dynamic> json) =>
      _$UserResFromJson(json);
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    required MemberInfo member,
    required String accessToken,
    required String refreshToken,
    required bool newMember,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

@freezed
class MemberInfo with _$MemberInfo {
  const factory MemberInfo({
    required int id,
    required String oauthId,
    required String nickname,
    required String address,
    required String fcmToken,
    required int point,
    required String email,
    required String image,
  }) = _MemberInfo;

  factory MemberInfo.fromJson(Map<String, dynamic> json) =>
      _$MemberInfoFromJson(json);
}

@freezed
class CheckNickname with _$CheckNickname {
  const factory CheckNickname({
    required bool success,
    required String msg,
    required Available data,
  }) = _CheckNickname;

  factory CheckNickname.fromJson(Map<String, dynamic> json) =>
      _$CheckNicknameFromJson(json);
}

@freezed
class Available with _$Available {
  const factory Available({
    required bool available,
  }) = _Available;

  factory Available.fromJson(Map<String, dynamic> json) =>
      _$AvailableFromJson(json);
}

@freezed
class UserInfoRes with _$UserInfoRes {
  const factory UserInfoRes({
    required bool success,
    required String msg,
    required MemberInfo data,
  }) = _UserInfoRes;

  factory UserInfoRes.fromJson(Map<String, Object?> json) =>
      _$UserInfoResFromJson(json);
}
