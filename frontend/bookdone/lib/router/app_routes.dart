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

import '../chat/page/chat_room.dart';
import '../chat/service/stomp_service.dart';

part 'app_routes.g.dart';

class MyApp extends HookConsumerWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff928C85)),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        useMaterial3: true,
        fontFamily: "SCDream4",
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 12),
          bodyMedium: TextStyle(fontSize: 11),
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
      // routerConfig: router,
    );
  }

  final GoRouter router = GoRouter(
    routes: $appRoutes,
    initialLocation: RouterPath.firstPage,
  );
}

@TypedGoRoute<FirstPageRoute>(
  path: RouterPath.firstPage,
)
class FirstPageRoute extends GoRouteData {
  const FirstPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const FirstPage();
}

@TypedGoRoute<StartPageRoute>(
  path: RouterPath.startPage,
)
class StartPageRoute extends GoRouteData {
  const StartPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StartingPage();
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

@TypedGoRoute<HomeRoute>(
  path: RouterPath.homePath,
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => MyHomePage();
}

@TypedGoRoute<SearchRoute>(
  path: RouterPath.searchMain,
)
class SearchRoute extends GoRouteData {
  const SearchRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => SearchMain();
}

@TypedGoRoute<ChattingRoute>(
  path: RouterPath.chatMain,
)
class ChattingRoute extends GoRouteData {
  const ChattingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ChatMain();
}

@TypedGoRoute<MyPageRoute>(
  path: RouterPath.myPage,
)
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

@TypedGoRoute<ChatRoomRoute>(
  path: RouterPath.chatRoom,
)
class ChatRoomRoute extends GoRouteData {
  const ChatRoomRoute(
      {required this.tradeId,
      required this.nameWith,
      required this.bookName,
      required this.lastChat,
      required this.isbn});

  final int tradeId;
  final String nameWith;
  final String bookName;
  final String lastChat;
  final String isbn;

  @override
  Widget build(BuildContext context, GoRouterState state) => ChatRoom(
        tradeId: tradeId,
        nameWith: nameWith,
        bookName: bookName,
        lastChat: lastChat,
        isbn: isbn,
      );
}

@TypedGoRoute<ChatMainRoute>(
  path: RouterPath.chatMain,
)
class ChatMainRoute extends GoRouteData {
  const ChatMainRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ChatMain();
}