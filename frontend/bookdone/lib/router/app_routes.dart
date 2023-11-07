import 'package:bookdone/article/page/article_main.dart';
import 'package:bookdone/bookinfo/page/bookinfo_detail.dart';
import 'package:bookdone/bookinfo/page/bookinfo_main.dart';
import 'package:bookdone/chat/page/chat_main.dart';
import 'package:bookdone/main.dart';
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
import 'package:bookdone/router/router_path.dart';
import 'package:bookdone/search/page/search_main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'app_routes.g.dart';

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
  const ArticleMainRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ArticleMain();
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
  const RegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => RegistData();
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
