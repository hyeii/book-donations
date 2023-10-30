import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class KeepingCard extends HookWidget {
  const KeepingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final area = useState('서울시 마포구');
    final bookCnt = useState(0);
    return Column(
      children: [
        SizedBox(
          height: 13.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${area.value}에 ${bookCnt.value}권의 책이 있어요',
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
