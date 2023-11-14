import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

import '../model/chat.dart';

typedef OnMessageReceived = void Function(Message message);

class StompService {
  static final StompService _instance = StompService._internal();
  StompClient? stompClient;
  bool isConnected = false;

  factory StompService() {
    return _instance;
  }

  StompService._internal();

  Future<void> initStompClient(int tradeId) async {
    if (stompClient != null && isConnected) {
      print("StompClient is already initialized and connected.");
      return;
    }

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? nickname = pref.getString('nickname');
    String? accessToken = pref.getString('accessToken');
    if (nickname == null || accessToken == null) {
      print("Nickname or Access Token is not available.");
      return;
    }

    String wsUrl = dotenv.get('API_URL') + '/ws?usernickname=$nickname';
    stompClient = StompClient(
      config: StompConfig.SockJS(
        url: wsUrl,
        onConnect: (StompFrame frame) {
          isConnected = true;
          print("Connected to WebSocket $isConnected");
        },
        stompConnectHeaders: {'Authorization': 'Bearer $accessToken'},
        webSocketConnectHeaders: {'Authorization': 'Bearer $accessToken'},
        onWebSocketError: (dynamic error) => print(error),
      ),
    );

    stompClient!.activate();
  }

  void subscribeToMessages(int tradeId, OnMessageReceived onMessageReceived) {
    stompClient?.subscribe(
      destination: '/sub/chat/$tradeId',
      callback: (StompFrame frame) {
        if (frame.body != null) {
          print("sub 완료, Received message: ${frame.body}");

          ChatMessageResponse chatResponse =
              ChatMessageResponse.fromJson(jsonDecode(frame.body!));
          Message message = Message(
            tradeId: chatResponse.tradeId,
            message: chatResponse.message,
            senderNickname: chatResponse.senderNickname,
            createdAt: chatResponse.createdAt,
          );

          print("message: ${message}");
          onMessageReceived(message);
        }
      },
    );
  }

  void sendMessage(ChatMessageWriteRequest request) {
    if (!isConnected || stompClient == null) {
      print("WebSocket is not connected.");
      return;
    }

    String jsonMessage = jsonEncode(request.toJson());
    stompClient!.send(
      destination: '/app/chat/${request.tradeId}',
      body: jsonMessage,
    );
  }

  void deactivateStompClient() {
    if (!isConnected || stompClient == null) {
      print("WebSocket is not connected or null.");
      return;
    }

    stompClient!.deactivate();
    isConnected = false;
    print("WebSocket connection is deactivated.");
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

class ChatMessageResponse {
  final int tradeId;
  final String senderNickname;
  final String message;
  final DateTime createdAt;

  ChatMessageResponse({
    required this.tradeId,
    required this.senderNickname,
    required this.message,
    required this.createdAt,
  });

  factory ChatMessageResponse.fromJson(Map<String, dynamic> json) {
    return ChatMessageResponse(
      tradeId: json['tradeId'],
      senderNickname: json['senderNickname'],
      message: json['message'],
      createdAt: DateTime.parse(json['createdAt']), // JSON 문자열을 DateTime으로 변환
    );
  }
}
