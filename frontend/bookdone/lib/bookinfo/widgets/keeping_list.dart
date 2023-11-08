import 'package:bookdone/bookinfo/model/donation.dart';
import 'package:bookdone/bookinfo/model/region.dart';
import 'package:bookdone/bookinfo/widgets/keeping_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class KeepingList extends HookWidget {
  const KeepingList(
      {super.key,
      required this.isbn,
      required this.regionIndex,
      required this.keepingList,
      required this.regionList});
  final String isbn;
  final int regionIndex;
  final List<KeepingBookData> keepingList;
  final List<RegionInfo> regionList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: keepingList.length,
      itemBuilder: (context, index) {
        return KeepingCard(
          isbn: isbn,
          regionIndex: regionIndex,
          keeping: keepingList[index],
          regionList: regionList,
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(),
    );
  }
}
