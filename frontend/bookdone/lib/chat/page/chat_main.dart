import 'package:bookdone/chat/widgets/chatroom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // env 사용
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class ChatMain extends HookWidget {
  const ChatMain({super.key});

  @override
  Widget build(BuildContext context) {
    String? wsUrl = DotEnv().env['WS_URL'];
    final stompClient = useState<StompClient?>(null);

    useEffect(() {
      void onConnect(StompFrame frame) {
        stompClient.value?.subscribe(
            destination: '/sub',
            callback: (StompFrame frame) {
              print('Received: ${frame.body}');
            });
      }

      stompClient.value = StompClient(
          config: StompConfig(
              url: 'ws://$wsUrl',
              onConnect: onConnect,
              onWebSocketError: (dynamic error) => print(error),
              stompConnectHeaders: {}));

      stompClient.value?.activate();

      return () {
        stompClient.value?.deactivate();
      };
    }, const []);

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
