// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArticleRespByid _$ArticleRespByidFromJson(Map<String, dynamic> json) {
  return _ArticleRespByid.fromJson(json);
}

/// @nodoc
mixin _$ArticleRespByid {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  ArticleData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleRespByidCopyWith<ArticleRespByid> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleRespByidCopyWith<$Res> {
  factory $ArticleRespByidCopyWith(
          ArticleRespByid value, $Res Function(ArticleRespByid) then) =
      _$ArticleRespByidCopyWithImpl<$Res, ArticleRespByid>;
  @useResult
  $Res call({bool success, String msg, ArticleData data});

  $ArticleDataCopyWith<$Res> get data;
}

/// @nodoc
class _$ArticleRespByidCopyWithImpl<$Res, $Val extends ArticleRespByid>
    implements $ArticleRespByidCopyWith<$Res> {
  _$ArticleRespByidCopyWithImpl(this._value, this._then);

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
              as ArticleData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArticleDataCopyWith<$Res> get data {
    return $ArticleDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArticleRespByidImplCopyWith<$Res>
    implements $ArticleRespByidCopyWith<$Res> {
  factory _$$ArticleRespByidImplCopyWith(_$ArticleRespByidImpl value,
          $Res Function(_$ArticleRespByidImpl) then) =
      __$$ArticleRespByidImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, ArticleData data});

  @override
  $ArticleDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ArticleRespByidImplCopyWithImpl<$Res>
    extends _$ArticleRespByidCopyWithImpl<$Res, _$ArticleRespByidImpl>
    implements _$$ArticleRespByidImplCopyWith<$Res> {
  __$$ArticleRespByidImplCopyWithImpl(
      _$ArticleRespByidImpl _value, $Res Function(_$ArticleRespByidImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_$ArticleRespByidImpl(
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
              as ArticleData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleRespByidImpl implements _ArticleRespByid {
  const _$ArticleRespByidImpl(
      {required this.success, required this.msg, required this.data});

  factory _$ArticleRespByidImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleRespByidImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  @override
  final ArticleData data;

  @override
  String toString() {
    return 'ArticleRespByid(success: $success, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleRespByidImpl &&
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
  _$$ArticleRespByidImplCopyWith<_$ArticleRespByidImpl> get copyWith =>
      __$$ArticleRespByidImplCopyWithImpl<_$ArticleRespByidImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleRespByidImplToJson(
      this,
    );
  }
}

abstract class _ArticleRespByid implements ArticleRespByid {
  const factory _ArticleRespByid(
      {required final bool success,
      required final String msg,
      required final ArticleData data}) = _$ArticleRespByidImpl;

  factory _ArticleRespByid.fromJson(Map<String, dynamic> json) =
      _$ArticleRespByidImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  ArticleData get data;
  @override
  @JsonKey(ignore: true)
  _$$ArticleRespByidImplCopyWith<_$ArticleRespByidImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArticleData _$ArticleDataFromJson(Map<String, dynamic> json) {
  return _ArticleData.fromJson(json);
}

/// @nodoc
mixin _$ArticleData {
  int get id => throw _privateConstructorUsedError;
  int get isbn => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  bool get canDelivery => throw _privateConstructorUsedError;
  List<HistoryResponse>? get historyResponse =>
      throw _privateConstructorUsedError;
  List<String>? get imageUrlList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleDataCopyWith<ArticleData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleDataCopyWith<$Res> {
  factory $ArticleDataCopyWith(
          ArticleData value, $Res Function(ArticleData) then) =
      _$ArticleDataCopyWithImpl<$Res, ArticleData>;
  @useResult
  $Res call(
      {int id,
      int isbn,
      String nickname,
      String address,
      String content,
      bool canDelivery,
      List<HistoryResponse>? historyResponse,
      List<String>? imageUrlList});
}

/// @nodoc
class _$ArticleDataCopyWithImpl<$Res, $Val extends ArticleData>
    implements $ArticleDataCopyWith<$Res> {
  _$ArticleDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isbn = null,
    Object? nickname = null,
    Object? address = null,
    Object? content = null,
    Object? canDelivery = null,
    Object? historyResponse = freezed,
    Object? imageUrlList = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      canDelivery: null == canDelivery
          ? _value.canDelivery
          : canDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      historyResponse: freezed == historyResponse
          ? _value.historyResponse
          : historyResponse // ignore: cast_nullable_to_non_nullable
              as List<HistoryResponse>?,
      imageUrlList: freezed == imageUrlList
          ? _value.imageUrlList
          : imageUrlList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticleDataImplCopyWith<$Res>
    implements $ArticleDataCopyWith<$Res> {
  factory _$$ArticleDataImplCopyWith(
          _$ArticleDataImpl value, $Res Function(_$ArticleDataImpl) then) =
      __$$ArticleDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int isbn,
      String nickname,
      String address,
      String content,
      bool canDelivery,
      List<HistoryResponse>? historyResponse,
      List<String>? imageUrlList});
}

/// @nodoc
class __$$ArticleDataImplCopyWithImpl<$Res>
    extends _$ArticleDataCopyWithImpl<$Res, _$ArticleDataImpl>
    implements _$$ArticleDataImplCopyWith<$Res> {
  __$$ArticleDataImplCopyWithImpl(
      _$ArticleDataImpl _value, $Res Function(_$ArticleDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isbn = null,
    Object? nickname = null,
    Object? address = null,
    Object? content = null,
    Object? canDelivery = null,
    Object? historyResponse = freezed,
    Object? imageUrlList = freezed,
  }) {
    return _then(_$ArticleDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      canDelivery: null == canDelivery
          ? _value.canDelivery
          : canDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      historyResponse: freezed == historyResponse
          ? _value._historyResponse
          : historyResponse // ignore: cast_nullable_to_non_nullable
              as List<HistoryResponse>?,
      imageUrlList: freezed == imageUrlList
          ? _value._imageUrlList
          : imageUrlList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleDataImpl implements _ArticleData {
  const _$ArticleDataImpl(
      {required this.id,
      required this.isbn,
      required this.nickname,
      required this.address,
      required this.content,
      required this.canDelivery,
      final List<HistoryResponse>? historyResponse,
      final List<String>? imageUrlList})
      : _historyResponse = historyResponse,
        _imageUrlList = imageUrlList;

  factory _$ArticleDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleDataImplFromJson(json);

  @override
  final int id;
  @override
  final int isbn;
  @override
  final String nickname;
  @override
  final String address;
  @override
  final String content;
  @override
  final bool canDelivery;
  final List<HistoryResponse>? _historyResponse;
  @override
  List<HistoryResponse>? get historyResponse {
    final value = _historyResponse;
    if (value == null) return null;
    if (_historyResponse is EqualUnmodifiableListView) return _historyResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _imageUrlList;
  @override
  List<String>? get imageUrlList {
    final value = _imageUrlList;
    if (value == null) return null;
    if (_imageUrlList is EqualUnmodifiableListView) return _imageUrlList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ArticleData(id: $id, isbn: $isbn, nickname: $nickname, address: $address, content: $content, canDelivery: $canDelivery, historyResponse: $historyResponse, imageUrlList: $imageUrlList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isbn, isbn) || other.isbn == isbn) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.canDelivery, canDelivery) ||
                other.canDelivery == canDelivery) &&
            const DeepCollectionEquality()
                .equals(other._historyResponse, _historyResponse) &&
            const DeepCollectionEquality()
                .equals(other._imageUrlList, _imageUrlList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isbn,
      nickname,
      address,
      content,
      canDelivery,
      const DeepCollectionEquality().hash(_historyResponse),
      const DeepCollectionEquality().hash(_imageUrlList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleDataImplCopyWith<_$ArticleDataImpl> get copyWith =>
      __$$ArticleDataImplCopyWithImpl<_$ArticleDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleDataImplToJson(
      this,
    );
  }
}

abstract class _ArticleData implements ArticleData {
  const factory _ArticleData(
      {required final int id,
      required final int isbn,
      required final String nickname,
      required final String address,
      required final String content,
      required final bool canDelivery,
      final List<HistoryResponse>? historyResponse,
      final List<String>? imageUrlList}) = _$ArticleDataImpl;

  factory _ArticleData.fromJson(Map<String, dynamic> json) =
      _$ArticleDataImpl.fromJson;

  @override
  int get id;
  @override
  int get isbn;
  @override
  String get nickname;
  @override
  String get address;
  @override
  String get content;
  @override
  bool get canDelivery;
  @override
  List<HistoryResponse>? get historyResponse;
  @override
  List<String>? get imageUrlList;
  @override
  @JsonKey(ignore: true)
  _$$ArticleDataImplCopyWith<_$ArticleDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HistoryResponse _$HistoryResponseFromJson(Map<String, dynamic> json) {
  return _HistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$HistoryResponse {
  String get content => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryResponseCopyWith<HistoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryResponseCopyWith<$Res> {
  factory $HistoryResponseCopyWith(
          HistoryResponse value, $Res Function(HistoryResponse) then) =
      _$HistoryResponseCopyWithImpl<$Res, HistoryResponse>;
  @useResult
  $Res call({String content, String nickname, String createdAt});
}

/// @nodoc
class _$HistoryResponseCopyWithImpl<$Res, $Val extends HistoryResponse>
    implements $HistoryResponseCopyWith<$Res> {
  _$HistoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? nickname = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryResponseImplCopyWith<$Res>
    implements $HistoryResponseCopyWith<$Res> {
  factory _$$HistoryResponseImplCopyWith(_$HistoryResponseImpl value,
          $Res Function(_$HistoryResponseImpl) then) =
      __$$HistoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, String nickname, String createdAt});
}

/// @nodoc
class __$$HistoryResponseImplCopyWithImpl<$Res>
    extends _$HistoryResponseCopyWithImpl<$Res, _$HistoryResponseImpl>
    implements _$$HistoryResponseImplCopyWith<$Res> {
  __$$HistoryResponseImplCopyWithImpl(
      _$HistoryResponseImpl _value, $Res Function(_$HistoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? nickname = null,
    Object? createdAt = null,
  }) {
    return _then(_$HistoryResponseImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryResponseImpl implements _HistoryResponse {
  const _$HistoryResponseImpl(
      {required this.content, required this.nickname, required this.createdAt});

  factory _$HistoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryResponseImplFromJson(json);

  @override
  final String content;
  @override
  final String nickname;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'HistoryResponse(content: $content, nickname: $nickname, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryResponseImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content, nickname, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryResponseImplCopyWith<_$HistoryResponseImpl> get copyWith =>
      __$$HistoryResponseImplCopyWithImpl<_$HistoryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryResponseImplToJson(
      this,
    );
  }
}

abstract class _HistoryResponse implements HistoryResponse {
  const factory _HistoryResponse(
      {required final String content,
      required final String nickname,
      required final String createdAt}) = _$HistoryResponseImpl;

  factory _HistoryResponse.fromJson(Map<String, dynamic> json) =
      _$HistoryResponseImpl.fromJson;

  @override
  String get content;
  @override
  String get nickname;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$HistoryResponseImplCopyWith<_$HistoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
