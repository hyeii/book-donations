import 'package:bookdone/mypage/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyDonatingList extends HookWidget {
  const MyDonatingList({super.key});

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
