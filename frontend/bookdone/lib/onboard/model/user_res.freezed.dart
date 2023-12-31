// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRes _$UserResFromJson(Map<String, dynamic> json) {
  return _UserRes.fromJson(json);
}

/// @nodoc
mixin _$UserRes {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  UserData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserResCopyWith<UserRes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResCopyWith<$Res> {
  factory $UserResCopyWith(UserRes value, $Res Function(UserRes) then) =
      _$UserResCopyWithImpl<$Res, UserRes>;
  @useResult
  $Res call({bool success, String msg, UserData data});

  $UserDataCopyWith<$Res> get data;
}

/// @nodoc
class _$UserResCopyWithImpl<$Res, $Val extends UserRes>
    implements $UserResCopyWith<$Res> {
  _$UserResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res> get data {
    return $UserDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserResImplCopyWith<$Res> implements $UserResCopyWith<$Res> {
  factory _$$UserResImplCopyWith(
          _$UserResImpl value, $Res Function(_$UserResImpl) then) =
      __$$UserResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, UserData data});

  @override
  $UserDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$UserResImplCopyWithImpl<$Res>
    extends _$UserResCopyWithImpl<$Res, _$UserResImpl>
    implements _$$UserResImplCopyWith<$Res> {
  __$$UserResImplCopyWithImpl(
      _$UserResImpl _value, $Res Function(_$UserResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_$UserResImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResImpl implements _UserRes {
  const _$UserResImpl(
      {required this.success, required this.msg, required this.data});

  factory _$UserResImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  @override
  final UserData data;

  @override
  String toString() {
    return 'UserRes(success: $success, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, msg, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResImplCopyWith<_$UserResImpl> get copyWith =>
      __$$UserResImplCopyWithImpl<_$UserResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResImplToJson(
      this,
    );
  }
}

abstract class _UserRes implements UserRes {
  const factory _UserRes(
      {required final bool success,
      required final String msg,
      required final UserData data}) = _$UserResImpl;

  factory _UserRes.fromJson(Map<String, dynamic> json) = _$UserResImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  UserData get data;
  @override
  @JsonKey(ignore: true)
  _$$UserResImplCopyWith<_$UserResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  MemberInfo get member => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  bool get newMember => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call(
      {MemberInfo member,
      String accessToken,
      String refreshToken,
      bool newMember});

  $MemberInfoCopyWith<$Res> get member;
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = null,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? newMember = null,
  }) {
    return _then(_value.copyWith(
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as MemberInfo,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      newMember: null == newMember
          ? _value.newMember
          : newMember // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MemberInfoCopyWith<$Res> get member {
    return $MemberInfoCopyWith<$Res>(_value.member, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
          _$UserDataImpl value, $Res Function(_$UserDataImpl) then) =
      __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MemberInfo member,
      String accessToken,
      String refreshToken,
      bool newMember});

  @override
  $MemberInfoCopyWith<$Res> get member;
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
      _$UserDataImpl _value, $Res Function(_$UserDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = null,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? newMember = null,
  }) {
    return _then(_$UserDataImpl(
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as MemberInfo,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      newMember: null == newMember
          ? _value.newMember
          : newMember // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataImpl implements _UserData {
  const _$UserDataImpl(
      {required this.member,
      required this.accessToken,
      required this.refreshToken,
      required this.newMember});

  factory _$UserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataImplFromJson(json);

  @override
  final MemberInfo member;
  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final bool newMember;

  @override
  String toString() {
    return 'UserData(member: $member, accessToken: $accessToken, refreshToken: $refreshToken, newMember: $newMember)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.newMember, newMember) ||
                other.newMember == newMember));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, member, accessToken, refreshToken, newMember);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataImplToJson(
      this,
    );
  }
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {required final MemberInfo member,
      required final String accessToken,
      required final String refreshToken,
      required final bool newMember}) = _$UserDataImpl;

  factory _UserData.fromJson(Map<String, dynamic> json) =
      _$UserDataImpl.fromJson;

  @override
  MemberInfo get member;
  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  bool get newMember;
  @override
  @JsonKey(ignore: true)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MemberInfo _$MemberInfoFromJson(Map<String, dynamic> json) {
  return _MemberInfo.fromJson(json);
}

/// @nodoc
mixin _$MemberInfo {
  int get id => throw _privateConstructorUsedError;
  String get oauthId => throw _privateConstructorUsedError;
  dynamic get nickname => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  dynamic get fcmToken => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberInfoCopyWith<MemberInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberInfoCopyWith<$Res> {
  factory $MemberInfoCopyWith(
          MemberInfo value, $Res Function(MemberInfo) then) =
      _$MemberInfoCopyWithImpl<$Res, MemberInfo>;
  @useResult
  $Res call(
      {int id,
      String oauthId,
      dynamic nickname,
      String address,
      dynamic fcmToken,
      int point,
      String image});
}

/// @nodoc
class _$MemberInfoCopyWithImpl<$Res, $Val extends MemberInfo>
    implements $MemberInfoCopyWith<$Res> {
  _$MemberInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? oauthId = null,
    Object? nickname = freezed,
    Object? address = null,
    Object? fcmToken = freezed,
    Object? point = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      oauthId: null == oauthId
          ? _value.oauthId
          : oauthId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as dynamic,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberInfoImplCopyWith<$Res>
    implements $MemberInfoCopyWith<$Res> {
  factory _$$MemberInfoImplCopyWith(
          _$MemberInfoImpl value, $Res Function(_$MemberInfoImpl) then) =
      __$$MemberInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String oauthId,
      dynamic nickname,
      String address,
      dynamic fcmToken,
      int point,
      String image});
}

/// @nodoc
class __$$MemberInfoImplCopyWithImpl<$Res>
    extends _$MemberInfoCopyWithImpl<$Res, _$MemberInfoImpl>
    implements _$$MemberInfoImplCopyWith<$Res> {
  __$$MemberInfoImplCopyWithImpl(
      _$MemberInfoImpl _value, $Res Function(_$MemberInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? oauthId = null,
    Object? nickname = freezed,
    Object? address = null,
    Object? fcmToken = freezed,
    Object? point = null,
    Object? image = null,
  }) {
    return _then(_$MemberInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      oauthId: null == oauthId
          ? _value.oauthId
          : oauthId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as dynamic,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberInfoImpl implements _MemberInfo {
  const _$MemberInfoImpl(
      {required this.id,
      required this.oauthId,
      required this.nickname,
      required this.address,
      required this.fcmToken,
      required this.point,
      required this.image});

  factory _$MemberInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberInfoImplFromJson(json);

  @override
  final int id;
  @override
  final String oauthId;
  @override
  final dynamic nickname;
  @override
  final String address;
  @override
  final dynamic fcmToken;
  @override
  final int point;
  @override
  final String image;

  @override
  String toString() {
    return 'MemberInfo(id: $id, oauthId: $oauthId, nickname: $nickname, address: $address, fcmToken: $fcmToken, point: $point, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.oauthId, oauthId) || other.oauthId == oauthId) &&
            const DeepCollectionEquality().equals(other.nickname, nickname) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other.fcmToken, fcmToken) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      oauthId,
      const DeepCollectionEquality().hash(nickname),
      address,
      const DeepCollectionEquality().hash(fcmToken),
      point,
      image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberInfoImplCopyWith<_$MemberInfoImpl> get copyWith =>
      __$$MemberInfoImplCopyWithImpl<_$MemberInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberInfoImplToJson(
      this,
    );
  }
}

abstract class _MemberInfo implements MemberInfo {
  const factory _MemberInfo(
      {required final int id,
      required final String oauthId,
      required final dynamic nickname,
      required final String address,
      required final dynamic fcmToken,
      required final int point,
      required final String image}) = _$MemberInfoImpl;

  factory _MemberInfo.fromJson(Map<String, dynamic> json) =
      _$MemberInfoImpl.fromJson;

  @override
  int get id;
  @override
  String get oauthId;
  @override
  dynamic get nickname;
  @override
  String get address;
  @override
  dynamic get fcmToken;
  @override
  int get point;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$MemberInfoImplCopyWith<_$MemberInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckNickname _$CheckNicknameFromJson(Map<String, dynamic> json) {
  return _CheckNickname.fromJson(json);
}

/// @nodoc
mixin _$CheckNickname {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  Available get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckNicknameCopyWith<CheckNickname> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckNicknameCopyWith<$Res> {
  factory $CheckNicknameCopyWith(
          CheckNickname value, $Res Function(CheckNickname) then) =
      _$CheckNicknameCopyWithImpl<$Res, CheckNickname>;
  @useResult
  $Res call({bool success, String msg, Available data});

  $AvailableCopyWith<$Res> get data;
}

/// @nodoc
class _$CheckNicknameCopyWithImpl<$Res, $Val extends CheckNickname>
    implements $CheckNicknameCopyWith<$Res> {
  _$CheckNicknameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Available,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AvailableCopyWith<$Res> get data {
    return $AvailableCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckNicknameImplCopyWith<$Res>
    implements $CheckNicknameCopyWith<$Res> {
  factory _$$CheckNicknameImplCopyWith(
          _$CheckNicknameImpl value, $Res Function(_$CheckNicknameImpl) then) =
      __$$CheckNicknameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, Available data});

  @override
  $AvailableCopyWith<$Res> get data;
}

/// @nodoc
class __$$CheckNicknameImplCopyWithImpl<$Res>
    extends _$CheckNicknameCopyWithImpl<$Res, _$CheckNicknameImpl>
    implements _$$CheckNicknameImplCopyWith<$Res> {
  __$$CheckNicknameImplCopyWithImpl(
      _$CheckNicknameImpl _value, $Res Function(_$CheckNicknameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_$CheckNicknameImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Available,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckNicknameImpl implements _CheckNickname {
  const _$CheckNicknameImpl(
      {required this.success, required this.msg, required this.data});

  factory _$CheckNicknameImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckNicknameImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  @override
  final Available data;

  @override
  String toString() {
    return 'CheckNickname(success: $success, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckNicknameImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, msg, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckNicknameImplCopyWith<_$CheckNicknameImpl> get copyWith =>
      __$$CheckNicknameImplCopyWithImpl<_$CheckNicknameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckNicknameImplToJson(
      this,
    );
  }
}

abstract class _CheckNickname implements CheckNickname {
  const factory _CheckNickname(
      {required final bool success,
      required final String msg,
      required final Available data}) = _$CheckNicknameImpl;

  factory _CheckNickname.fromJson(Map<String, dynamic> json) =
      _$CheckNicknameImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  Available get data;
  @override
  @JsonKey(ignore: true)
  _$$CheckNicknameImplCopyWith<_$CheckNicknameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Available _$AvailableFromJson(Map<String, dynamic> json) {
  return _Available.fromJson(json);
}

/// @nodoc
mixin _$Available {
  bool get available => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvailableCopyWith<Available> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableCopyWith<$Res> {
  factory $AvailableCopyWith(Available value, $Res Function(Available) then) =
      _$AvailableCopyWithImpl<$Res, Available>;
  @useResult
  $Res call({bool available});
}

/// @nodoc
class _$AvailableCopyWithImpl<$Res, $Val extends Available>
    implements $AvailableCopyWith<$Res> {
  _$AvailableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
  }) {
    return _then(_value.copyWith(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailableImplCopyWith<$Res>
    implements $AvailableCopyWith<$Res> {
  factory _$$AvailableImplCopyWith(
          _$AvailableImpl value, $Res Function(_$AvailableImpl) then) =
      __$$AvailableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool available});
}

/// @nodoc
class __$$AvailableImplCopyWithImpl<$Res>
    extends _$AvailableCopyWithImpl<$Res, _$AvailableImpl>
    implements _$$AvailableImplCopyWith<$Res> {
  __$$AvailableImplCopyWithImpl(
      _$AvailableImpl _value, $Res Function(_$AvailableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
  }) {
    return _then(_$AvailableImpl(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailableImpl implements _Available {
  const _$AvailableImpl({required this.available});

  factory _$AvailableImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailableImplFromJson(json);

  @override
  final bool available;

  @override
  String toString() {
    return 'Available(available: $available)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableImpl &&
            (identical(other.available, available) ||
                other.available == available));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, available);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableImplCopyWith<_$AvailableImpl> get copyWith =>
      __$$AvailableImplCopyWithImpl<_$AvailableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailableImplToJson(
      this,
    );
  }
}

abstract class _Available implements Available {
  const factory _Available({required final bool available}) = _$AvailableImpl;

  factory _Available.fromJson(Map<String, dynamic> json) =
      _$AvailableImpl.fromJson;

  @override
  bool get available;
  @override
  @JsonKey(ignore: true)
  _$$AvailableImplCopyWith<_$AvailableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserInfoRes _$UserInfoResFromJson(Map<String, dynamic> json) {
  return _UserInfoRes.fromJson(json);
}

/// @nodoc
mixin _$UserInfoRes {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  MemberInfo get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoResCopyWith<UserInfoRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoResCopyWith<$Res> {
  factory $UserInfoResCopyWith(
          UserInfoRes value, $Res Function(UserInfoRes) then) =
      _$UserInfoResCopyWithImpl<$Res, UserInfoRes>;
  @useResult
  $Res call({bool success, String msg, MemberInfo data});

  $MemberInfoCopyWith<$Res> get data;
}

/// @nodoc
class _$UserInfoResCopyWithImpl<$Res, $Val extends UserInfoRes>
    implements $UserInfoResCopyWith<$Res> {
  _$UserInfoResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MemberInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MemberInfoCopyWith<$Res> get data {
    return $MemberInfoCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserInfoResImplCopyWith<$Res>
    implements $UserInfoResCopyWith<$Res> {
  factory _$$UserInfoResImplCopyWith(
          _$UserInfoResImpl value, $Res Function(_$UserInfoResImpl) then) =
      __$$UserInfoResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, MemberInfo data});

  @override
  $MemberInfoCopyWith<$Res> get data;
}

/// @nodoc
class __$$UserInfoResImplCopyWithImpl<$Res>
    extends _$UserInfoResCopyWithImpl<$Res, _$UserInfoResImpl>
    implements _$$UserInfoResImplCopyWith<$Res> {
  __$$UserInfoResImplCopyWithImpl(
      _$UserInfoResImpl _value, $Res Function(_$UserInfoResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_$UserInfoResImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MemberInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoResImpl implements _UserInfoRes {
  const _$UserInfoResImpl(
      {required this.success, required this.msg, required this.data});

  factory _$UserInfoResImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoResImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  @override
  final MemberInfo data;

  @override
  String toString() {
    return 'UserInfoRes(success: $success, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoResImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, msg, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoResImplCopyWith<_$UserInfoResImpl> get copyWith =>
      __$$UserInfoResImplCopyWithImpl<_$UserInfoResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoResImplToJson(
      this,
    );
  }
}

abstract class _UserInfoRes implements UserInfoRes {
  const factory _UserInfoRes(
      {required final bool success,
      required final String msg,
      required final MemberInfo data}) = _$UserInfoResImpl;

  factory _UserInfoRes.fromJson(Map<String, dynamic> json) =
      _$UserInfoResImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  MemberInfo get data;
  @override
  @JsonKey(ignore: true)
  _$$UserInfoResImplCopyWith<_$UserInfoResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DefaultReps _$DefaultRepsFromJson(Map<String, dynamic> json) {
  return _DefaultReps.fromJson(json);
}

/// @nodoc
mixin _$DefaultReps {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefaultRepsCopyWith<DefaultReps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultRepsCopyWith<$Res> {
  factory $DefaultRepsCopyWith(
          DefaultReps value, $Res Function(DefaultReps) then) =
      _$DefaultRepsCopyWithImpl<$Res, DefaultReps>;
  @useResult
  $Res call({bool success, String msg, String? data});
}

/// @nodoc
class _$DefaultRepsCopyWithImpl<$Res, $Val extends DefaultReps>
    implements $DefaultRepsCopyWith<$Res> {
  _$DefaultRepsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DefaultRepsImplCopyWith<$Res>
    implements $DefaultRepsCopyWith<$Res> {
  factory _$$DefaultRepsImplCopyWith(
          _$DefaultRepsImpl value, $Res Function(_$DefaultRepsImpl) then) =
      __$$DefaultRepsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, String? data});
}

/// @nodoc
class __$$DefaultRepsImplCopyWithImpl<$Res>
    extends _$DefaultRepsCopyWithImpl<$Res, _$DefaultRepsImpl>
    implements _$$DefaultRepsImplCopyWith<$Res> {
  __$$DefaultRepsImplCopyWithImpl(
      _$DefaultRepsImpl _value, $Res Function(_$DefaultRepsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = freezed,
  }) {
    return _then(_$DefaultRepsImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DefaultRepsImpl implements _DefaultReps {
  const _$DefaultRepsImpl(
      {required this.success, required this.msg, this.data});

  factory _$DefaultRepsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefaultRepsImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  @override
  final String? data;

  @override
  String toString() {
    return 'DefaultReps(success: $success, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefaultRepsImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, msg, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DefaultRepsImplCopyWith<_$DefaultRepsImpl> get copyWith =>
      __$$DefaultRepsImplCopyWithImpl<_$DefaultRepsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefaultRepsImplToJson(
      this,
    );
  }
}

abstract class _DefaultReps implements DefaultReps {
  const factory _DefaultReps(
      {required final bool success,
      required final String msg,
      final String? data}) = _$DefaultRepsImpl;

  factory _DefaultReps.fromJson(Map<String, dynamic> json) =
      _$DefaultRepsImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  String? get data;
  @override
  @JsonKey(ignore: true)
  _$$DefaultRepsImplCopyWith<_$DefaultRepsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
