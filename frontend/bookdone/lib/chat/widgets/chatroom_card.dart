import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ChatRoomCard extends HookWidget {
  const ChatRoomCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bookName = useState('바다가 들리는 편의점');
    final nameWith = useState('감자도리');
    final lastChat = useState('마지막 채팅 내용');

    return SizedBox(
      width: double.infinity,
      height: 90,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 10),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              bookName.value,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('16:15'),
                          ],
                        ),
                        Text(
                          nameWith.value,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Text(lastChat.value),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
