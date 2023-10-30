import 'package:bookdone/bookinfo/widgets/keeping_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class KeepingList extends HookWidget {
  const KeepingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        KeepingCard(),
        KeepingCard(),
        KeepingCard(),
        KeepingCard(),
        KeepingCard(),
        KeepingCard(),
        KeepingCard(),
      ],
    );
  }
}
