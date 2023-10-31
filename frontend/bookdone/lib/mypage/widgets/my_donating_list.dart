import 'package:bookdone/mypage/widgets/book_card.dart';
import 'package:flutter/material.dart';

class MyDonatingList extends StatefulWidget {
  const MyDonatingList({super.key});

  @override
  State<MyDonatingList> createState() => _MyDonatingListState();
}

class _MyDonatingListState extends State<MyDonatingList> {
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
    ;
  }
}
