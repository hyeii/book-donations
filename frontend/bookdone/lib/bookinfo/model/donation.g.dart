// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DonationByRegionDataImpl _$$DonationByRegionDataImplFromJson(
        Map<String, dynamic> json) =>
    _$DonationByRegionDataImpl(
      success: json['success'] as bool,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DonationByRegion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DonationByRegionDataImplToJson(
        _$DonationByRegionDataImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

_$DonationByRegionImpl _$$DonationByRegionImplFromJson(
        Map<String, dynamic> json) =>
    _$DonationByRegionImpl(
      id: json['id'] as int,
      nickname: json['nickname'] as String,
      historyCount: json['historyCount'] as int,
      address: json['address'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$DonationByRegionImplToJson(
        _$DonationByRegionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'historyCount': instance.historyCount,
      'address': instance.address,
      'createdAt': instance.createdAt,
    };

_$KeepingBookByRegionImpl _$$KeepingBookByRegionImplFromJson(
        Map<String, dynamic> json) =>
    _$KeepingBookByRegionImpl(
      success: json['success'] as bool,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => KeepingBookData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$KeepingBookByRegionImplToJson(
        _$KeepingBookByRegionImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

_$KeepingBookDataImpl _$$KeepingBookDataImplFromJson(
        Map<String, dynamic> json) =>
    _$KeepingBookDataImpl(
      address: json['address'] as String,
      bookCount: json['bookCount'] as int,
    );

Map<String, dynamic> _$$KeepingBookDataImplToJson(
        _$KeepingBookDataImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'bookCount': instance.bookCount,
    };
