import 'package:bookdone/mypage/model/like_book.dart';
import 'package:bookdone/mypage/model/my_book.dart';
import 'package:bookdone/mypage/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyLikeBookList extends HookWidget {
  const MyLikeBookList({super.key, required this.likeBookList});
  final List<LikeInfo> likeBookList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: likeBookList.length,
      itemBuilder: (context, index) {
        return BookCard(
            book: BookInfo(
                id: likeBookList[index].book.id,
                isbn: likeBookList[index].book.isbn,
                title: likeBookList[index].book.title,
                titleUrl: likeBookList[index].book.titleUrl,
                donationStatus: "NONE",
                donatedAt: "NONE",
                historyResponseList: []));
      },
    );
  }
}
