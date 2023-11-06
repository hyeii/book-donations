import 'package:bookdone/app.dart';
import 'package:bookdone/article/page/article_main.dart';
import 'package:bookdone/bookinfo/page/bookinfo_detail.dart';
import 'package:bookdone/bookinfo/page/bookinfo_main.dart';
import 'package:bookdone/chat/page/chat_main.dart';
import 'package:bookdone/mypage/page/mypage_add_history.dart';
import 'package:bookdone/mypage/page/mypage_main.dart';
import 'package:bookdone/mypage/page/mypage_notifications.dart';
import 'package:bookdone/onboard/page/add_additional_info.dart';
import 'package:bookdone/onboard/page/add_complete.dart';
import 'package:bookdone/onboard/page/first_page.dart';
import 'package:bookdone/onboard/page/onboaring_page.dart';
import 'package:bookdone/onboard/page/splash_page.dart';
import 'package:bookdone/regist/page/regist_data.dart';
import 'package:bookdone/regist/page/regist_exist_list.dart';
import 'package:bookdone/regist/page/regist_new_check.dart';
import 'package:bookdone/regist/service/scan_barcode.dart';
import 'package:bookdone/search/page/search_main.dart';
import 'package:bookdone/search/service/search_service.dart';
import 'package:bookdone/widgets/floating_register_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:provider/provider.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await dotenv.load(fileName: ".env.dev");
  String kakaoNativeKey = dotenv.get('KAKAO_NATIVE_KEY');
  KakaoSdk.init(nativeAppKey: kakaoNativeKey);
  CustomNavigationHelper.instance;
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class CustomNavigationHelper {
  static final CustomNavigationHelper _instance =
      CustomNavigationHelper._internal();

  static CustomNavigationHelper get instance => _instance;

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> searchTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> myPageTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> chatTabNavigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  static const String homePath = '/home';
  static const String mypagePath = '/mypage';
  static const String searchPath = '/search';
  static const String addHistoryPath = '/addhistory';
  static const String chatPath = '/chat';
  static const String notificationPath = '/notification';
  static const String registPath = '/regist';
  static const String bookinfoDetailPath = '/bookinfodetail';

  factory CustomNavigationHelper() {
    return _instance;
  }

  CustomNavigationHelper._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: homeTabNavigatorKey,
            routes: [
              GoRoute(
                name: 'home',
                path: '/home',
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const MyHomePage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: searchTabNavigatorKey,
            routes: [
              GoRoute(
                name: 'search',
                path: '/search',
                pageBuilder: (context, state) {
                  return getPage(
                    child: const SearchMain(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: chatTabNavigatorKey,
            routes: [
              GoRoute(
                name: 'chat',
                path: '/chat',
                pageBuilder: (context, state) {
                  return getPage(
                    child: const ChatMain(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: myPageTabNavigatorKey,
            routes: [
              GoRoute(
                  name: 'mypage',
                  path: '/mypage',
                  pageBuilder: (context, state) {
                    return getPage(
                      child: const MyPageMain(),
                      state: state,
                    );
                  },
                  routes: [
                    GoRoute(
                      name: 'addhistory',
                      path: 'addhistory',
                      pageBuilder: (context, state) {
                        return getPage(
                          child: const MyPageAddHistory(),
                          state: state,
                        );
                      },
                    ),
                    GoRoute(
                      name: 'notification',
                      path: 'notification',
                      pageBuilder: (context, state) {
                        return getPage(
                          child: const MyPageNotifications(),
                          state: state,
                        );
                      },
                    )
                  ]),
            ],
          ),
        ],
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return getPage(
            child: BottomNavigationPage(
              child: navigationShell,
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        name: 'bookinfoMain',
        path: '/bookinfomain',
        pageBuilder: (context, state) {
          return getPage(
            child: BookinfoMain(isbn: 'isbn'),
            state: state,
          );
        },
        routes: [
          GoRoute(
            name: 'bookinfodetail',
            path: 'bookinfodetail',
            pageBuilder: (context, state) {
              return getPage(
                child: BookinfoDetail(),
                state: state,
              );
            },
            routes: [
              GoRoute(
                parentNavigatorKey: parentNavigatorKey,
                name: 'articlemain',
                path: 'articlemain',
                pageBuilder: (context, state) {
                  return getPage(
                    child: const ArticleMain(),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        name: 'registexist',
        path: '/registexist',
        pageBuilder: (context, state) {
          return getPage(
            child: const RegistExistList(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        name: 'registnew',
        path: '/registnew',
        pageBuilder: (context, state) {
          return getPage(
            child: const RegistNewCheck(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        name: 'onboarding',
        path: '/onboarding',
        pageBuilder: (context, state) {
          return getPage(
            child: OnboardingPage(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        name: 'addadditionalinfo',
        path: '/addadditionalinfo',
        pageBuilder: (context, state) {
          return getPage(
            child: const AddAdditionalInfo(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        name: 'addcomplete',
        path: '/addcomplete',
        pageBuilder: (context, state) {
          return getPage(
            child: const AddComplete(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        name: 'firstpage',
        path: '/firstpage',
        pageBuilder: (context, state) {
          return getPage(
            child: const FirstPage(),
            state: state,
          );
        },
      ),
    ];

    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: '/firstpage',
      routes: routes,
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('책도네'),
      ),
      body: Center(),
    );
  }
}

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingRegisterBtn(),
      // appBar: AppBar(
      //   title: const Text('Bottom Navigator Shell'),
      // ),
      body: SafeArea(
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.child.currentIndex,
        onTap: (index) {
          widget.child.goBranch(
            index,
            initialLocation: index == widget.child.currentIndex,
          );
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}
