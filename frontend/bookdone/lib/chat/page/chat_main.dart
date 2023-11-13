import 'package:bookdone/chat/widgets/chatroom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import '../../top/page/top_navigation_bar.dart';
import '../service/stomp_service.dart';

class ChatMain extends HookWidget {
  const ChatMain({super.key});

  @override
  Widget build(BuildContext context) {
    final StompService stompService = StompService();

    useEffect(() {
      stompService.initStompClient();


      return () {
        stompService.deactivateStompClient();

      };
    }, const []);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("채팅"),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ChatRoomCard();
          },
          separatorBuilder: (context, index) => Divider(),
        ),
      ),
    );
  }
}
