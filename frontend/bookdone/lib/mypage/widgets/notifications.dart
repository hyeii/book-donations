import 'package:bookdone/mypage/page/mypage_notifications.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Notifications extends HookConsumerWidget {
  const Notifications(
      {super.key,
      required this.id,
      required this.message,
      required this.createdAt});
  final int id;
  final String message;
  final DateTime createdAt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restClient = ref.read(restApiClientProvider);
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
                        child: Text(message),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () async {
                            await restClient.deleteNotifications(id);
                            NotificationRoute().pushReplacement(context);
                          },
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
