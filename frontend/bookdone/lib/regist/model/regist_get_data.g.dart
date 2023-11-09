// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regist_get_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterResponseImpl _$$RegisterResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterResponseImpl(
      success: json['success'] as bool,
      msg: json['msg'] as String,
      data: json['data'] as int,
    );

Map<String, dynamic> _$$RegisterResponseImplToJson(
        _$RegisterResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

_$RegisterIdImpl _$$RegisterIdImplFromJson(Map<String, dynamic> json) =>
    _$RegisterIdImpl(
      id: json['id'] as int,
    );

Map<String, dynamic> _$$RegisterIdImplToJson(_$RegisterIdImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
