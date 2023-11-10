import 'package:bookdone/onboard/page/splash_page.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:bookdone/router/router_path.dart';
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
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    OnboardingRoute().go(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 203, 197, 190),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(25),
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        if (loginStatus == 1) SplashPage()
      ]),
    );
  }
}
