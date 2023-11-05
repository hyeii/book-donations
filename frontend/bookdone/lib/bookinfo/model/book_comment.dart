import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'book_comment.freezed.dart';
part 'book_comment.g.dart';

@freezed
class BookComment with _$BookComment {
  const factory BookComment({
    required bool success,
    required String msg,
    required List<Comment> data,
  }) = _BookComment;

  factory BookComment.fromJson(Map<String, dynamic> json) =>
      _$BookCommentFromJson(json);
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String writer,
    required String review,
    required DateTime createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
