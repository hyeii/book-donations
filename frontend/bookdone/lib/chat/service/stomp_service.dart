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
    String? accessToken = pref.getString('accessToken');
    if (nickname != null && accessToken != null) {
      String wsUrl = dotenv.get('API_URL') + '/ws?usernickname=$nickname';
      print("웹 소켓 연결 동작");
      print('웹소켓 주소!!: wsUrl: $wsUrl  nickname: $nickname   accessToken: $accessToken');

      stompClient = StompClient(
          config: StompConfig.SockJS(  // SockJS를 사용하는 StompConfig
            url: wsUrl,
            onConnect: (StompFrame frame) {
              stompClient?.subscribe(
                destination: '/sub',
                callback: (StompFrame frame) {
                  print('Received: ${frame.body}');
                },
              );
            },
            stompConnectHeaders: {'Authorization': 'Bearer $accessToken'},
            webSocketConnectHeaders: {'Authorization': 'Bearer $accessToken'},
            onWebSocketError: (dynamic error) => print(error),
          )
      );

      stompClient?.activate();
    }
  }

  void deactivateStompClient() {
    stompClient?.deactivate();
    print("웹 소켓 연결 끊김");
  }
}
