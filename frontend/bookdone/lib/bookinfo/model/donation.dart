import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';

part 'donation.freezed.dart';
part 'donation.g.dart';

// 기부 중 목록
@freezed
class DonationByRegionData with _$DonationByRegionData {
  const factory DonationByRegionData({
    required bool success,
    required String msg,
    List<DonationByRegion>? data,
  }) = _DonationByRegionData;

  factory DonationByRegionData.fromJson(Map<String, Object?> json) =>
      _$DonationByRegionDataFromJson(json);
}

@freezed
class DonationByRegion with _$DonationByRegion {
  const factory DonationByRegion({
    required int id,
    required String nickname,
    required int historyCount,
    required String address,
    required String createdAt,
  }) = _DonationByRegion;

  factory DonationByRegion.fromJson(Map<String, Object?> json) =>
      _$DonationByRegionFromJson(json);
}

// 보유 중 목록
@freezed
class KeepingBookByRegion with _$KeepingBookByRegion {
  const factory KeepingBookByRegion({
    required bool success,
    required String msg,
    required List<KeepingBookData> data,
  }) = _KeepingBookByRegion;

  factory KeepingBookByRegion.fromJson(Map<String, dynamic> json) =>
      _$KeepingBookByRegionFromJson(json);
}

@freezed
class KeepingBookData with _$KeepingBookData {
  const factory KeepingBookData({
    required String address,
    required int bookCount,
  }) = _KeepingBookData;

  factory KeepingBookData.fromJson(Map<String, dynamic> json) =>
      _$KeepingBookDataFromJson(json);
}
