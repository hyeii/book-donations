import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_data.freezed.dart';
part 'article_data.g.dart';

@freezed
class ArticleRespByid with _$ArticleRespByid {
  const factory ArticleRespByid({
    required bool success,
    required String msg,
    required ArticleData data,
  }) = _ArticleRespByid;

  factory ArticleRespByid.fromJson(Map<String, dynamic> json) =>
      _$ArticleRespByidFromJson(json);
}

@freezed
class ArticleData with _$ArticleData {
  const factory ArticleData({
    required int id,
    required String isbn,
    required String nickname,
    required String address,
    required String content,
    required bool canDelivery,
    List<HistoryResponse>? historyResponse,
    List<String>? imageUrlList,
  }) = _ArticleData;

  factory ArticleData.fromJson(Map<String, dynamic> json) =>
      _$ArticleDataFromJson(json);
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
