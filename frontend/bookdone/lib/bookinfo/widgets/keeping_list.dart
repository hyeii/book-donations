import 'package:bookdone/bookinfo/model/donation.dart';
import 'package:bookdone/bookinfo/model/region.dart';
import 'package:bookdone/bookinfo/widgets/keeping_card.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KeepingList extends HookConsumerWidget {
  const KeepingList(
      {super.key,
      required this.isbn,
      required this.code,
      required this.regionIndex,
      required this.regionList});
  final String isbn;
  final String code;
  final int regionIndex;
  final List<RegionInfo> regionList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restClient = ref.read(restApiClientProvider);
    return FutureBuilder(
      future: restClient.getKeepingCntByRegion(isbn, code),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data == null) {
          // return SizedBox.shrink();
          return SizedBox(
            height: 10,
          );
        }
        final keepingList = snapshot.data!.data;

        return keepingList != null
            ? ListView.separated(
                itemCount: keepingList.length,
                itemBuilder: (context, index) {
                  return KeepingCard(
                    isbn: isbn,
                    regionIndex: regionIndex,
                    keeping: keepingList[index],
                    regionList: regionList,
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
              )
            : Text('보유중 없음');
      },
    );
  }
}
