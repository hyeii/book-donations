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
      historyResponseList: (json['historyResponseList'] as List<dynamic>)
          .map((e) => HistoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageUrlList: (json['imageUrlList'] as List<dynamic>)
          .map((e) => e as String)
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
      'historyResponseList': instance.historyResponseList,
      'imageUrlList': instance.imageUrlList,
    };

_$HistoryDataImpl _$$HistoryDataImplFromJson(Map<String, dynamic> json) =>
    _$HistoryDataImpl(
      title: json['title'] as String,
      titleUrl: json['titleUrl'] as String,
      content: json['content'] as String?,
      nickname: json['nickname'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$HistoryDataImplToJson(_$HistoryDataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'titleUrl': instance.titleUrl,
      'content': instance.content,
      'nickname': instance.nickname,
      'createdAt': instance.createdAt,
    };

_$HistoryRespImpl _$$HistoryRespImplFromJson(Map<String, dynamic> json) =>
    _$HistoryRespImpl(
      success: json['success'] as bool,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => HistoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HistoryRespImplToJson(_$HistoryRespImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

_$RankRespImpl _$$RankRespImplFromJson(Map<String, dynamic> json) =>
    _$RankRespImpl(
      success: json['success'] as bool,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => RankData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RankRespImplToJson(_$RankRespImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

_$RankDataImpl _$$RankDataImplFromJson(Map<String, dynamic> json) =>
    _$RankDataImpl(
      nickname: json['nickname'] as String,
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$$RankDataImplToJson(_$RankDataImpl instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'score': instance.score,
    };
