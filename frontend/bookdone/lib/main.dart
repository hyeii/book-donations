import 'package:bookdone/chat/page/chat_main.dart';
import 'package:bookdone/fcm_setting.dart';
import 'package:bookdone/mypage/page/mypage_main.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:bookdone/search/model/book.dart';
import 'package:bookdone/search/page/search_main.dart';
import 'package:bookdone/search/widgets/autocomplete_list.dart';

import 'package:bookdone/widgets/floating_register_btn.dart';
import 'package:bookdone/widgets/main_carousel.dart';
import 'package:bookdone/widgets/ranking_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    await pref.setString('curFcmToken', firebaseToken);
    // print('---------------------------------');
    // print(firebaseToken);
    // print(pref.getString('curFcmToken'));
    // print('---------------------------------');
  }
  KakaoSdk.init(nativeAppKey: kakaoNativeKey);
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class StartingPage extends HookConsumerWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    var currentIndex = useState(0);
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          MyHomePage(),
          SearchMain(),
          ChatMain(),
          MyPageMain(),
        ],
        onPageChanged: (index) {
          currentIndex.value = index;
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingRegisterBtn(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_rounded),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded),
            label: 'chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'mypage',
          ),
        ],
        currentIndex: currentIndex.value,
        onTap: (index) {
          pageController.jumpToPage(index);
        },
      ),
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restClient = ref.read(restApiClientProvider);
    final searchController = useTextEditingController();
    var viewAutoComplete = useState(false);

    var searchText = useState('');
    var autoValue = useState('');
    useEffect(() {
      void checkFcmToken() async {
        try {
          SharedPreferences pref = await SharedPreferences.getInstance();
          // print('기존꺼 : ${pref.getString('getFcmToken')}');
          // print('지금생긴거 : ${pref.getString('curFcmToken')}');
          if (pref.getString('getFcmToken') != pref.getString('curFcmToken')) {
            if (pref.getString('curFcmToken') != null) {
              await pref.setString(
                  'getFcmToken', pref.getString('curFcmToken')!);
            }
            restClient.updateFcm({'fcmToken': pref.getString('curFcmToken')});
          }
        } catch (error) {
          print(error);
        }
      }

      checkFcmToken();
      return () {};
    }, []);

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          viewAutoComplete.value = false;
        },
        child: Scaffold(
          backgroundColor: Color(0xff928C85),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
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
                          TextField(
                            style: TextStyle(fontSize: 12),
                            controller: searchController,
                            onTapOutside: (event) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search_rounded),
                              isDense: true,
                              contentPadding: EdgeInsets.all(20),
                              hintText: '책을 검색하세요',
                              filled: true,
                              fillColor: Color.fromARGB(255, 197, 193, 189),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 197, 193, 189),
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 197, 193, 189),
                                ),
                              ),
                            ),
                            maxLines: 1,
                            onChanged: (text) {
                              viewAutoComplete.value = true;
                              searchText.value = searchController.text;
                            },
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
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (viewAutoComplete.value)
                  FutureBuilder<AutoList>(
                    future: restClient.getAutoCompletion(searchText.value),
                    builder: (_, snapshot) {
                      if (snapshot.data == null) return Container();
                      final autoCompleteList = snapshot.data!.data;

                      return AutocompleteList(
                        autoListData: autoCompleteList,
                        searchPage: false,
                      );
                    },
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
