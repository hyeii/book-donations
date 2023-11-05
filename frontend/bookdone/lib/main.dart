import 'package:bookdone/article/page/article_main.dart';
import 'package:bookdone/bookinfo/page/bookinfo_detail.dart';
import 'package:bookdone/bookinfo/page/bookinfo_main.dart';
import 'package:bookdone/chat/page/chat_main.dart';
import 'package:bookdone/mypage/page/mypage_add_history.dart';
import 'package:bookdone/mypage/page/mypage_main.dart';
import 'package:bookdone/mypage/page/mypage_notifications.dart';
import 'package:bookdone/onboard/page/add_additional_info.dart';
import 'package:bookdone/onboard/page/onboaring_page.dart';
import 'package:bookdone/onboard/page/splash_page.dart';
import 'package:bookdone/regist/page/regist_data.dart';
import 'package:bookdone/regist/page/regist_exist_list.dart';
import 'package:bookdone/regist/page/regist_new_check.dart';
import 'package:bookdone/regist/service/scan_barcode.dart';
import 'package:bookdone/search/page/search_main.dart';
import 'package:bookdone/search/service/search_service.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          primaryColor: Colors.white,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          useMaterial3: true,
          fontFamily: "SCDream4",
          textTheme: TextTheme(
            bodyLarge: TextStyle(fontSize: 12),
            bodyMedium: TextStyle(fontSize: 12),
            // 기본 text fontsize
            bodySmall: TextStyle(fontSize: 12),
            labelLarge: TextStyle(fontSize: 12),
            // 기본 button fontsize
            displayMedium: TextStyle(fontSize: 12),
            titleMedium: TextStyle(fontSize: 13),
            titleLarge: TextStyle(fontSize: 12), // AppBar title
          ),
          bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(backgroundColor: Colors.white)),
      routerConfig: CustomNavigationHelper.router,
    );
  }
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
        // parentNavigatorKey: parentNavigatorKey,
        name: 'bookinfoMain',
        path: '/bookinfomain',
        pageBuilder: (context, state) {
          return getPage(
            child: const BookinfoMain(),
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
                // parentNavigatorKey: parentNavigatorKey,
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
            child: const OnboardingPage(),
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
      initialLocation: '/home',
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
      floatingActionButton: FloatingRegistBtn(),
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
      body: Column(children: [
        if (loginStatus == 0)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('책도네 첫페이지임!!'),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('onboarding');
                },
                child: Text('알아보기'),
              )
            ],
          ),
        if (loginStatus == 1) SplashPage()
      ]),
    );
  }
}

class FloatingRegistBtn extends HookConsumerWidget {
  const FloatingRegistBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SpeedDial(
      // animatedIcon: AnimatedIcons.menu_close,
      activeIcon: Icons.close,
      spacing: 10,
      icon: Icons.add,
      visible: true,
      curve: Curves.bounceIn,
      backgroundColor: Colors.brown.shade500,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
            shape: CircleBorder(),
            child: const Icon(
              Icons.menu_book_sharp,
              color: Colors.white,
              size: 22,
            ),
            label: "책도네로 받은 책을 기부할래요",
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 13.0),
            backgroundColor: Colors.brown.shade400,
            labelBackgroundColor: Colors.brown.shade400,
            onTap: () async {
              ref.read(getIsbnProvider.notifier).scanBarcodeNormal();
              await context.pushNamed('registexist');
            }),
        SpeedDialChild(
          shape: CircleBorder(),
          child: const Icon(
            Icons.import_contacts_sharp,
            color: Colors.white,
            size: 22,
          ),
          label: "새로운 책을 기부할래요",
          backgroundColor: Colors.brown.shade400,
          labelBackgroundColor: Colors.brown.shade400,
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 13.0),
          onTap: () async {
            ref.read(getIsbnProvider.notifier).scanBarcodeNormal();
            await context.pushNamed('registnew');
          },
        ),
      ],
    );
  }
}
