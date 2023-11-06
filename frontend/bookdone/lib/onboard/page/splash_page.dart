import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 2000), () {
      context.pushNamed('home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: AssetImage("assets/images/logo_ver0.2.png"),
        width: MediaQuery.of(context).size.width * 2 / 3,
      ),
    );
  }
}
