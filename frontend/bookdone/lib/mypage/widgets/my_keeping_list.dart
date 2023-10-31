import 'package:bookdone/mypage/widgets/book_card.dart';
import 'package:flutter/material.dart';

class MyKeepingList extends StatefulWidget {
  const MyKeepingList({super.key});

  @override
  State<MyKeepingList> createState() => _MyKeepingListState();
}

class _MyKeepingListState extends State<MyKeepingList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BookCard(),
        BookCard(),
        BookCard(),
        BookCard(),
        BookCard(),
        BookCard(),
        BookCard(),
        BookCard(),
      ],
    );
  }
}
