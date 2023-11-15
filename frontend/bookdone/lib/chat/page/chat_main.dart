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
    final isChatRoomFetched = useState(false);

    fetchChatRooms() async {
      try {
        final response = await restClient.chatRoomList();
        chatRooms.value = response.data;
        isChatRoomFetched.value = true;
      } catch (e) {
        print('Error fetching chat rooms: $e');
      }
    }

    useEffect(() {
      if (chatRooms.value.isEmpty && !isChatRoomFetched.value) {
        fetchChatRooms();
      }

      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("채팅"), // Using const for text widget
      ),
      body: chatRooms.value.isEmpty && isChatRoomFetched.value
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.chat_bubble_outline,
              size: 100,
              color: Colors.grey[400],
            ),
            Text(
              "채팅이 없습니다.",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "채팅을 시작해보세요.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      )
          : ListView.separated(
        itemCount: chatRooms.value.length,
        itemBuilder: (context, index) {
          final chatRoom = chatRooms.value[index];
          return ChatRoomCard(chatRoom: chatRoom);
        },
        separatorBuilder: (context, index) => const SizedBox.shrink(),
      ),
    );
  }
}