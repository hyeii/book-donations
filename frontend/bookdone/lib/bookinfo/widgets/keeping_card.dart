import 'package:bookdone/bookinfo/model/donation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class KeepingCard extends HookWidget {
  const KeepingCard({super.key, required this.isbn, required this.keeping});
  final String isbn;
  final KeepingBookData keeping;

  @override
  Widget build(BuildContext context) {
    final area = useState('서울시 마포구');

    return Column(
      children: [
        SizedBox(
          height: 13.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${keeping.address}에 ${keeping.bookCount}권의 책이 있어요',
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
