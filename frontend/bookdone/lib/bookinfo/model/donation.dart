import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';

part 'donation.freezed.dart';
part 'donation.g.dart';

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
