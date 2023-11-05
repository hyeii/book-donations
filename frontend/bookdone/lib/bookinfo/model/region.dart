import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'region.freezed.dart';
part 'region.g.dart';

@freezed
class Region with _$Region {
  const factory Region({
    required List<RegionInfo> region,
  }) = _Region;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
}

@freezed
class RegionInfo with _$RegionInfo {
  const factory RegionInfo({
    required String first,
    required List<SecondList> secondList,
  }) = _RegionInfo;

  factory RegionInfo.fromJson(Map<String, dynamic> json) =>
      _$RegionInfoFromJson(json);
}

@freezed
class SecondList with _$SecondList {
  const factory SecondList({
    required String code,
    required String name,
    required String second,
  }) = _SecondList;

  factory SecondList.fromJson(Map<String, dynamic> json) =>
      _$SecondListFromJson(json);
}
