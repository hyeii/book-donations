// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookCommentImpl _$$BookCommentImplFromJson(Map<String, dynamic> json) =>
    _$BookCommentImpl(
      success: json['success'] as bool,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BookCommentImplToJson(_$BookCommentImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      writer: json['writer'] as String,
      review: json['review'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'writer': instance.writer,
      'review': instance.review,
      'createdAt': instance.createdAt.toIso8601String(),
    };
