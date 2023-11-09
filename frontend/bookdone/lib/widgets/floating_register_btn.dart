import 'package:bookdone/regist/service/scan_barcode.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FloatingRegisterBtn extends HookConsumerWidget {
  const FloatingRegisterBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SpeedDial(
      // animatedIcon: AnimatedIcons.menu_close,
      activeIcon: Icons.close,
      spacing: 10,
      icon: Icons.add,
      visible: true,
      curve: Curves.bounceIn,
      backgroundColor: Colors.brown.shade500,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
            shape: CircleBorder(),
            child: const Icon(
              Icons.menu_book_sharp,
              color: Colors.white,
              size: 22,
            ),
            label: "책도네로 받은 책을 기부할래요",
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 13.0),
            backgroundColor: Colors.brown.shade400,
            labelBackgroundColor: Colors.brown.shade400,
            onTap: () async {
              ref.read(getIsbnProvider.notifier).scanBarcodeNormal();
              await RegisterExistRoute().push(context);
            }),
        SpeedDialChild(
          shape: CircleBorder(),
          child: const Icon(
            Icons.import_contacts_sharp,
            color: Colors.white,
            size: 22,
          ),
          label: "새로운 책을 기부할래요",
          backgroundColor: Colors.brown.shade400,
          labelBackgroundColor: Colors.brown.shade400,
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 13.0),
          onTap: () async {
            ref.read(getIsbnProvider.notifier).scanBarcodeNormal();
            await RegisterNewRoute().push(context);
          },
        ),
      ],
    );
  }
}
