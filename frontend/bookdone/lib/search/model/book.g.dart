// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
      success: json['success'] as bool,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => BookData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

_$BookDataImpl _$$BookDataImplFromJson(Map<String, dynamic> json) =>
    _$BookDataImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      seriesTitle: json['seriesTitle'] as String,
      seriesNo: json['seriesNo'] as String,
      author: json['author'] as String,
      isbn: json['isbn'] as String,
      titleUrl: json['titleUrl'] as String,
      publisher: json['publisher'] as String,
    );

Map<String, dynamic> _$$BookDataImplToJson(_$BookDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'seriesTitle': instance.seriesTitle,
      'seriesNo': instance.seriesNo,
      'author': instance.author,
      'isbn': instance.isbn,
      'titleUrl': instance.titleUrl,
      'publisher': instance.publisher,
    };

_$BookDetailImpl _$$BookDetailImplFromJson(Map<String, dynamic> json) =>
    _$BookDetailImpl(
      success: json['success'] as bool,
      msg: json['msg'] as String,
      data: BookData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BookDetailImplToJson(_$BookDetailImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

_$AutoListImpl _$$AutoListImplFromJson(Map<String, dynamic> json) =>
    _$AutoListImpl(
      success: json['success'] as bool,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => AutoListData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AutoListImplToJson(_$AutoListImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

_$AutoListDataImpl _$$AutoListDataImplFromJson(Map<String, dynamic> json) =>
    _$AutoListDataImpl(
      title: json['title'] as String,
      isbn: json['isbn'] as String,
    );

Map<String, dynamic> _$$AutoListDataImplToJson(_$AutoListDataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'isbn': instance.isbn,
    };
