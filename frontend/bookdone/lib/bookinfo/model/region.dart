import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'region.freezed.dart';
part 'region.g.dart';

@freezed
class Region with _$Region {
  const factory Region({
    required String first,
    required List<SecondList> secondList,
  }) = _Region;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
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
