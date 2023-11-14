import 'package:bookdone/rest_api/rest_client.dart';
import 'package:flutter/material.dart';
import 'package:bookdone/mypage/widgets/notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPageNotifications extends HookConsumerWidget {
  const MyPageNotifications({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restClient = ref.read(restApiClientProvider);
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
          child: FutureBuilder(
            future: restClient.getNotifications(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data == null) {
                // return SizedBox.shrink();
                return SizedBox.shrink();
              }

              final notificationData = snapshot.data!.data;

              return ListView.builder(
                itemCount: notificationData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Notifications(
                    message: notificationData[index].message,
                    createdAt: notificationData[index].createdAt,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
