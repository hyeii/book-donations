import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../top/page/top_navigation_bar.dart';
import '../widgets/chat_message.dart';

class ChatRoom extends HookWidget {
  final String tradeId;
  final String nameWith;
  final String bookName;
  final String lastChat;

  const ChatRoom({
    super.key,
    required this.tradeId,
    required this.nameWith,
    required this.bookName,
    required this.lastChat,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = useTextEditingController();

    // 채팅 더미 데이터
    final List<Map<String, dynamic>> chatData = [
      {"nickname": "나", "message": "안녕하세요!", "time": "10:00", "isMine": true},
      {
        "nickname": nameWith,
        "message": "안녕하세요, 반가워요! 안녕하세요, 반가워요! 안녕하세요, 반가워요! 안녕하세요, 반가워요!",
        "time": "10:01",
        "isMine": false
      },
      {"nickname": "나", "message": "안녕하세요!", "time": "10:00", "isMine": true},
      {
        "nickname": "나",
        "message": "안녕하세요!안녕하세요!안녕하세요!안녕하세요!안녕하세요!안녕하세요!안녕하세요!안녕하세요!",
        "time": "10:00",
        "isMine": true
      },
      {
        "nickname": nameWith,
        "message": "안녕하세요, 반가워요!",
        "time": "10:01",
        "isMine": false
      },
      {
        "nickname": nameWith,
        "message": "안녕하세요, 반가워요!",
        "time": "10:01",
        "isMine": false
      },
      // 여기에 추가 채팅 데이터를 넣습니다.
    ];

    // 메시지 전송 로직
    void sendMessage() {
      messageController.clear(); // 메시지 전송 후 입력 필드 초기화
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("채팅방: $tradeId     채팅 상대: $nameWith"),
      ),
      body: Column(
        children: [
          // 버튼들을 추가하는 부분
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // 버튼 로직
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 40), // 가로 150, 세로 40
                ),
                child: Text("버튼 1"),
              ),
              ElevatedButton(
                onPressed: () {
                  // 버튼 로직
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 40), // 가로 150, 세로 40
                ),
                child: Text("버튼 2"),
              ),
            ],
          ),
          // 채팅 목록을 표시하는 부분
          Expanded(
            child: ListView.builder(
              itemCount: chatData.length,
              itemBuilder: (context, index) {
                final chat = chatData[index];
                return ChatMessage(
                  nickname: chat["nickname"],
                  message: chat["message"],
                  time: chat["time"],
                  isMine: chat["isMine"],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const TopNavigationBar(),
      bottomSheet: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: "메시지 입력...",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                // 메시지 전송 로직
                messageController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
