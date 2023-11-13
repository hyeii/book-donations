import 'package:bookdone/article/model/article_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'my_book.freezed.dart';
part 'my_book.g.dart';

@freezed
class MyBookData with _$MyBookData {
  const factory MyBookData({
    required bool success,
    required String msg,
    required List<BookInfo> data,
  }) = _MyBookData;

  factory MyBookData.fromJson(Map<String, dynamic> json) =>
      _$MyBookDataFromJson(json);
}

@freezed
class BookInfo with _$BookInfo {
  const factory BookInfo({
    required int id,
    required String isbn,
    required String title,
    required String titleUrl,
    required String donationStatus,
    required String donatedAt,
    required List<HistoryData> historyResponseList,
  }) = _BookInfo;

  factory BookInfo.fromJson(Map<String, dynamic> json) =>
      _$BookInfoFromJson(json);
}

@freezed
class HistoryResponse with _$HistoryResponse {
  const factory HistoryResponse({
    required String content,
    required String nickname,
    required String createdAt,
  }) = _HistoryResponse;

  factory HistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryResponseFromJson(json);
}

@freezed
class UnwrittenHistory with _$UnwrittenHistory {
  const factory UnwrittenHistory({
    required bool success,
    required String msg,
    required List<UnwrittenResponse> data,
  }) = _UnwrittenHistory;

  factory UnwrittenHistory.fromJson(Map<String, dynamic> json) =>
      _$UnwrittenHistoryFromJson(json);
}

@freezed
class UnwrittenResponse with _$UnwrittenResponse {
  const factory UnwrittenResponse({
    required int id,
    required String title,
    required String titleUrl,
  }) = _UnwrittenResponse;

  factory UnwrittenResponse.fromJson(Map<String, dynamic> json) =>
      _$UnwrittenResponseFromJson(json);
}
