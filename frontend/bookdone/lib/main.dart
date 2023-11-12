import 'package:bookdone/chat/page/chat_main.dart';
import 'package:bookdone/fcm_setting.dart';
import 'package:bookdone/mypage/page/mypage_main.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:bookdone/search/page/search_main.dart';
import 'package:bookdone/top/page/top_navigation_bar.dart';
import 'package:bookdone/widgets/floating_register_btn.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await dotenv.load(fileName: ".env.dev");
  String kakaoNativeKey = dotenv.get('KAKAO_NATIVE_KEY');
  WidgetsFlutterBinding.ensureInitialized();
  String? firebaseToken = await fcmSetting();
  SharedPreferences pref = await SharedPreferences.getInstance();
  if (firebaseToken != null) {
    await pref.setString('fcmToken', firebaseToken);
  }
  KakaoSdk.init(nativeAppKey: kakaoNativeKey);
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class TopPage extends HookConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('책도네'),
      ),
      body: IndexedStack(
        children: [
          MyHomePage(),
          SearchMain(),
          ChatMain(), // TODO: floating이랑 navigation 복붙
          MyPageMain(),
        ],
      ),
      bottomNavigationBar: TopNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingRegisterBtn(),
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var carouselIndex = useState(0);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff928C85),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 12),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '하이하이 반가웡쇼',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                CarouselSlider(
                  items: [
                    Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 12),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 89, 87, 84),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('책책책 책을읽자요'),
                          SvgPicture.asset(
                            'assets/images/undraw_reading.svg',
                            height: 120,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 12),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 197, 193, 189),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            'assets/images/undraw_reading_time.svg',
                            height: 120,
                          ),
                          Text('넘어가지망'),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 12),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 197, 193, 189),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          Text('3번'),
                        ],
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                      viewportFraction: 1,
                      height: 200,
                      onPageChanged: (index, reason) {
                        carouselIndex.value = index;
                      }),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 12),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: i == carouselIndex.value
                                  ? Colors.white
                                  : Color.fromARGB(255, 112, 101, 90),
                            ),
                          ),
                        )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 197, 193, 189),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        Text('search'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 12),
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('이잉'),
                          Text('이잉'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        // bottomNavigationBar: TopNavigationBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingRegisterBtn(),
      ),
    );
  }
}
