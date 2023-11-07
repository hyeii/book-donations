import 'package:bookdone/app.dart';
import 'package:bookdone/chat/page/chat_main.dart';
import 'package:bookdone/fcm_setting.dart';
import 'package:bookdone/mypage/page/mypage_main.dart';
import 'package:bookdone/search/page/search_main.dart';
import 'package:bookdone/top/page/top_navigation_bar.dart';
import 'package:bookdone/widgets/floating_register_btn.dart';
import 'package:flutter/material.dart';
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
    const ProviderScope(child: MyApp()),
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
    return Scaffold(
      body: Center(
        child: Text('첫번째 페이징'),
      ),
      bottomNavigationBar: TopNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingRegisterBtn(),
    );
  }
}
