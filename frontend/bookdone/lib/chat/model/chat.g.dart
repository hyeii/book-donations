// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatListDtoImpl _$$ChatListDtoImplFromJson(Map<String, dynamic> json) =>
    _$ChatListDtoImpl(
      success: json['success'] as bool,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ChatRoomResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatListDtoImplToJson(_$ChatListDtoImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

_$ChatRoomResponseImpl _$$ChatRoomResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatRoomResponseImpl(
      tradeId: json['tradeId'] as int,
      userNickname: json['userNickname'] as String,
      lastMessage: json['lastMessage'] as String?,
      lastMessageTime:
          _dateTimeFromIsoString(json['lastMessageTime'] as String?),
    );

Map<String, dynamic> _$$ChatRoomResponseImplToJson(
        _$ChatRoomResponseImpl instance) =>
    <String, dynamic>{
      'tradeId': instance.tradeId,
      'userNickname': instance.userNickname,
      'lastMessage': instance.lastMessage,
      'lastMessageTime': _dateTimeToIsoString(instance.lastMessageTime),
    };

_$ChatMessagesDtoImpl _$$ChatMessagesDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatMessagesDtoImpl(
      success: json['success'] as bool,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatMessagesDtoImplToJson(
        _$ChatMessagesDtoImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      tradeId: json['tradeId'] as int,
      message: json['message'] as String,
      senderNickname: json['senderNickname'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'tradeId': instance.tradeId,
      'message': instance.message,
      'senderNickname': instance.senderNickname,
      'createdAt': instance.createdAt.toIso8601String(),
    };
