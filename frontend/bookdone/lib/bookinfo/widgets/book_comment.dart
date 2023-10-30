import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BookComment extends HookWidget {
  const BookComment({super.key});

  @override
  Widget build(BuildContext context) {
    final writer = useState('댓글작성자');
    final date = useState('2033-13-32');
    final comment = useState('오늘 점심 영양닭죽 나박물김치 너비아니엿장조림 샐러드 드레싱 제육비빔밥 후라이 미역국');
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              writer.value,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(date.value)
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              comment.value,
              style: TextStyle(fontSize: 17),
            )),
        SizedBox(
          height: 20,
        ),
        Divider(thickness: 1, height: 1),
      ],
    );
  }
}
