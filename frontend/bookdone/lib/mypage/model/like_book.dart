import 'package:bookdone/article/model/article_data.dart';
import 'package:bookdone/search/model/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'like_book.freezed.dart';
part 'like_book.g.dart';

@freezed
class MyLikeBook with _$MyLikeBook {
  const factory MyLikeBook({
    required bool success,
    required String msg,
    required List<LikeInfo> data,
  }) = _MyLikeBook;

  factory MyLikeBook.fromJson(Map<String, dynamic> json) =>
      _$MyLikeBookFromJson(json);
}

@freezed
class LikeInfo with _$LikeInfo {
  const factory LikeInfo({
    required String localCode,
    required int count,
    required bool likes,
    required BookData book,
  }) = _LikeInfo;

  factory LikeInfo.fromJson(Map<String, dynamic> json) =>
      _$LikeInfoFromJson(json);
}

