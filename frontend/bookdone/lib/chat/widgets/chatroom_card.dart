import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../model/chat.dart';
import '../page/chat_room.dart';

class ChatRoomCard extends HookWidget {
  final ChatRoomResponse chatRoom;

  ChatRoomCard({Key? key, required this.chatRoom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedLastMessageTime = chatRoom.lastMessageTime != null
        ? "${chatRoom.lastMessageTime?.toString().substring(2, 10)} ${chatRoom.lastMessageTime?.toString().substring(11, 16)}"
        : '마지막 채팅 시간 정보 없음';

    ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChatRoom(
            tradeId: chatRoom.tradeId,
            nameWith: chatRoom.userNickname,
            bookName: '(더미) 바다가 들리는 편의점', // 실제 데이터로 변경 필요
            lastChat: chatRoom.lastMessage == null ? '채팅 없음' : chatRoom.lastMessage.toString(),
          ),
        ));
      },
      child: Card(
        elevation: 2.0, // Adds a subtle shadow
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: CachedNetworkImageProvider(
                  "https://image.aladin.co.kr/product/29045/74/cover500/k192836746_2.jpg",
                ),
                backgroundColor: theme.primaryColorLight, // Fallback color
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${chatRoom.userNickname}님과의 채팅',
                      style: theme.textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      formattedLastMessageTime,
                      style: theme.textTheme.caption?.copyWith(color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Text(
                      chatRoom.lastMessage != null ? chatRoom.lastMessage.toString() : '채팅 없음',
                      style: theme.textTheme.bodyText2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}