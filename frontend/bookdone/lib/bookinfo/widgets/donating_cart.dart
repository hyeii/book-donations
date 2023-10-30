import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DonatingCard extends HookWidget {
  const DonatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style:
          TextStyle(fontSize: 16, color: Colors.black, fontFamily: "SCDream4"),
      child: Column(
        children: [
          SizedBox(
            height: 7.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("000님의 책"),
              Text("2099-99-99"),
            ],
          ),
          SizedBox(
            height: 7.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("히스토리 개수"),
              Text("서울시 영등포구"),
            ],
          ),
          SizedBox(
            height: 7.0,
          ),
          Divider(),
        ],
      ),
    );
  }
}
