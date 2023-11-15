import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import '../../rest_api/rest_client.dart';
import '../model/chat.dart';
import '../widgets/chat_message.dart';

class ChatRoom extends HookConsumerWidget {
  final int tradeId;
  final String nameWith;
  final String bookName;
  final String lastChat;
  final String isbn;

  const ChatRoom({
    super.key,
    required this.tradeId,
    required this.nameWith,
    required this.bookName,
    required this.lastChat,
    required this.isbn,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController messageController = useTextEditingController();
    final chatMessages = useState<List<Message>>([]);
    final restClient = ref.read(restApiClientProvider);
    final userNickname = useState<String>("");
    final accessToken = useState<String>("");
    final bookTitle = useState<String>("");
    final stompClient = useState<StompClient?>(null);

    final scrollController = ScrollController();

    useEffect(() {
      Future<void> init() async {
        // nickname, accessToken 가져오기
        SharedPreferences pref = await SharedPreferences.getInstance();
        userNickname.value = pref.getString('nickname')!;
        accessToken.value = pref.getString('accessToken')!;
        if (userNickname.value != null && accessToken.value != null) {
          String apiUrl = dotenv.get('API_URL');
          String wsUrl = '$apiUrl/ws?usernickname=${userNickname.value}';

          // 불필요한 재연결 시도 방지
          if (stompClient.value?.isActive == true) {
            print("WebSocket이 이미 연결된 상태입니다.");
            return;
          }
          // ws 연결, 구독
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

      // 기존 채팅 목록 가져오기
      fetchChatRooms() async {
        try {
          final response = await restClient.chatMessageList(tradeId);
          chatMessages.value = response.data.cast<Message>();
        } catch (e) {
          print('Error fetching messages: $e');
        }
      }

      // 책 정보 가져오기
      fetchBook() async {
        try {
          final response = await restClient.getDetailBook(isbn);
          print(response);
          bookTitle.value = response.data.title;
        } catch (e) {
          print('Error fetching messages: $e');
        }
      }

      fetchBook();

      if (chatMessages.value.isEmpty) {
        fetchChatRooms();
      }

      return () => {
            stompClient.value?.deactivate(),
          };
    }, []);

    // 새로운 채팅 감지, 스크롤 최하단으로 이동
    useEffect(() {
      if (chatMessages.value.isNotEmpty) {
        Future.microtask(() => scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 100),
              curve: Curves.easeOut,
            ));
      }
      // chatMessages의 길이가 변경될 때만 useEffect가 실행되도록 설정
    }, [chatMessages.value.length]);

    // 메시지 전송 로직
    void sendMessage() {
      String messageText = messageController.text;
      if (messageText.isNotEmpty) {
        print("채팅 보내기");

        // 보낼 데이터 생성
        ChatMessageWriteRequest chatMessageWriteRequestDto =
            ChatMessageWriteRequest(
          tradeId: tradeId,
          message: messageText,
          senderNickname: userNickname.value,
        );

        // JSON으로 변환
        String chatMessageWriteRequest =
            jsonEncode(chatMessageWriteRequestDto.toJson());

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
      appBar: AppBar(
        title: Text("$nameWith님과의 채팅 / 책 제목: ${bookTitle.value}"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              // TODO: Display chat information or settings
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            // 버튼 두개 부분
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Button 1 action
                      },
                      child: Text('Button 1'),
                    ),
                  ),
                  SizedBox(width: 10), // Spacing between the buttons
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Button 2 action
                      },
                      child: Text('Button 2'),
                    ),
                  ),
                ],
              ),
            ),


            // 채팅 목록을 표시하는 부분
            Expanded(
              child: ListView.builder(
                // 기존 reverse 제거
                padding: EdgeInsets.only(bottom: 10),
                controller: scrollController,
                itemCount: chatMessages.value.length,
                itemBuilder: (context, index) {
                  final chat = chatMessages.value[index];
                  return ChatMessage(
                    senderNickname: chat.senderNickname,
                    message: chat.message,
                    createdAt: chat.createdAt.toString(),
                    isMine: chat.senderNickname == userNickname.value
                        ? true
                        : false,
                  );
                },
              ),
            ),
            // 메시지 입력란 부분
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: messageController,
                        decoration: InputDecoration(
                          hintText: "채팅 입력...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                        ),
                        textInputAction: TextInputAction.send,
                        onFieldSubmitted: (_) => sendMessage(),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: IconButton(
                        icon: Icon(Icons.send, color: Colors.white),
                        onPressed: sendMessage,
                      ),
                    ),
                  ],
                ),
              ),
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
