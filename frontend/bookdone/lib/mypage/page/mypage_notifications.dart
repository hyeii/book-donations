import 'package:cached_network_image/cached_network_image.dart';
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
        title: Text("알림"),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {},
        // ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Notifications(),
            Notifications(),
            Notifications(),
          ]),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: double.infinity,
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
                child: CachedNetworkImage(
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  imageUrl:
                      "https://image.aladin.co.kr/product/29045/74/cover500/k192836746_2.jpg",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "바다가 들리는 편의점의 기부를 기다리는 이용자가 있습니다.",
                        ),
                      ),
                      Container(
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
