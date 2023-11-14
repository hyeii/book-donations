import 'package:bookdone/chat/service/rest_chat.dart';
import 'package:bookdone/chat/widgets/chatroom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/chat.dart';

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
    }, []);

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
              separatorBuilder: (context, index) => SizedBox.shrink(),
            ),
    );
  }
}
