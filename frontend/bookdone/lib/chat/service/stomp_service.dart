import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class StompService {
  StompClient? stompClient;

  Future<void> initStompClient() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? nickname = pref.getString('nickname');
    if (nickname != null) {
      String wsUrl = dotenv.get('WS_URL') + '?usernickname=$nickname';

      stompClient = StompClient(
          config: StompConfig(
              url: wsUrl,
              onConnect: (StompFrame frame) {
                stompClient?.subscribe(
                    destination: '/sub',
                    callback: (StompFrame frame) {
                      print('Received: ${frame.body}');
                    }
                );
              },
              onWebSocketError: (dynamic error) => print(error),
              stompConnectHeaders: {}
          )
      );

      stompClient?.activate();
    }
  }

  void deactivateStompClient() {
    stompClient?.deactivate();
  }
}
