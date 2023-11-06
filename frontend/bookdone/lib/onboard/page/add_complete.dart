import 'package:bookdone/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class AddComplete extends HookWidget {
  const AddComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              '반가워용',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
            Text(
              '책도네에서 선순환을 시작해 보세요.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // context.go('/home');
                HomeRoute().go(context);
              },
              // shape: CircleBorder(),
              child: Text('ㄱㄱ'),
            )
          ],
        ),
      ),
    );
  }
}
