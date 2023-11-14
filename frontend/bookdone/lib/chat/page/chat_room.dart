import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import '../model/chat.dart';
import '../service/rest_chat.dart';
import '../widgets/chat_message.dart';

class ChatRoom extends HookConsumerWidget {
  final int tradeId;
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
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController messageController = useTextEditingController();
    final chatMessages = useState<List<Message>>([]);
    final restClient = ref.read(restApiClientProvider);

    final userNickname = useState<String>("");
    final accessToken = useState<String>("");
    final stompClient = useState<StompClient?>(null);

    useEffect(() {
      Future<void> init() async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        userNickname.value = pref.getString('nickname')!;
        accessToken.value = pref.getString('accessToken')!;

        if (userNickname.value != null && accessToken.value != null) {
          String apiUrl = dotenv.get('API_URL');
          String wsUrl = '$apiUrl/ws?usernickname=${userNickname.value}';

          print(wsUrl);

          stompClient.value = StompClient(
            config: StompConfig.SockJS(
              url: wsUrl,
              onConnect: (StompFrame frame) {
                print("Connected to WebSocket");

                stompClient.value?.subscribe(
                    destination: '/sub/chat/$tradeId',
                    callback: (StompFrame frame) {
                      if (frame.body != null) {
                        final message =
                            Message.fromJson(jsonDecode(frame.body!));

                        print(message);

                        chatMessages.value = [...chatMessages.value, message];
                      }
                    });
              },
              stompConnectHeaders: {
                'Authorization': 'Bearer ${accessToken.value}'
              },
              webSocketConnectHeaders: {
                'Authorization': 'Bearer ${accessToken.value}'
              },
              onWebSocketError: (dynamic error) => print(error),
            ),
          );

          stompClient.value?.activate();
        }
      }

      init();

      // 사용자 닉네임 및 초기 채팅 목록 가져오기
      if (chatMessages.value.isEmpty) {
        fetchChatRooms() async {
          try {
            final response = await restClient.chatMessageList(tradeId);
            chatMessages.value = response.data.cast<Message>();
          } catch (e) {
            print('Error fetching messages: $e');
          }
        }

        fetchChatRooms();
      }

      return () => stompClient.value?.deactivate();
    }, []);

    // 메시지 전송 로직
    void sendMessage() {
      String messageText = messageController.text;
      if (messageText.isNotEmpty) {
        print("메시지 보내기");

        // ChatMessageWriteRequest 인스턴스 생성
        ChatMessageWriteRequest chatMessageWriteRequestDto =
            ChatMessageWriteRequest(
          tradeId: tradeId,
          message: messageText,
          senderNickname: userNickname.value,
        );

        // JSON으로 변환
        String chatMessageWriteRequest =
            jsonEncode(chatMessageWriteRequestDto.toJson());
        print("chatMessageWriteRequest: $chatMessageWriteRequest");

        String sendUrl = "/app/chat/$tradeId";
        print(sendUrl);

        stompClient.value?.send(
          destination: sendUrl,
          body: chatMessageWriteRequest,
        );
        messageController.clear();
      }
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
              itemCount: chatMessages.value.length,
              itemBuilder: (context, index) {
                final chat = chatMessages.value[index];
                return ChatMessage(
                  senderNickname: chat.senderNickname,
                  message: chat.message,
                  createdAt: chat.createdAt.toString(),
                  isMine: chat.senderNickname == "chacha" ? true : false,
                );
              },
            ),
          ),
        ],
      ),
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
              onPressed: sendMessage, // 여기에 sendMessage 함수 연결
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessageWriteRequest {
  final String message;
  final int tradeId;
  final String senderNickname;

  ChatMessageWriteRequest({
    required this.message,
    required this.tradeId,
    required this.senderNickname,
  });

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'tradeId': tradeId,
      'senderNickname': senderNickname,
    };
  }
}
