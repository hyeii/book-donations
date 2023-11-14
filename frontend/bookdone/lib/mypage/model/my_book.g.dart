// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyBookDataImpl _$$MyBookDataImplFromJson(Map<String, dynamic> json) =>
    _$MyBookDataImpl(
      success: json['success'] as bool,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => BookInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MyBookDataImplToJson(_$MyBookDataImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

_$BookInfoImpl _$$BookInfoImplFromJson(Map<String, dynamic> json) =>
    _$BookInfoImpl(
      id: json['id'] as int,
      isbn: json['isbn'] as String,
      title: json['title'] as String,
      titleUrl: json['titleUrl'] as String,
      donationStatus: json['donationStatus'] as String,
      donatedAt: json['donatedAt'] as String,
      historyResponseList: (json['historyResponseList'] as List<dynamic>)
          .map((e) => HistoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BookInfoImplToJson(_$BookInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isbn': instance.isbn,
      'title': instance.title,
      'titleUrl': instance.titleUrl,
      'donationStatus': instance.donationStatus,
      'donatedAt': instance.donatedAt,
      'historyResponseList': instance.historyResponseList,
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

_$UnwrittenHistoryImpl _$$UnwrittenHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$UnwrittenHistoryImpl(
      success: json['success'] as bool,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => UnwrittenResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UnwrittenHistoryImplToJson(
        _$UnwrittenHistoryImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

_$UnwrittenResponseImpl _$$UnwrittenResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UnwrittenResponseImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      titleUrl: json['titleUrl'] as String,
    );

Map<String, dynamic> _$$UnwrittenResponseImplToJson(
        _$UnwrittenResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'titleUrl': instance.titleUrl,
    };
