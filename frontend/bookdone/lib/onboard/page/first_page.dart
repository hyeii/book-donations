import 'package:bookdone/onboard/page/splash_page.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:bookdone/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends HookWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    var loginStatus = useState(0);

    useEffect(() {
      void getIsLogin() async {
        try {
          SharedPreferences pref = await SharedPreferences.getInstance();

          int? state = pref.getInt('loginStatus');
          print('loginstatus-------------------------$state');

          if (state == null) {
            loginStatus.value = 0;
          } else {
            loginStatus.value = state;
          }
        } catch (error) {
          print(error);
        }
      }

      getIsLogin();
      return null;
    }, []);

    return Scaffold(
      backgroundColor: Color(0xff928C85),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        if (loginStatus.value == 0)
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
        if (loginStatus.value == 1) SplashPage()
      ]),
    );
  }
}
