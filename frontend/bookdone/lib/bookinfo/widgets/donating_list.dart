import 'package:bookdone/bookinfo/model/donation.dart';
import 'package:bookdone/bookinfo/widgets/donating_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DonatingList extends HookWidget {
  const DonatingList({super.key, required this.isbn, required this.donateList});
  final String isbn;
  final List<DonationByRegion> donateList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: donateList.length,
      itemBuilder: (context, index) {
        return DonatingCard(isbn: isbn, donation: donateList[index]);
      },
      separatorBuilder: (BuildContext context, int index) => Divider(),
    );
  }
}
