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

    Future<void> setBooksLikesOnOff() async {
      BooksLikeResp bookslikes = await restClient.setBooksLikes({
        'localCode': keeping.address,
        'isbn': isbn,
      });
      print(bookslikes.data);
    }

    void likeAlert(context) {
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    likes.value
                        ? Text('알림설정을 해제할까요?')
                        : Text('${area.value}의 책들을 알림설정할까요?'),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('취소'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            likes.value = !likes.value;
                            setBooksLikesOnOff();
                          },
                          child: Text('확인'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          });
    }

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
              isSelected: likes.value,
              selectedIcon: const Icon(Icons.notifications_active_sharp),
              onPressed: () {
                likeAlert(context);
              },
              icon: Icon(
                Icons.notifications_none_outlined,
                size: 20,
              ),
            ),
          ],
        ),
        SizedBox(height: 13.0),
        Divider(),
      ],
    );
  }
}
