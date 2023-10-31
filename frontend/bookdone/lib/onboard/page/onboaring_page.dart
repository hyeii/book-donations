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
            title: "책도네 11",
            body: "첫번째 페이지 멘트 어쩌구",
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
            title: "책도네 22",
            body: "두번째 페이지 멘트 어쩌구",
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
            title: "책도네 33",
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
            bodyWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Click on "),
                Icon(Icons.edit),
                Text(" to edit a post"),
              ],
            ),
            footer: ElevatedButton(
              onPressed: () {
                // TODO: 로그인 구현
                context.goNamed('home');
              },
              child: const Text("카카오로 시작하기"),
            ),
          ),
        ],
        next: Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
        done: Text(''),
        showDoneButton: false,
        showNextButton: false,
        onDone: () {},
        dotsDecorator: DotsDecorator(
          activeColor: Colors.brown,
          // activeShapes: List.filled(10, Border.all(), growable: true)
        ),
      ),
    );
  }
}
