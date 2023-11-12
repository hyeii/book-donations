import 'package:bookdone/article/page/article_main.dart';
import 'package:bookdone/article/page/history_main.dart';
import 'package:bookdone/bookinfo/page/bookinfo_detail.dart';
import 'package:bookdone/bookinfo/page/bookinfo_main.dart';
import 'package:bookdone/chat/page/chat_main.dart';
import 'package:bookdone/main.dart';
import 'package:bookdone/mypage/page/my_histories.dart';
import 'package:bookdone/mypage/page/mypage_add_history.dart';
import 'package:bookdone/mypage/page/mypage_main.dart';
import 'package:bookdone/mypage/page/mypage_notifications.dart';
import 'package:bookdone/mypage/page/register_history.dart';
import 'package:bookdone/onboard/page/add_additional_info.dart';
import 'package:bookdone/onboard/page/add_complete.dart';
import 'package:bookdone/onboard/page/first_page.dart';
import 'package:bookdone/onboard/page/onboaring_page.dart';
import 'package:bookdone/onboard/page/splash_page.dart';
import 'package:bookdone/regist/page/regist_data.dart';
import 'package:bookdone/regist/page/regist_exist_list.dart';
import 'package:bookdone/regist/page/regist_new_check.dart';
import 'package:bookdone/router/router_path.dart';
import 'package:bookdone/router/router_provider.dart';
import 'package:bookdone/search/page/search_main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'app_routes.g.dart';

class MyApp extends HookConsumerWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Flutter Demo',
      // routerDelegate: router.routerDelegate,
      // routeInformationParser: router.routeInformationParser,
      // routeInformationProvider: router.routeInformationProvider,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff928C85)),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        useMaterial3: true,
        fontFamily: "SCDream4",
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 15),
          bodyMedium: TextStyle(fontSize: 12),
          // 기본 text fontsize
          bodySmall: TextStyle(fontSize: 12),
          labelLarge: TextStyle(fontSize: 12),
          // 기본 button fontsize
          displayMedium: TextStyle(fontSize: 12),
          titleMedium: TextStyle(fontSize: 13),
          titleLarge: TextStyle(fontSize: 12), // AppBar title
        ),
        // bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
        // bottomNavigationBarTheme:
        //     BottomNavigationBarThemeData(backgroundColor: Colors.white),
      ),
      routerConfig: router,
    );
  }

  final GoRouter router = GoRouter(
    routes: $appRoutes,
    initialLocation: RouterPath.firstPage,
  );
}

@TypedStatefulShellRoute<MainShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<HomeRoute>(
          path: RouterPath.homePath,
        ),
      ],
    ),
    TypedStatefulShellBranch<SearchShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<SearchRoute>(
          path: RouterPath.searchMain,
        ),
      ],
    ),
    TypedStatefulShellBranch<ChatBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ChattingRoute>(
          path: RouterPath.chatMain,
        ),
      ],
    ),
    TypedStatefulShellBranch<MyPageBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<MyPageRoute>(
          path: RouterPath.myPage,
        ),
      ],
    ),
  ],
)
class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MainPageView(
      navigationShell: navigationShell,
    );
  }
}

class MainPageView extends StatelessWidget {
  const MainPageView({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: navigationShell,
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
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class HomeShellBranchData extends StatefulShellBranchData {
  const HomeShellBranchData();
}

class SearchShellBranchData extends StatefulShellBranchData {
  const SearchShellBranchData();
}

class ChatBranchData extends StatefulShellBranchData {
  const ChatBranchData();
}

class MyPageBranchData extends StatefulShellBranchData {
  const MyPageBranchData();
}

@TypedGoRoute<TopPageRoute>(
  path: RouterPath.topPage,
)
class TopPageRoute extends GoRouteData {
  const TopPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const TopPage();
}

@TypedGoRoute<FirstPageRoute>(
  path: RouterPath.firstPage,
)
class FirstPageRoute extends GoRouteData {
  const FirstPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const FirstPage();
}

@TypedGoRoute<OnboardingRoute>(
  path: RouterPath.onboarding,
)
class OnboardingRoute extends GoRouteData {
  const OnboardingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => OnboardingPage();
}

@TypedGoRoute<AddAdditionalRoute>(
  path: RouterPath.addAdditionalInfo,
)
class AddAdditionalRoute extends GoRouteData {
  const AddAdditionalRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      AddAdditionalInfo();
}

@TypedGoRoute<AddCompleteRoute>(
  path: RouterPath.addComplete,
)
class AddCompleteRoute extends GoRouteData {
  const AddCompleteRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => AddComplete();
}

// @TypedGoRoute<HomeRoute>(
//   path: RouterPath.homePath,
// )
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => MyHomePage();
}

// @TypedGoRoute<SearchRoute>(
//   path: RouterPath.searchMain,
// )
class SearchRoute extends GoRouteData {
  const SearchRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => SearchMain();
}

// @TypedGoRoute<ChattingRoute>(
//   path: RouterPath.chatMain,
// )
class ChattingRoute extends GoRouteData {
  const ChattingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ChatMain();
}

// @TypedGoRoute<MyPageRoute>(
//   path: RouterPath.myPage,
// )
class MyPageRoute extends GoRouteData {
  const MyPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => MyPageMain();
}

@TypedGoRoute<AddHistoryRoute>(
  path: RouterPath.addHistory,
)
class AddHistoryRoute extends GoRouteData {
  const AddHistoryRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => MyPageAddHistory();
}

@TypedGoRoute<NotificationRoute>(
  path: RouterPath.notification,
)
class NotificationRoute extends GoRouteData {
  const NotificationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      MyPageNotifications();
}

@TypedGoRoute<BookinfoMainRoute>(
  path: RouterPath.bookinfoMain,
)
class BookinfoMainRoute extends GoRouteData {
  const BookinfoMainRoute({required this.isbn});
  final String isbn;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      BookinfoMain(isbn: isbn);
}

@TypedGoRoute<BookinfoDetailRoute>(
  path: RouterPath.bookinfoDetail,
)
class BookinfoDetailRoute extends GoRouteData {
  const BookinfoDetailRoute({required this.isbn});
  final String isbn;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      BookinfoDetail(isbn: isbn);
}

@TypedGoRoute<ArticleMainRoute>(
  path: RouterPath.articleMain,
)
class ArticleMainRoute extends GoRouteData {
  const ArticleMainRoute({required this.isbn, required this.id});
  final String isbn;
  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) => ArticleMain(
        isbn: isbn,
        id: id,
      );
}

@TypedGoRoute<SplashRoute>(
  path: RouterPath.splashPage,
)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => SplashPage();
}

@TypedGoRoute<RegisterRoute>(
  path: RouterPath.registerPath,
)
class RegisterRoute extends GoRouteData {
  const RegisterRoute({required this.isbn, required this.donationId});
  final String isbn;
  final int donationId;

  @override
  Widget build(BuildContext context, GoRouterState state) => RegistData(
        isbn: isbn,
        donationId: donationId,
      );
}

@TypedGoRoute<RegisterExistRoute>(
  path: RouterPath.registerExist,
)
class RegisterExistRoute extends GoRouteData {
  const RegisterExistRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => RegistExistList();
}

@TypedGoRoute<RegisterNewRoute>(
  path: RouterPath.registerNew,
)
class RegisterNewRoute extends GoRouteData {
  const RegisterNewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => RegistNewCheck();
}

@TypedGoRoute<HistoryRoute>(
  path: RouterPath.historyMain,
)
class HistoryRoute extends GoRouteData {
  const HistoryRoute(
      {required this.title, required this.titleUrl, required this.donationId});
  final int donationId;
  final String title;
  final String titleUrl;

  @override
  Widget build(BuildContext context, GoRouterState state) => HistoryMain(
        donationId: donationId,
        title: title,
        titleUrl: titleUrl,
      );
}

@TypedGoRoute<HistoryRegisterRoute>(
  path: RouterPath.historyRegister,
)
class HistoryRegisterRoute extends GoRouteData {
  const HistoryRegisterRoute(
      {required this.donationId, required this.title, required this.titleUrl});
  final int donationId;
  final String title;
  final String titleUrl;

  @override
  Widget build(BuildContext context, GoRouterState state) => RegisterHistory(
        donationId: donationId,
        title: title,
        titleUrl: titleUrl,
      );
}

@TypedGoRoute<MyHistoriesRoute>(
  path: RouterPath.myHistories,
)
class MyHistoriesRoute extends GoRouteData {
  const MyHistoriesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MyHistories();
}
