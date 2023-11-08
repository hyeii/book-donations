// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleRespByidImpl _$$ArticleRespByidImplFromJson(
        Map<String, dynamic> json) =>
    _$ArticleRespByidImpl(
      success: json['success'] as bool,
      msg: json['msg'] as String,
      data: ArticleData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ArticleRespByidImplToJson(
        _$ArticleRespByidImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

_$ArticleDataImpl _$$ArticleDataImplFromJson(Map<String, dynamic> json) =>
    _$ArticleDataImpl(
      id: json['id'] as int,
      isbn: json['isbn'] as String,
      nickname: json['nickname'] as String,
      address: json['address'] as String,
      content: json['content'] as String,
      canDelivery: json['canDelivery'] as bool,
      historyResponse: (json['historyResponse'] as List<dynamic>?)
          ?.map((e) => HistoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageUrlList: (json['imageUrlList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ArticleDataImplToJson(_$ArticleDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isbn': instance.isbn,
      'nickname': instance.nickname,
      'address': instance.address,
      'content': instance.content,
      'canDelivery': instance.canDelivery,
      'historyResponse': instance.historyResponse,
      'imageUrlList': instance.imageUrlList,
    };

_$HistoryResponseImpl _$$HistoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$HistoryResponseImpl(
      content: json['content'] as String,
      nickname: json['nickname'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$HistoryResponseImplToJson(
        _$HistoryResponseImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'nickname': instance.nickname,
      'createdAt': instance.createdAt,
    };
