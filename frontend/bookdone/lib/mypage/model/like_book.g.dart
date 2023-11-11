// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyLikeBookImpl _$$MyLikeBookImplFromJson(Map<String, dynamic> json) =>
    _$MyLikeBookImpl(
      success: json['success'] as bool,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => LikeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MyLikeBookImplToJson(_$MyLikeBookImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

_$LikeInfoImpl _$$LikeInfoImplFromJson(Map<String, dynamic> json) =>
    _$LikeInfoImpl(
      localCode: json['localCode'] as String,
      count: json['count'] as int,
      likes: json['likes'] as bool,
      book: BookData.fromJson(json['book'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LikeInfoImplToJson(_$LikeInfoImpl instance) =>
    <String, dynamic>{
      'localCode': instance.localCode,
      'count': instance.count,
      'likes': instance.likes,
      'book': instance.book,
    };
