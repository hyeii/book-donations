import 'package:bookdone/main.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          primaryColor: Colors.white,
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
          bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(backgroundColor: Colors.white)),
      routerConfig: CustomNavigationHelper.router,
    );
  }
}
