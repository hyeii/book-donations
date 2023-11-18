import 'dart:convert';

import 'package:bookdone/bookinfo/model/donation.dart';
import 'package:bookdone/bookinfo/model/region.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KeepingCard extends HookConsumerWidget {
  const KeepingCard(
      {super.key,
      required this.isbn,
      required this.regionIndex,
      required this.keeping,
      required this.regionList});
  final String isbn;
  final int regionIndex;
  final KeepingBookData keeping;
  final List<RegionInfo> regionList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restClient = ref.read(restApiClientProvider);
    final area = useState('');
    final likes = useState(false);

    useEffect(() {
      var regionName = '';
      RegionInfo curInfo = regionList[regionIndex];
      for (int i = 0; i < curInfo.secondList.length; i++) {
        if (curInfo.secondList[i].code == keeping.address) {
          regionName = curInfo.secondList[i].name;
          break;
        }
      }
      area.value = regionName;
      return null;
    }, []);

    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('${area.value}에 ${keeping.bookCount}권의 책이 있어요'),
          ],
        ),
        SizedBox(height: 20.0),
        Divider(),
      ],
    );
  }
}
