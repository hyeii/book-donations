import 'package:bookdone/bookinfo/model/book_comment.dart';
import 'package:bookdone/bookinfo/model/donation.dart';
import 'package:bookdone/chat/model/chat.dart';
import 'package:bookdone/mypage/model/like_book.dart';
import 'package:bookdone/mypage/model/my_book.dart';
import 'package:bookdone/onboard/model/user_res.dart';
import 'package:bookdone/regist/model/regist_get_data.dart';
import 'package:bookdone/rest_api/app_dio.dart';
import 'package:bookdone/search/model/book.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../rest_api/rest_client.dart';

part 'rest_chat.g.dart';

@riverpod
ChatRestClient restApiClient(RestApiClientRef ref) {
  return ChatRestClient(ref.watch(dioProvider));
}

@RestApi()
abstract class ChatRestClient {
  factory ChatRestClient(Dio dio) = _ChatRestClient;

  @GET('/api/chats')
  Future<ChatListDto> chatRoomList();

  @GET('/api/chats/{tradeId}/messages')
  Future<ChatMessagesDto> chatMessageList(@Path() int tradeId);


}