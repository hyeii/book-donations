import 'package:bookdone/chat/widgets/chatroom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ChatMain extends HookWidget {
  const ChatMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("채팅"),
      ),
      body: Center(
          child: ListView.separated(
        itemCount: 8,
        itemBuilder: (context, index) {
          return ChatRoomCard();
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      )),
    );
  }
}
