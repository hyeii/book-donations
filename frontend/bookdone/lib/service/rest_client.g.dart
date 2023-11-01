// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestClientImpl _$$RestClientImplFromJson(Map<String, dynamic> json) =>
    _$RestClientImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      type: json['type'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$RestClientImplToJson(_$RestClientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
