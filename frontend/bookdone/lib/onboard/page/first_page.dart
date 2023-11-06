import 'package:bookdone/onboard/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    var loginStatus = 0;
    void getIsLogin() async {
      SharedPreferences pref = await SharedPreferences.getInstance();

      int? value = pref.getInt('loginStatus');

      if (value == null) {
        loginStatus = 0;
      } else {
        loginStatus = value;
      }
    }

    return Scaffold(
      backgroundColor: Color(0xff928C85),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        if (loginStatus == 0)
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/images/logo_ver0.2.png"),
                  width: MediaQuery.of(context).size.width * 2 / 3,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.goNamed('onboarding');
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                      // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                          //모서리를 둥글게
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Colors.brown.shade700,
                      foregroundColor: Colors.white),
                  child: Text('알아보기'),
                )
              ],
            ),
          ),
        if (loginStatus == 1) SplashPage()
      ]),
    );
  }
}
