import 'dart:convert';

import 'package:bookdone/chat/widgets/trade_button.dart';
import 'package:bookdone/search/model/book.dart';
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
    final stompClient = useState<StompClient?>(null);
    final bookData = useState<BookData?>(null);

    final refreshTrigger = useState(0); // 채팅 입력 시 Button 변경 트리거

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
          bookData.value = response.data;
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
      // 채팅 입력 시 버튼 변경을 위해 refreshTrigger를 사용
      refreshTrigger.value = chatMessages.value.length;
    }, [chatMessages.value.length]);

    // 메시지 전송 로직
    void sendMessage() {
      String messageText = messageController.text;
      if (messageText.isNotEmpty) {

        // 보낼 데이터 생성
        ChatMessageWriteRequest chatMessageWriteRequestDto =
            ChatMessageWriteRequest(
          tradeId: tradeId,
          message: messageText,
          senderNickname: userNickname.value,
        );

        String chatMessageWriteRequest =
            jsonEncode(chatMessageWriteRequestDto.toJson());

        String sendUrl = "/app/chat/$tradeId";
        stompClient.value?.send(
          destination: sendUrl,
          body: chatMessageWriteRequest,
        );
        messageController.clear();
      }
    }

    ImageProvider<Object> getAvatarImage(String? url) {
      if (url != null && url.isNotEmpty && url.startsWith('http')) {
        return NetworkImage(url);
      } else {
        return AssetImage('assets/images/sample-bookdone.png');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: getAvatarImage(bookData.value?.titleUrl),
              radius: 20,
            ),
            SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$nameWith님과의 채팅",
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    bookName,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
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
            TradeButton(tradeId: tradeId, refreshTrigger: refreshTrigger.value),
            // 채팅 목록을 표시하는 부분
            Flexible(
              child: ListView.builder(
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
                    Flexible(
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
