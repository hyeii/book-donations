import 'package:bookdone/bookinfo/model/donation.dart';
import 'package:bookdone/bookinfo/widgets/keeping_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class KeepingList extends HookWidget {
  const KeepingList({super.key, required this.isbn, required this.keepingList});
  final String isbn;
  final List<KeepingBookData> keepingList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: keepingList.length,
      itemBuilder: (context, index) {
        return KeepingCard(isbn: isbn, keeping: keepingList[index]);
      },
      separatorBuilder: (BuildContext context, int index) => Divider(),
    );
  }
}
