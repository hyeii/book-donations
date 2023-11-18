// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatRoomRequest _$ChatRoomRequestFromJson(Map<String, dynamic> json) {
  return _ChatRoomRequest.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomRequest {
  String get user1 => throw _privateConstructorUsedError;
  String get user2 => throw _privateConstructorUsedError;
  int get tradeId => throw _privateConstructorUsedError;
  String get isbn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomRequestCopyWith<ChatRoomRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomRequestCopyWith<$Res> {
  factory $ChatRoomRequestCopyWith(
          ChatRoomRequest value, $Res Function(ChatRoomRequest) then) =
      _$ChatRoomRequestCopyWithImpl<$Res, ChatRoomRequest>;
  @useResult
  $Res call({String user1, String user2, int tradeId, String isbn});
}

/// @nodoc
class _$ChatRoomRequestCopyWithImpl<$Res, $Val extends ChatRoomRequest>
    implements $ChatRoomRequestCopyWith<$Res> {
  _$ChatRoomRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user1 = null,
    Object? user2 = null,
    Object? tradeId = null,
    Object? isbn = null,
  }) {
    return _then(_value.copyWith(
      user1: null == user1
          ? _value.user1
          : user1 // ignore: cast_nullable_to_non_nullable
              as String,
      user2: null == user2
          ? _value.user2
          : user2 // ignore: cast_nullable_to_non_nullable
              as String,
      tradeId: null == tradeId
          ? _value.tradeId
          : tradeId // ignore: cast_nullable_to_non_nullable
              as int,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRoomRequestImplCopyWith<$Res>
    implements $ChatRoomRequestCopyWith<$Res> {
  factory _$$ChatRoomRequestImplCopyWith(_$ChatRoomRequestImpl value,
          $Res Function(_$ChatRoomRequestImpl) then) =
      __$$ChatRoomRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String user1, String user2, int tradeId, String isbn});
}

/// @nodoc
class __$$ChatRoomRequestImplCopyWithImpl<$Res>
    extends _$ChatRoomRequestCopyWithImpl<$Res, _$ChatRoomRequestImpl>
    implements _$$ChatRoomRequestImplCopyWith<$Res> {
  __$$ChatRoomRequestImplCopyWithImpl(
      _$ChatRoomRequestImpl _value, $Res Function(_$ChatRoomRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user1 = null,
    Object? user2 = null,
    Object? tradeId = null,
    Object? isbn = null,
  }) {
    return _then(_$ChatRoomRequestImpl(
      user1: null == user1
          ? _value.user1
          : user1 // ignore: cast_nullable_to_non_nullable
              as String,
      user2: null == user2
          ? _value.user2
          : user2 // ignore: cast_nullable_to_non_nullable
              as String,
      tradeId: null == tradeId
          ? _value.tradeId
          : tradeId // ignore: cast_nullable_to_non_nullable
              as int,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomRequestImpl implements _ChatRoomRequest {
  const _$ChatRoomRequestImpl(
      {required this.user1,
      required this.user2,
      required this.tradeId,
      required this.isbn});

  factory _$ChatRoomRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoomRequestImplFromJson(json);

  @override
  final String user1;
  @override
  final String user2;
  @override
  final int tradeId;
  @override
  final String isbn;

  @override
  String toString() {
    return 'ChatRoomRequest(user1: $user1, user2: $user2, tradeId: $tradeId, isbn: $isbn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomRequestImpl &&
            (identical(other.user1, user1) || other.user1 == user1) &&
            (identical(other.user2, user2) || other.user2 == user2) &&
            (identical(other.tradeId, tradeId) || other.tradeId == tradeId) &&
            (identical(other.isbn, isbn) || other.isbn == isbn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user1, user2, tradeId, isbn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomRequestImplCopyWith<_$ChatRoomRequestImpl> get copyWith =>
      __$$ChatRoomRequestImplCopyWithImpl<_$ChatRoomRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomRequestImplToJson(
      this,
    );
  }
}

abstract class _ChatRoomRequest implements ChatRoomRequest {
  const factory _ChatRoomRequest(
      {required final String user1,
      required final String user2,
      required final int tradeId,
      required final String isbn}) = _$ChatRoomRequestImpl;

  factory _ChatRoomRequest.fromJson(Map<String, dynamic> json) =
      _$ChatRoomRequestImpl.fromJson;

  @override
  String get user1;
  @override
  String get user2;
  @override
  int get tradeId;
  @override
  String get isbn;
  @override
  @JsonKey(ignore: true)
  _$$ChatRoomRequestImplCopyWith<_$ChatRoomRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatListDto _$ChatListDtoFromJson(Map<String, dynamic> json) {
  return _ChatListDto.fromJson(json);
}

/// @nodoc
mixin _$ChatListDto {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  List<ChatRoomResponse> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatListDtoCopyWith<ChatListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatListDtoCopyWith<$Res> {
  factory $ChatListDtoCopyWith(
          ChatListDto value, $Res Function(ChatListDto) then) =
      _$ChatListDtoCopyWithImpl<$Res, ChatListDto>;
  @useResult
  $Res call({bool success, String msg, List<ChatRoomResponse> data});
}

/// @nodoc
class _$ChatListDtoCopyWithImpl<$Res, $Val extends ChatListDto>
    implements $ChatListDtoCopyWith<$Res> {
  _$ChatListDtoCopyWithImpl(this._value, this._then);

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
              as List<ChatRoomResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatListDtoImplCopyWith<$Res>
    implements $ChatListDtoCopyWith<$Res> {
  factory _$$ChatListDtoImplCopyWith(
          _$ChatListDtoImpl value, $Res Function(_$ChatListDtoImpl) then) =
      __$$ChatListDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, List<ChatRoomResponse> data});
}

/// @nodoc
class __$$ChatListDtoImplCopyWithImpl<$Res>
    extends _$ChatListDtoCopyWithImpl<$Res, _$ChatListDtoImpl>
    implements _$$ChatListDtoImplCopyWith<$Res> {
  __$$ChatListDtoImplCopyWithImpl(
      _$ChatListDtoImpl _value, $Res Function(_$ChatListDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_$ChatListDtoImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ChatRoomResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatListDtoImpl implements _ChatListDto {
  const _$ChatListDtoImpl(
      {required this.success,
      required this.msg,
      required final List<ChatRoomResponse> data})
      : _data = data;

  factory _$ChatListDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatListDtoImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  final List<ChatRoomResponse> _data;
  @override
  List<ChatRoomResponse> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ChatListDto(success: $success, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatListDtoImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, msg, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatListDtoImplCopyWith<_$ChatListDtoImpl> get copyWith =>
      __$$ChatListDtoImplCopyWithImpl<_$ChatListDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatListDtoImplToJson(
      this,
    );
  }
}

abstract class _ChatListDto implements ChatListDto {
  const factory _ChatListDto(
      {required final bool success,
      required final String msg,
      required final List<ChatRoomResponse> data}) = _$ChatListDtoImpl;

  factory _ChatListDto.fromJson(Map<String, dynamic> json) =
      _$ChatListDtoImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  List<ChatRoomResponse> get data;
  @override
  @JsonKey(ignore: true)
  _$$ChatListDtoImplCopyWith<_$ChatListDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatRoomResponse _$ChatRoomResponseFromJson(Map<String, dynamic> json) {
  return _ChatRoomResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomResponse {
  int get tradeId => throw _privateConstructorUsedError;
  String? get userNickname => throw _privateConstructorUsedError;
  String? get lastMessage => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateTimeFromIsoString, toJson: _dateTimeToIsoString)
  DateTime? get lastMessageTime => throw _privateConstructorUsedError;
  String? get isbn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomResponseCopyWith<ChatRoomResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomResponseCopyWith<$Res> {
  factory $ChatRoomResponseCopyWith(
          ChatRoomResponse value, $Res Function(ChatRoomResponse) then) =
      _$ChatRoomResponseCopyWithImpl<$Res, ChatRoomResponse>;
  @useResult
  $Res call(
      {int tradeId,
      String? userNickname,
      String? lastMessage,
      @JsonKey(fromJson: _dateTimeFromIsoString, toJson: _dateTimeToIsoString)
      DateTime? lastMessageTime,
      String? isbn});
}

/// @nodoc
class _$ChatRoomResponseCopyWithImpl<$Res, $Val extends ChatRoomResponse>
    implements $ChatRoomResponseCopyWith<$Res> {
  _$ChatRoomResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tradeId = null,
    Object? userNickname = freezed,
    Object? lastMessage = freezed,
    Object? lastMessageTime = freezed,
    Object? isbn = freezed,
  }) {
    return _then(_value.copyWith(
      tradeId: null == tradeId
          ? _value.tradeId
          : tradeId // ignore: cast_nullable_to_non_nullable
              as int,
      userNickname: freezed == userNickname
          ? _value.userNickname
          : userNickname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageTime: freezed == lastMessageTime
          ? _value.lastMessageTime
          : lastMessageTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isbn: freezed == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRoomResponseImplCopyWith<$Res>
    implements $ChatRoomResponseCopyWith<$Res> {
  factory _$$ChatRoomResponseImplCopyWith(_$ChatRoomResponseImpl value,
          $Res Function(_$ChatRoomResponseImpl) then) =
      __$$ChatRoomResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int tradeId,
      String? userNickname,
      String? lastMessage,
      @JsonKey(fromJson: _dateTimeFromIsoString, toJson: _dateTimeToIsoString)
      DateTime? lastMessageTime,
      String? isbn});
}

/// @nodoc
class __$$ChatRoomResponseImplCopyWithImpl<$Res>
    extends _$ChatRoomResponseCopyWithImpl<$Res, _$ChatRoomResponseImpl>
    implements _$$ChatRoomResponseImplCopyWith<$Res> {
  __$$ChatRoomResponseImplCopyWithImpl(_$ChatRoomResponseImpl _value,
      $Res Function(_$ChatRoomResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tradeId = null,
    Object? userNickname = freezed,
    Object? lastMessage = freezed,
    Object? lastMessageTime = freezed,
    Object? isbn = freezed,
  }) {
    return _then(_$ChatRoomResponseImpl(
      tradeId: null == tradeId
          ? _value.tradeId
          : tradeId // ignore: cast_nullable_to_non_nullable
              as int,
      userNickname: freezed == userNickname
          ? _value.userNickname
          : userNickname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageTime: freezed == lastMessageTime
          ? _value.lastMessageTime
          : lastMessageTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isbn: freezed == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomResponseImpl implements _ChatRoomResponse {
  const _$ChatRoomResponseImpl(
      {required this.tradeId,
      required this.userNickname,
      required this.lastMessage,
      @JsonKey(fromJson: _dateTimeFromIsoString, toJson: _dateTimeToIsoString)
      required this.lastMessageTime,
      required this.isbn});

  factory _$ChatRoomResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoomResponseImplFromJson(json);

  @override
  final int tradeId;
  @override
  final String? userNickname;
  @override
  final String? lastMessage;
  @override
  @JsonKey(fromJson: _dateTimeFromIsoString, toJson: _dateTimeToIsoString)
  final DateTime? lastMessageTime;
  @override
  final String? isbn;

  @override
  String toString() {
    return 'ChatRoomResponse(tradeId: $tradeId, userNickname: $userNickname, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, isbn: $isbn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomResponseImpl &&
            (identical(other.tradeId, tradeId) || other.tradeId == tradeId) &&
            (identical(other.userNickname, userNickname) ||
                other.userNickname == userNickname) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageTime, lastMessageTime) ||
                other.lastMessageTime == lastMessageTime) &&
            (identical(other.isbn, isbn) || other.isbn == isbn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, tradeId, userNickname, lastMessage, lastMessageTime, isbn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomResponseImplCopyWith<_$ChatRoomResponseImpl> get copyWith =>
      __$$ChatRoomResponseImplCopyWithImpl<_$ChatRoomResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatRoomResponse implements ChatRoomResponse {
  const factory _ChatRoomResponse(
      {required final int tradeId,
      required final String? userNickname,
      required final String? lastMessage,
      @JsonKey(fromJson: _dateTimeFromIsoString, toJson: _dateTimeToIsoString)
      required final DateTime? lastMessageTime,
      required final String? isbn}) = _$ChatRoomResponseImpl;

  factory _ChatRoomResponse.fromJson(Map<String, dynamic> json) =
      _$ChatRoomResponseImpl.fromJson;

  @override
  int get tradeId;
  @override
  String? get userNickname;
  @override
  String? get lastMessage;
  @override
  @JsonKey(fromJson: _dateTimeFromIsoString, toJson: _dateTimeToIsoString)
  DateTime? get lastMessageTime;
  @override
  String? get isbn;
  @override
  @JsonKey(ignore: true)
  _$$ChatRoomResponseImplCopyWith<_$ChatRoomResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatMessagesDto _$ChatMessagesDtoFromJson(Map<String, dynamic> json) {
  return _ChatMessagesDto.fromJson(json);
}

/// @nodoc
mixin _$ChatMessagesDto {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  List<Message> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessagesDtoCopyWith<ChatMessagesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessagesDtoCopyWith<$Res> {
  factory $ChatMessagesDtoCopyWith(
          ChatMessagesDto value, $Res Function(ChatMessagesDto) then) =
      _$ChatMessagesDtoCopyWithImpl<$Res, ChatMessagesDto>;
  @useResult
  $Res call({bool success, String msg, List<Message> data});
}

/// @nodoc
class _$ChatMessagesDtoCopyWithImpl<$Res, $Val extends ChatMessagesDto>
    implements $ChatMessagesDtoCopyWith<$Res> {
  _$ChatMessagesDtoCopyWithImpl(this._value, this._then);

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
              as List<Message>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessagesDtoImplCopyWith<$Res>
    implements $ChatMessagesDtoCopyWith<$Res> {
  factory _$$ChatMessagesDtoImplCopyWith(_$ChatMessagesDtoImpl value,
          $Res Function(_$ChatMessagesDtoImpl) then) =
      __$$ChatMessagesDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, List<Message> data});
}

/// @nodoc
class __$$ChatMessagesDtoImplCopyWithImpl<$Res>
    extends _$ChatMessagesDtoCopyWithImpl<$Res, _$ChatMessagesDtoImpl>
    implements _$$ChatMessagesDtoImplCopyWith<$Res> {
  __$$ChatMessagesDtoImplCopyWithImpl(
      _$ChatMessagesDtoImpl _value, $Res Function(_$ChatMessagesDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_$ChatMessagesDtoImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessagesDtoImpl implements _ChatMessagesDto {
  const _$ChatMessagesDtoImpl(
      {required this.success,
      required this.msg,
      required final List<Message> data})
      : _data = data;

  factory _$ChatMessagesDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessagesDtoImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  final List<Message> _data;
  @override
  List<Message> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ChatMessagesDto(success: $success, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessagesDtoImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, msg, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessagesDtoImplCopyWith<_$ChatMessagesDtoImpl> get copyWith =>
      __$$ChatMessagesDtoImplCopyWithImpl<_$ChatMessagesDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessagesDtoImplToJson(
      this,
    );
  }
}

abstract class _ChatMessagesDto implements ChatMessagesDto {
  const factory _ChatMessagesDto(
      {required final bool success,
      required final String msg,
      required final List<Message> data}) = _$ChatMessagesDtoImpl;

  factory _ChatMessagesDto.fromJson(Map<String, dynamic> json) =
      _$ChatMessagesDtoImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  List<Message> get data;
  @override
  @JsonKey(ignore: true)
  _$$ChatMessagesDtoImplCopyWith<_$ChatMessagesDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  int get tradeId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get senderNickname => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {int tradeId, String message, String senderNickname, DateTime createdAt});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tradeId = null,
    Object? message = null,
    Object? senderNickname = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      tradeId: null == tradeId
          ? _value.tradeId
          : tradeId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      senderNickname: null == senderNickname
          ? _value.senderNickname
          : senderNickname // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int tradeId, String message, String senderNickname, DateTime createdAt});
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tradeId = null,
    Object? message = null,
    Object? senderNickname = null,
    Object? createdAt = null,
  }) {
    return _then(_$MessageImpl(
      tradeId: null == tradeId
          ? _value.tradeId
          : tradeId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      senderNickname: null == senderNickname
          ? _value.senderNickname
          : senderNickname // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl implements _Message {
  const _$MessageImpl(
      {required this.tradeId,
      required this.message,
      required this.senderNickname,
      required this.createdAt});

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  final int tradeId;
  @override
  final String message;
  @override
  final String senderNickname;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Message(tradeId: $tradeId, message: $message, senderNickname: $senderNickname, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.tradeId, tradeId) || other.tradeId == tradeId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.senderNickname, senderNickname) ||
                other.senderNickname == senderNickname) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, tradeId, message, senderNickname, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {required final int tradeId,
      required final String message,
      required final String senderNickname,
      required final DateTime createdAt}) = _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  int get tradeId;
  @override
  String get message;
  @override
  String get senderNickname;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatMessageWriteRequest _$ChatMessageWriteRequestFromJson(
    Map<String, dynamic> json) {
  return _ChatMessageWriteRequest.fromJson(json);
}

/// @nodoc
mixin _$ChatMessageWriteRequest {
  String get message => throw _privateConstructorUsedError;
  int get tradeId => throw _privateConstructorUsedError;
  String get senderNickname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessageWriteRequestCopyWith<ChatMessageWriteRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageWriteRequestCopyWith<$Res> {
  factory $ChatMessageWriteRequestCopyWith(ChatMessageWriteRequest value,
          $Res Function(ChatMessageWriteRequest) then) =
      _$ChatMessageWriteRequestCopyWithImpl<$Res, ChatMessageWriteRequest>;
  @useResult
  $Res call({String message, int tradeId, String senderNickname});
}

/// @nodoc
class _$ChatMessageWriteRequestCopyWithImpl<$Res,
        $Val extends ChatMessageWriteRequest>
    implements $ChatMessageWriteRequestCopyWith<$Res> {
  _$ChatMessageWriteRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? tradeId = null,
    Object? senderNickname = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tradeId: null == tradeId
          ? _value.tradeId
          : tradeId // ignore: cast_nullable_to_non_nullable
              as int,
      senderNickname: null == senderNickname
          ? _value.senderNickname
          : senderNickname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessageWriteRequestImplCopyWith<$Res>
    implements $ChatMessageWriteRequestCopyWith<$Res> {
  factory _$$ChatMessageWriteRequestImplCopyWith(
          _$ChatMessageWriteRequestImpl value,
          $Res Function(_$ChatMessageWriteRequestImpl) then) =
      __$$ChatMessageWriteRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int tradeId, String senderNickname});
}

/// @nodoc
class __$$ChatMessageWriteRequestImplCopyWithImpl<$Res>
    extends _$ChatMessageWriteRequestCopyWithImpl<$Res,
        _$ChatMessageWriteRequestImpl>
    implements _$$ChatMessageWriteRequestImplCopyWith<$Res> {
  __$$ChatMessageWriteRequestImplCopyWithImpl(
      _$ChatMessageWriteRequestImpl _value,
      $Res Function(_$ChatMessageWriteRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? tradeId = null,
    Object? senderNickname = null,
  }) {
    return _then(_$ChatMessageWriteRequestImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tradeId: null == tradeId
          ? _value.tradeId
          : tradeId // ignore: cast_nullable_to_non_nullable
              as int,
      senderNickname: null == senderNickname
          ? _value.senderNickname
          : senderNickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageWriteRequestImpl implements _ChatMessageWriteRequest {
  const _$ChatMessageWriteRequestImpl(
      {required this.message,
      required this.tradeId,
      required this.senderNickname});

  factory _$ChatMessageWriteRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageWriteRequestImplFromJson(json);

  @override
  final String message;
  @override
  final int tradeId;
  @override
  final String senderNickname;

  @override
  String toString() {
    return 'ChatMessageWriteRequest(message: $message, tradeId: $tradeId, senderNickname: $senderNickname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageWriteRequestImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.tradeId, tradeId) || other.tradeId == tradeId) &&
            (identical(other.senderNickname, senderNickname) ||
                other.senderNickname == senderNickname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, tradeId, senderNickname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageWriteRequestImplCopyWith<_$ChatMessageWriteRequestImpl>
      get copyWith => __$$ChatMessageWriteRequestImplCopyWithImpl<
          _$ChatMessageWriteRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageWriteRequestImplToJson(
      this,
    );
  }
}

abstract class _ChatMessageWriteRequest implements ChatMessageWriteRequest {
  const factory _ChatMessageWriteRequest(
      {required final String message,
      required final int tradeId,
      required final String senderNickname}) = _$ChatMessageWriteRequestImpl;

  factory _ChatMessageWriteRequest.fromJson(Map<String, dynamic> json) =
      _$ChatMessageWriteRequestImpl.fromJson;

  @override
  String get message;
  @override
  int get tradeId;
  @override
  String get senderNickname;
  @override
  @JsonKey(ignore: true)
  _$$ChatMessageWriteRequestImplCopyWith<_$ChatMessageWriteRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
