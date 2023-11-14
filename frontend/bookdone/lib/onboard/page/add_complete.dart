import 'package:bookdone/onboard/service/set_user_api.dart';
import 'package:bookdone/regist/page/regist_data.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddComplete extends HookConsumerWidget {
  const AddComplete({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Color(0xff928C85),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              '반갑습니다!',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
            Text(
              '책도네에서 선순환을 시작해 보세요.',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                SetUserApi.updateMyInfo(ref);
                ref.invalidate(registerRegionStateProvider);
                ref.invalidate(registerRegionCodeStateProvider);
                HomeRoute().go(context);
              },
              // shape: CircleBorder(),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 203, 197, 190),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(25),
                child: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
