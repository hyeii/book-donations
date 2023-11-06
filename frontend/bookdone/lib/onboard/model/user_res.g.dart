// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResImpl _$$UserResImplFromJson(Map<String, dynamic> json) =>
    _$UserResImpl(
      success: json['success'] as bool,
      msg: json['msg'] as String,
      data: UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserResImplToJson(_$UserResImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      member: MemberInfo.fromJson(json['member'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      newMember: json['newMember'] as bool,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'member': instance.member,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'newMember': instance.newMember,
    };

_$MemberInfoImpl _$$MemberInfoImplFromJson(Map<String, dynamic> json) =>
    _$MemberInfoImpl(
      id: json['id'] as int,
      oauthId: json['oauthId'] as String,
      nickname: json['nickname'],
      address: json['address'] as String,
      point: json['point'] as int,
      email: json['email'],
      image: json['image'] as String,
    );

Map<String, dynamic> _$$MemberInfoImplToJson(_$MemberInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'oauthId': instance.oauthId,
      'nickname': instance.nickname,
      'address': instance.address,
      'point': instance.point,
      'email': instance.email,
      'image': instance.image,
    };

_$CheckNicknameImpl _$$CheckNicknameImplFromJson(Map<String, dynamic> json) =>
    _$CheckNicknameImpl(
      success: json['success'] as bool,
      msg: json['msg'] as String,
      data: Available.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CheckNicknameImplToJson(_$CheckNicknameImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

_$AvailableImpl _$$AvailableImplFromJson(Map<String, dynamic> json) =>
    _$AvailableImpl(
      available: json['available'] as bool,
    );

Map<String, dynamic> _$$AvailableImplToJson(_$AvailableImpl instance) =>
    <String, dynamic>{
      'available': instance.available,
    };

_$UserInfoResImpl _$$UserInfoResImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoResImpl(
      success: json['success'] as bool,
      msg: json['msg'] as String,
      data: MemberInfo.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserInfoResImplToJson(_$UserInfoResImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };
