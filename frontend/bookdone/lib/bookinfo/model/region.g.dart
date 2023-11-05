// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegionImpl _$$RegionImplFromJson(Map<String, dynamic> json) => _$RegionImpl(
      region: (json['region'] as List<dynamic>)
          .map((e) => RegionInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RegionImplToJson(_$RegionImpl instance) =>
    <String, dynamic>{
      'region': instance.region,
    };

_$RegionInfoImpl _$$RegionInfoImplFromJson(Map<String, dynamic> json) =>
    _$RegionInfoImpl(
      first: json['first'] as String,
      secondList: (json['secondList'] as List<dynamic>)
          .map((e) => SecondList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RegionInfoImplToJson(_$RegionInfoImpl instance) =>
    <String, dynamic>{
      'first': instance.first,
      'secondList': instance.secondList,
    };

_$SecondListImpl _$$SecondListImplFromJson(Map<String, dynamic> json) =>
    _$SecondListImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      second: json['second'] as String,
    );

Map<String, dynamic> _$$SecondListImplToJson(_$SecondListImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'second': instance.second,
    };
