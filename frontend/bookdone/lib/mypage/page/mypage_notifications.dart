import 'package:flutter/material.dart';
import 'package:bookdone/mypage/widgets/notifications.dart';

class MyPageNotifications extends StatefulWidget {
  const MyPageNotifications({super.key});

  @override
  State<MyPageNotifications> createState() => _MyPageNotificationsState();
}

class _MyPageNotificationsState extends State<MyPageNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text("알림"),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {},
        // ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 10),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Notifications(),
              Notifications(),
              Notifications(),
              Notifications(),
            ],
          ),
        ),
      ),
    );
  }
}
