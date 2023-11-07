import 'package:bookdone/main.dart';
import 'package:bookdone/onboard/service/login_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GetStartBtn extends HookConsumerWidget {
  const GetStartBtn({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool isLoading = false;
    var isLoading = useState(false);

    void loadingHandler() {
      isLoading.value = true;
      Future.delayed(const Duration(seconds: 1)).then((value) {
        isLoading.value = false;
        LoginApi.kakaoLogin(context);
        ;
      });
    }

    return GestureDetector(
      onTap: loadingHandler,
      child: Container(
        margin: const EdgeInsets.only(top: 60),
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.height / 13,
        decoration: BoxDecoration(
            color: Colors.brown, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: isLoading.value
              ? const Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                )
              : Text("카카오로 시작하기"),
        ),
      ),
    );
  }
}
