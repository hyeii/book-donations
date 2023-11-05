import 'package:bookdone/onboard/page/add_additional_info.dart';
import 'package:bookdone/onboard/service/login_api.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          // 첫 번째 페이지
          PageViewModel(
            title: "",
            body: "첫번째 페이지 어쩌구",
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          // 두 번째 페이지
          PageViewModel(
            title: "",
            body: "두번째 페이지 어쩌구",
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          PageViewModel(
            title: "",
            // body: '세번째 페이지 멘트 어쩌구',
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('책도네 세번째 페이지'),
                Text('책도네 세번째 페이징'),
                ElevatedButton(
                  onPressed: () {
                    // TODO: 로그인 구현
                    LoginApi.kakaoLogin(context);
                    // context.goNamed('home');
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => TestPage()));
                  },
                  child: const Text("카카오로그인"),
                ),
              ],
            ),
            // footer: ElevatedButton(
            //   onPressed: () {
            //     // TODO: 로그인 구현
            //     // LoginApi.kakaoLogin(context);
            //     // context.goNamed('home');
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => AddAdditionalInfo()));
            //   },
            //   child: const Text("카카오로 시작하기"),
            // ),
          ),
        ],
        showDoneButton: false,
        showNextButton: false,
        dotsDecorator: DotsDecorator(
          activeColor: Colors.brown,
        ),
      ),
    );
  }
}
