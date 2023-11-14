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
      child: SizedBox(
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
                  "https://image.aladin.co.kr/product/29045/74/cover500/k192836746_2.jpg", // 이미지 URL 변경 필요
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(width: 10),
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
                                '${chatRoom.userNickname}님과의 채팅',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                chatRoom.lastMessageTime != null
                                    ? chatRoom.lastMessageTime.toString()
                                    : '마지막 채팅 시간 정보 없음', // null일 경우 '시간 정보 없음'을 표시
                              )
                            ],
                          ),
                          // 다른 정보 표시 필요하면 추가
                        ],
                      ),
                      Text(
                        chatRoom.lastMessage != null
                            ? chatRoom.lastMessage.toString()
                            : '채팅 없음',
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
