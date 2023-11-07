import 'package:bookdone/router/app_routes.dart';
import 'package:bookdone/router/router_path.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    routes: $appRoutes, // 자동 생성된 파일로부터 패스를 읽는다
    initialLocation: RouterPath.firstPage,
  );
}
