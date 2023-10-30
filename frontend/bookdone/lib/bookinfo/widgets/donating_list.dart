import 'package:bookdone/bookinfo/widgets/donating_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DonatingList extends HookWidget {
  const DonatingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        DonatingCard(),
        DonatingCard(),
        DonatingCard(),
        DonatingCard(),
        DonatingCard(),
        DonatingCard(),
        DonatingCard(),
        DonatingCard(),
      ],
    );
  }
}
