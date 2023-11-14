import 'package:bookdone/chat/page/chat_main.dart';
import 'package:bookdone/fcm_setting.dart';
import 'package:bookdone/mypage/page/mypage_main.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:bookdone/search/page/search_main.dart';
import 'package:bookdone/top/page/top_navigation_bar.dart';
import 'package:bookdone/widgets/floating_register_btn.dart';
import 'package:bookdone/widgets/main_carousel.dart';
import 'package:bookdone/widgets/ranking_list.dart';
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
          //ChatMain(), // TODO: floating이랑 navigation 복붙 // ws바로 연결시도해서 lazy loading 하려고 제거
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff928C85),
        body: SingleChildScrollView(
          child: Column(
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
                        '책도네',
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
              MainCarousel(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 12),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
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
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 12),
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '랭킹',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RankingList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // bottomNavigationBar: TopNavigationBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingRegisterBtn(),
      ),
    );
  }
}
