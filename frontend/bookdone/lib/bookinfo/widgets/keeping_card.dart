import 'dart:convert';

import 'package:bookdone/bookinfo/model/donation.dart';
import 'package:bookdone/bookinfo/model/region.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class KeepingCard extends HookWidget {
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
  Widget build(BuildContext context) {
    final area = useState('');

    String findCode() {
      String regionName = '';
      RegionInfo curInfo = regionList[regionIndex];
      for (int i = 0; i < curInfo.secondList.length; i++) {
        if (curInfo.secondList[i].code == keeping.address) {
          regionName = curInfo.secondList[i].name;
          break;
        }
      }
      return regionName;
    }

    useEffect(() {
      area.value = findCode();
      return null;
    }, []);

    return Column(
      children: [
        SizedBox(
          height: 13.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${area.value}에 ${keeping.bookCount}권의 책이 있어요',
              style: TextStyle(fontSize: 17),
            ),
            IconButton(
              onPressed: () {
                // TODO: 책 알림 구현하기
              },
              icon: Icon(Icons.notifications, size: 20),
            ),
          ],
        ),
        SizedBox(height: 13.0),
        Divider(),
      ],
    );
  }
}
