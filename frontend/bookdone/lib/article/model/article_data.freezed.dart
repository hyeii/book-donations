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
  String get isbn => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  bool get canDelivery => throw _privateConstructorUsedError;
  List<HistoryData> get historyResponseList =>
      throw _privateConstructorUsedError;
  List<String> get imageUrlList => throw _privateConstructorUsedError;

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
      String isbn,
      String nickname,
      String address,
      String content,
      bool canDelivery,
      List<HistoryData> historyResponseList,
      List<String> imageUrlList});
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
    Object? historyResponseList = null,
    Object? imageUrlList = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
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
      historyResponseList: null == historyResponseList
          ? _value.historyResponseList
          : historyResponseList // ignore: cast_nullable_to_non_nullable
              as List<HistoryData>,
      imageUrlList: null == imageUrlList
          ? _value.imageUrlList
          : imageUrlList // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      String isbn,
      String nickname,
      String address,
      String content,
      bool canDelivery,
      List<HistoryData> historyResponseList,
      List<String> imageUrlList});
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
    Object? historyResponseList = null,
    Object? imageUrlList = null,
  }) {
    return _then(_$ArticleDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
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
      historyResponseList: null == historyResponseList
          ? _value._historyResponseList
          : historyResponseList // ignore: cast_nullable_to_non_nullable
              as List<HistoryData>,
      imageUrlList: null == imageUrlList
          ? _value._imageUrlList
          : imageUrlList // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      required final List<HistoryData> historyResponseList,
      required final List<String> imageUrlList})
      : _historyResponseList = historyResponseList,
        _imageUrlList = imageUrlList;

  factory _$ArticleDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleDataImplFromJson(json);

  @override
  final int id;
  @override
  final String isbn;
  @override
  final String nickname;
  @override
  final String address;
  @override
  final String content;
  @override
  final bool canDelivery;
  final List<HistoryData> _historyResponseList;
  @override
  List<HistoryData> get historyResponseList {
    if (_historyResponseList is EqualUnmodifiableListView)
      return _historyResponseList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historyResponseList);
  }

  final List<String> _imageUrlList;
  @override
  List<String> get imageUrlList {
    if (_imageUrlList is EqualUnmodifiableListView) return _imageUrlList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrlList);
  }

  @override
  String toString() {
    return 'ArticleData(id: $id, isbn: $isbn, nickname: $nickname, address: $address, content: $content, canDelivery: $canDelivery, historyResponseList: $historyResponseList, imageUrlList: $imageUrlList)';
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
                .equals(other._historyResponseList, _historyResponseList) &&
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
      const DeepCollectionEquality().hash(_historyResponseList),
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
      required final String isbn,
      required final String nickname,
      required final String address,
      required final String content,
      required final bool canDelivery,
      required final List<HistoryData> historyResponseList,
      required final List<String> imageUrlList}) = _$ArticleDataImpl;

  factory _ArticleData.fromJson(Map<String, dynamic> json) =
      _$ArticleDataImpl.fromJson;

  @override
  int get id;
  @override
  String get isbn;
  @override
  String get nickname;
  @override
  String get address;
  @override
  String get content;
  @override
  bool get canDelivery;
  @override
  List<HistoryData> get historyResponseList;
  @override
  List<String> get imageUrlList;
  @override
  @JsonKey(ignore: true)
  _$$ArticleDataImplCopyWith<_$ArticleDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HistoryData _$HistoryDataFromJson(Map<String, dynamic> json) {
  return _HistoryData.fromJson(json);
}

/// @nodoc
mixin _$HistoryData {
  String get title => throw _privateConstructorUsedError;
  String get titleUrl => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryDataCopyWith<HistoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryDataCopyWith<$Res> {
  factory $HistoryDataCopyWith(
          HistoryData value, $Res Function(HistoryData) then) =
      _$HistoryDataCopyWithImpl<$Res, HistoryData>;
  @useResult
  $Res call(
      {String title,
      String titleUrl,
      String? content,
      String nickname,
      String createdAt});
}

/// @nodoc
class _$HistoryDataCopyWithImpl<$Res, $Val extends HistoryData>
    implements $HistoryDataCopyWith<$Res> {
  _$HistoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? titleUrl = null,
    Object? content = freezed,
    Object? nickname = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleUrl: null == titleUrl
          ? _value.titleUrl
          : titleUrl // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$HistoryDataImplCopyWith<$Res>
    implements $HistoryDataCopyWith<$Res> {
  factory _$$HistoryDataImplCopyWith(
          _$HistoryDataImpl value, $Res Function(_$HistoryDataImpl) then) =
      __$$HistoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String titleUrl,
      String? content,
      String nickname,
      String createdAt});
}

/// @nodoc
class __$$HistoryDataImplCopyWithImpl<$Res>
    extends _$HistoryDataCopyWithImpl<$Res, _$HistoryDataImpl>
    implements _$$HistoryDataImplCopyWith<$Res> {
  __$$HistoryDataImplCopyWithImpl(
      _$HistoryDataImpl _value, $Res Function(_$HistoryDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? titleUrl = null,
    Object? content = freezed,
    Object? nickname = null,
    Object? createdAt = null,
  }) {
    return _then(_$HistoryDataImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleUrl: null == titleUrl
          ? _value.titleUrl
          : titleUrl // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$HistoryDataImpl implements _HistoryData {
  const _$HistoryDataImpl(
      {required this.title,
      required this.titleUrl,
      this.content,
      required this.nickname,
      required this.createdAt});

  factory _$HistoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryDataImplFromJson(json);

  @override
  final String title;
  @override
  final String titleUrl;
  @override
  final String? content;
  @override
  final String nickname;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'HistoryData(title: $title, titleUrl: $titleUrl, content: $content, nickname: $nickname, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleUrl, titleUrl) ||
                other.titleUrl == titleUrl) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, titleUrl, content, nickname, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryDataImplCopyWith<_$HistoryDataImpl> get copyWith =>
      __$$HistoryDataImplCopyWithImpl<_$HistoryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryDataImplToJson(
      this,
    );
  }
}

abstract class _HistoryData implements HistoryData {
  const factory _HistoryData(
      {required final String title,
      required final String titleUrl,
      final String? content,
      required final String nickname,
      required final String createdAt}) = _$HistoryDataImpl;

  factory _HistoryData.fromJson(Map<String, dynamic> json) =
      _$HistoryDataImpl.fromJson;

  @override
  String get title;
  @override
  String get titleUrl;
  @override
  String? get content;
  @override
  String get nickname;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$HistoryDataImplCopyWith<_$HistoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HistoryResp _$HistoryRespFromJson(Map<String, dynamic> json) {
  return _HistoryResp.fromJson(json);
}

/// @nodoc
mixin _$HistoryResp {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  List<HistoryData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryRespCopyWith<HistoryResp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryRespCopyWith<$Res> {
  factory $HistoryRespCopyWith(
          HistoryResp value, $Res Function(HistoryResp) then) =
      _$HistoryRespCopyWithImpl<$Res, HistoryResp>;
  @useResult
  $Res call({bool success, String msg, List<HistoryData> data});
}

/// @nodoc
class _$HistoryRespCopyWithImpl<$Res, $Val extends HistoryResp>
    implements $HistoryRespCopyWith<$Res> {
  _$HistoryRespCopyWithImpl(this._value, this._then);

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
              as List<HistoryData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryRespImplCopyWith<$Res>
    implements $HistoryRespCopyWith<$Res> {
  factory _$$HistoryRespImplCopyWith(
          _$HistoryRespImpl value, $Res Function(_$HistoryRespImpl) then) =
      __$$HistoryRespImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, List<HistoryData> data});
}

/// @nodoc
class __$$HistoryRespImplCopyWithImpl<$Res>
    extends _$HistoryRespCopyWithImpl<$Res, _$HistoryRespImpl>
    implements _$$HistoryRespImplCopyWith<$Res> {
  __$$HistoryRespImplCopyWithImpl(
      _$HistoryRespImpl _value, $Res Function(_$HistoryRespImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_$HistoryRespImpl(
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
              as List<HistoryData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryRespImpl implements _HistoryResp {
  const _$HistoryRespImpl(
      {required this.success,
      required this.msg,
      required final List<HistoryData> data})
      : _data = data;

  factory _$HistoryRespImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryRespImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  final List<HistoryData> _data;
  @override
  List<HistoryData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'HistoryResp(success: $success, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryRespImpl &&
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
  _$$HistoryRespImplCopyWith<_$HistoryRespImpl> get copyWith =>
      __$$HistoryRespImplCopyWithImpl<_$HistoryRespImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryRespImplToJson(
      this,
    );
  }
}

abstract class _HistoryResp implements HistoryResp {
  const factory _HistoryResp(
      {required final bool success,
      required final String msg,
      required final List<HistoryData> data}) = _$HistoryRespImpl;

  factory _HistoryResp.fromJson(Map<String, dynamic> json) =
      _$HistoryRespImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  List<HistoryData> get data;
  @override
  @JsonKey(ignore: true)
  _$$HistoryRespImplCopyWith<_$HistoryRespImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RankResp _$RankRespFromJson(Map<String, dynamic> json) {
  return _RankResp.fromJson(json);
}

/// @nodoc
mixin _$RankResp {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  List<RankData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RankRespCopyWith<RankResp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankRespCopyWith<$Res> {
  factory $RankRespCopyWith(RankResp value, $Res Function(RankResp) then) =
      _$RankRespCopyWithImpl<$Res, RankResp>;
  @useResult
  $Res call({bool success, String msg, List<RankData> data});
}

/// @nodoc
class _$RankRespCopyWithImpl<$Res, $Val extends RankResp>
    implements $RankRespCopyWith<$Res> {
  _$RankRespCopyWithImpl(this._value, this._then);

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
              as List<RankData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RankRespImplCopyWith<$Res>
    implements $RankRespCopyWith<$Res> {
  factory _$$RankRespImplCopyWith(
          _$RankRespImpl value, $Res Function(_$RankRespImpl) then) =
      __$$RankRespImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, List<RankData> data});
}

/// @nodoc
class __$$RankRespImplCopyWithImpl<$Res>
    extends _$RankRespCopyWithImpl<$Res, _$RankRespImpl>
    implements _$$RankRespImplCopyWith<$Res> {
  __$$RankRespImplCopyWithImpl(
      _$RankRespImpl _value, $Res Function(_$RankRespImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_$RankRespImpl(
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
              as List<RankData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RankRespImpl implements _RankResp {
  const _$RankRespImpl(
      {required this.success,
      required this.msg,
      required final List<RankData> data})
      : _data = data;

  factory _$RankRespImpl.fromJson(Map<String, dynamic> json) =>
      _$$RankRespImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  final List<RankData> _data;
  @override
  List<RankData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'RankResp(success: $success, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankRespImpl &&
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
  _$$RankRespImplCopyWith<_$RankRespImpl> get copyWith =>
      __$$RankRespImplCopyWithImpl<_$RankRespImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RankRespImplToJson(
      this,
    );
  }
}

abstract class _RankResp implements RankResp {
  const factory _RankResp(
      {required final bool success,
      required final String msg,
      required final List<RankData> data}) = _$RankRespImpl;

  factory _RankResp.fromJson(Map<String, dynamic> json) =
      _$RankRespImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  List<RankData> get data;
  @override
  @JsonKey(ignore: true)
  _$$RankRespImplCopyWith<_$RankRespImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RankData _$RankDataFromJson(Map<String, dynamic> json) {
  return _RankData.fromJson(json);
}

/// @nodoc
mixin _$RankData {
  String get nickname => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RankDataCopyWith<RankData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankDataCopyWith<$Res> {
  factory $RankDataCopyWith(RankData value, $Res Function(RankData) then) =
      _$RankDataCopyWithImpl<$Res, RankData>;
  @useResult
  $Res call({String nickname, double score});
}

/// @nodoc
class _$RankDataCopyWithImpl<$Res, $Val extends RankData>
    implements $RankDataCopyWith<$Res> {
  _$RankDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RankDataImplCopyWith<$Res>
    implements $RankDataCopyWith<$Res> {
  factory _$$RankDataImplCopyWith(
          _$RankDataImpl value, $Res Function(_$RankDataImpl) then) =
      __$$RankDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nickname, double score});
}

/// @nodoc
class __$$RankDataImplCopyWithImpl<$Res>
    extends _$RankDataCopyWithImpl<$Res, _$RankDataImpl>
    implements _$$RankDataImplCopyWith<$Res> {
  __$$RankDataImplCopyWithImpl(
      _$RankDataImpl _value, $Res Function(_$RankDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? score = null,
  }) {
    return _then(_$RankDataImpl(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RankDataImpl implements _RankData {
  const _$RankDataImpl({required this.nickname, required this.score});

  factory _$RankDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RankDataImplFromJson(json);

  @override
  final String nickname;
  @override
  final double score;

  @override
  String toString() {
    return 'RankData(nickname: $nickname, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankDataImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nickname, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RankDataImplCopyWith<_$RankDataImpl> get copyWith =>
      __$$RankDataImplCopyWithImpl<_$RankDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RankDataImplToJson(
      this,
    );
  }
}

abstract class _RankData implements RankData {
  const factory _RankData(
      {required final String nickname,
      required final double score}) = _$RankDataImpl;

  factory _RankData.fromJson(Map<String, dynamic> json) =
      _$RankDataImpl.fromJson;

  @override
  String get nickname;
  @override
  double get score;
  @override
  @JsonKey(ignore: true)
  _$$RankDataImplCopyWith<_$RankDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TradeResponseDto _$TradeResponseDtoFromJson(Map<String, dynamic> json) {
  return _TradeResponseDto.fromJson(json);
}

/// @nodoc
mixin _$TradeResponseDto {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  int get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TradeResponseDtoCopyWith<TradeResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TradeResponseDtoCopyWith<$Res> {
  factory $TradeResponseDtoCopyWith(
          TradeResponseDto value, $Res Function(TradeResponseDto) then) =
      _$TradeResponseDtoCopyWithImpl<$Res, TradeResponseDto>;
  @useResult
  $Res call({bool success, String msg, int data});
}

/// @nodoc
class _$TradeResponseDtoCopyWithImpl<$Res, $Val extends TradeResponseDto>
    implements $TradeResponseDtoCopyWith<$Res> {
  _$TradeResponseDtoCopyWithImpl(this._value, this._then);

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
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TradeResponseDtoImplCopyWith<$Res>
    implements $TradeResponseDtoCopyWith<$Res> {
  factory _$$TradeResponseDtoImplCopyWith(_$TradeResponseDtoImpl value,
          $Res Function(_$TradeResponseDtoImpl) then) =
      __$$TradeResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, int data});
}

/// @nodoc
class __$$TradeResponseDtoImplCopyWithImpl<$Res>
    extends _$TradeResponseDtoCopyWithImpl<$Res, _$TradeResponseDtoImpl>
    implements _$$TradeResponseDtoImplCopyWith<$Res> {
  __$$TradeResponseDtoImplCopyWithImpl(_$TradeResponseDtoImpl _value,
      $Res Function(_$TradeResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_$TradeResponseDtoImpl(
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
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TradeResponseDtoImpl implements _TradeResponseDto {
  const _$TradeResponseDtoImpl(
      {required this.success, required this.msg, required this.data});

  factory _$TradeResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TradeResponseDtoImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  @override
  final int data;

  @override
  String toString() {
    return 'TradeResponseDto(success: $success, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TradeResponseDtoImpl &&
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
  _$$TradeResponseDtoImplCopyWith<_$TradeResponseDtoImpl> get copyWith =>
      __$$TradeResponseDtoImplCopyWithImpl<_$TradeResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TradeResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _TradeResponseDto implements TradeResponseDto {
  const factory _TradeResponseDto(
      {required final bool success,
      required final String msg,
      required final int data}) = _$TradeResponseDtoImpl;

  factory _TradeResponseDto.fromJson(Map<String, dynamic> json) =
      _$TradeResponseDtoImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  int get data;
  @override
  @JsonKey(ignore: true)
  _$$TradeResponseDtoImplCopyWith<_$TradeResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TradeResponse _$TradeResponseFromJson(Map<String, dynamic> json) {
  return _TradeResponse.fromJson(json);
}

/// @nodoc
mixin _$TradeResponse {
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TradeResponseCopyWith<TradeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TradeResponseCopyWith<$Res> {
  factory $TradeResponseCopyWith(
          TradeResponse value, $Res Function(TradeResponse) then) =
      _$TradeResponseCopyWithImpl<$Res, TradeResponse>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$TradeResponseCopyWithImpl<$Res, $Val extends TradeResponse>
    implements $TradeResponseCopyWith<$Res> {
  _$TradeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TradeResponseImplCopyWith<$Res>
    implements $TradeResponseCopyWith<$Res> {
  factory _$$TradeResponseImplCopyWith(
          _$TradeResponseImpl value, $Res Function(_$TradeResponseImpl) then) =
      __$$TradeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$TradeResponseImplCopyWithImpl<$Res>
    extends _$TradeResponseCopyWithImpl<$Res, _$TradeResponseImpl>
    implements _$$TradeResponseImplCopyWith<$Res> {
  __$$TradeResponseImplCopyWithImpl(
      _$TradeResponseImpl _value, $Res Function(_$TradeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$TradeResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TradeResponseImpl implements _TradeResponse {
  const _$TradeResponseImpl({required this.id});

  factory _$TradeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TradeResponseImplFromJson(json);

  @override
  final int id;

  @override
  String toString() {
    return 'TradeResponse(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TradeResponseImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TradeResponseImplCopyWith<_$TradeResponseImpl> get copyWith =>
      __$$TradeResponseImplCopyWithImpl<_$TradeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TradeResponseImplToJson(
      this,
    );
  }
}

abstract class _TradeResponse implements TradeResponse {
  const factory _TradeResponse({required final int id}) = _$TradeResponseImpl;

  factory _TradeResponse.fromJson(Map<String, dynamic> json) =
      _$TradeResponseImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$TradeResponseImplCopyWith<_$TradeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
