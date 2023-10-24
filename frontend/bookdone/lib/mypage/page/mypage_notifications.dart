import 'package:flutter/material.dart';

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
        title: Text(
          "알림",
          style: TextStyle(
            fontSize: 20,
            // fontWeight: FontWeight.bold,
            // color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              SizedBox(
                width: 370,
                height: 110,
                child: Notifications(),
              ),
              SizedBox(
                width: 370,
                height: 110,
                child: Notifications(),
              ),
              SizedBox(
                width: 370,
                height: 100,
                child: Notifications(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 370,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                image: AssetImage("assets/images/samplebookcover.jpg"),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "바다가 들리는 편의점의 기부를 기다리는 이용자가 있습니다.",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          "닫기",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
