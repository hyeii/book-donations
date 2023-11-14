import 'package:bookdone/chat/service/rest_chat.dart';
import 'package:bookdone/chat/widgets/chatroom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import '../../top/page/top_navigation_bar.dart';
import '../model/chat.dart';
import '../service/stomp_service.dart';

class ChatMain extends HookConsumerWidget {
  const ChatMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatRooms = useState<List<ChatRoomResponse>>([]);
    final restClient = ref.read(restApiClientProvider);

    useEffect(() {
      fetchChatRooms() async {
        try {
          final response = await restClient.chatRoomList();
          chatRooms.value = response.data;
          print(chatRooms.value);
        } catch (e) {
          print('Error fetching chat rooms: $e');
        }
      }

      fetchChatRooms();
      return null;
    },[]);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("채팅"),
      ),
      body: chatRooms.value.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
        itemCount: chatRooms.value.length,
        itemBuilder: (context, index) {
          final chatRoom = chatRooms.value[index];
          return ChatRoomCard(chatRoom: chatRoom); // 수정된 ChatRoomCard 사용
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}
