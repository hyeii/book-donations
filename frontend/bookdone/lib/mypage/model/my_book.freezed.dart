// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyBookData _$MyBookDataFromJson(Map<String, dynamic> json) {
  return _MyBookData.fromJson(json);
}

/// @nodoc
mixin _$MyBookData {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  List<BookInfo> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyBookDataCopyWith<MyBookData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyBookDataCopyWith<$Res> {
  factory $MyBookDataCopyWith(
          MyBookData value, $Res Function(MyBookData) then) =
      _$MyBookDataCopyWithImpl<$Res, MyBookData>;
  @useResult
  $Res call({bool success, String msg, List<BookInfo> data});
}

/// @nodoc
class _$MyBookDataCopyWithImpl<$Res, $Val extends MyBookData>
    implements $MyBookDataCopyWith<$Res> {
  _$MyBookDataCopyWithImpl(this._value, this._then);

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
              as List<BookInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyBookDataImplCopyWith<$Res>
    implements $MyBookDataCopyWith<$Res> {
  factory _$$MyBookDataImplCopyWith(
          _$MyBookDataImpl value, $Res Function(_$MyBookDataImpl) then) =
      __$$MyBookDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, List<BookInfo> data});
}

/// @nodoc
class __$$MyBookDataImplCopyWithImpl<$Res>
    extends _$MyBookDataCopyWithImpl<$Res, _$MyBookDataImpl>
    implements _$$MyBookDataImplCopyWith<$Res> {
  __$$MyBookDataImplCopyWithImpl(
      _$MyBookDataImpl _value, $Res Function(_$MyBookDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_$MyBookDataImpl(
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
              as List<BookInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyBookDataImpl implements _MyBookData {
  const _$MyBookDataImpl(
      {required this.success,
      required this.msg,
      required final List<BookInfo> data})
      : _data = data;

  factory _$MyBookDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyBookDataImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  final List<BookInfo> _data;
  @override
  List<BookInfo> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'MyBookData(success: $success, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyBookDataImpl &&
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
  _$$MyBookDataImplCopyWith<_$MyBookDataImpl> get copyWith =>
      __$$MyBookDataImplCopyWithImpl<_$MyBookDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyBookDataImplToJson(
      this,
    );
  }
}

abstract class _MyBookData implements MyBookData {
  const factory _MyBookData(
      {required final bool success,
      required final String msg,
      required final List<BookInfo> data}) = _$MyBookDataImpl;

  factory _MyBookData.fromJson(Map<String, dynamic> json) =
      _$MyBookDataImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  List<BookInfo> get data;
  @override
  @JsonKey(ignore: true)
  _$$MyBookDataImplCopyWith<_$MyBookDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookInfo _$BookInfoFromJson(Map<String, dynamic> json) {
  return _BookInfo.fromJson(json);
}

/// @nodoc
mixin _$BookInfo {
  int get id => throw _privateConstructorUsedError;
  String get isbn => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get titleUrl => throw _privateConstructorUsedError;
  String get donationStatus => throw _privateConstructorUsedError;
  String get donatedAt => throw _privateConstructorUsedError;
  List<HistoryData> get historyResponseList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookInfoCopyWith<BookInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookInfoCopyWith<$Res> {
  factory $BookInfoCopyWith(BookInfo value, $Res Function(BookInfo) then) =
      _$BookInfoCopyWithImpl<$Res, BookInfo>;
  @useResult
  $Res call(
      {int id,
      String isbn,
      String title,
      String titleUrl,
      String donationStatus,
      String donatedAt,
      List<HistoryData> historyResponseList});
}

/// @nodoc
class _$BookInfoCopyWithImpl<$Res, $Val extends BookInfo>
    implements $BookInfoCopyWith<$Res> {
  _$BookInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isbn = null,
    Object? title = null,
    Object? titleUrl = null,
    Object? donationStatus = null,
    Object? donatedAt = null,
    Object? historyResponseList = null,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleUrl: null == titleUrl
          ? _value.titleUrl
          : titleUrl // ignore: cast_nullable_to_non_nullable
              as String,
      donationStatus: null == donationStatus
          ? _value.donationStatus
          : donationStatus // ignore: cast_nullable_to_non_nullable
              as String,
      donatedAt: null == donatedAt
          ? _value.donatedAt
          : donatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      historyResponseList: null == historyResponseList
          ? _value.historyResponseList
          : historyResponseList // ignore: cast_nullable_to_non_nullable
              as List<HistoryData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookInfoImplCopyWith<$Res>
    implements $BookInfoCopyWith<$Res> {
  factory _$$BookInfoImplCopyWith(
          _$BookInfoImpl value, $Res Function(_$BookInfoImpl) then) =
      __$$BookInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String isbn,
      String title,
      String titleUrl,
      String donationStatus,
      String donatedAt,
      List<HistoryData> historyResponseList});
}

/// @nodoc
class __$$BookInfoImplCopyWithImpl<$Res>
    extends _$BookInfoCopyWithImpl<$Res, _$BookInfoImpl>
    implements _$$BookInfoImplCopyWith<$Res> {
  __$$BookInfoImplCopyWithImpl(
      _$BookInfoImpl _value, $Res Function(_$BookInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isbn = null,
    Object? title = null,
    Object? titleUrl = null,
    Object? donationStatus = null,
    Object? donatedAt = null,
    Object? historyResponseList = null,
  }) {
    return _then(_$BookInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleUrl: null == titleUrl
          ? _value.titleUrl
          : titleUrl // ignore: cast_nullable_to_non_nullable
              as String,
      donationStatus: null == donationStatus
          ? _value.donationStatus
          : donationStatus // ignore: cast_nullable_to_non_nullable
              as String,
      donatedAt: null == donatedAt
          ? _value.donatedAt
          : donatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      historyResponseList: null == historyResponseList
          ? _value._historyResponseList
          : historyResponseList // ignore: cast_nullable_to_non_nullable
              as List<HistoryData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookInfoImpl implements _BookInfo {
  const _$BookInfoImpl(
      {required this.id,
      required this.isbn,
      required this.title,
      required this.titleUrl,
      required this.donationStatus,
      required this.donatedAt,
      required final List<HistoryData> historyResponseList})
      : _historyResponseList = historyResponseList;

  factory _$BookInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookInfoImplFromJson(json);

  @override
  final int id;
  @override
  final String isbn;
  @override
  final String title;
  @override
  final String titleUrl;
  @override
  final String donationStatus;
  @override
  final String donatedAt;
  final List<HistoryData> _historyResponseList;
  @override
  List<HistoryData> get historyResponseList {
    if (_historyResponseList is EqualUnmodifiableListView)
      return _historyResponseList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historyResponseList);
  }

  @override
  String toString() {
    return 'BookInfo(id: $id, isbn: $isbn, title: $title, titleUrl: $titleUrl, donationStatus: $donationStatus, donatedAt: $donatedAt, historyResponseList: $historyResponseList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isbn, isbn) || other.isbn == isbn) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleUrl, titleUrl) ||
                other.titleUrl == titleUrl) &&
            (identical(other.donationStatus, donationStatus) ||
                other.donationStatus == donationStatus) &&
            (identical(other.donatedAt, donatedAt) ||
                other.donatedAt == donatedAt) &&
            const DeepCollectionEquality()
                .equals(other._historyResponseList, _historyResponseList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isbn,
      title,
      titleUrl,
      donationStatus,
      donatedAt,
      const DeepCollectionEquality().hash(_historyResponseList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookInfoImplCopyWith<_$BookInfoImpl> get copyWith =>
      __$$BookInfoImplCopyWithImpl<_$BookInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookInfoImplToJson(
      this,
    );
  }
}

abstract class _BookInfo implements BookInfo {
  const factory _BookInfo(
      {required final int id,
      required final String isbn,
      required final String title,
      required final String titleUrl,
      required final String donationStatus,
      required final String donatedAt,
      required final List<HistoryData> historyResponseList}) = _$BookInfoImpl;

  factory _BookInfo.fromJson(Map<String, dynamic> json) =
      _$BookInfoImpl.fromJson;

  @override
  int get id;
  @override
  String get isbn;
  @override
  String get title;
  @override
  String get titleUrl;
  @override
  String get donationStatus;
  @override
  String get donatedAt;
  @override
  List<HistoryData> get historyResponseList;
  @override
  @JsonKey(ignore: true)
  _$$BookInfoImplCopyWith<_$BookInfoImpl> get copyWith =>
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

UnwrittenHistory _$UnwrittenHistoryFromJson(Map<String, dynamic> json) {
  return _UnwrittenHistory.fromJson(json);
}

/// @nodoc
mixin _$UnwrittenHistory {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  List<UnwrittenResponse> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnwrittenHistoryCopyWith<UnwrittenHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnwrittenHistoryCopyWith<$Res> {
  factory $UnwrittenHistoryCopyWith(
          UnwrittenHistory value, $Res Function(UnwrittenHistory) then) =
      _$UnwrittenHistoryCopyWithImpl<$Res, UnwrittenHistory>;
  @useResult
  $Res call({bool success, String msg, List<UnwrittenResponse> data});
}

/// @nodoc
class _$UnwrittenHistoryCopyWithImpl<$Res, $Val extends UnwrittenHistory>
    implements $UnwrittenHistoryCopyWith<$Res> {
  _$UnwrittenHistoryCopyWithImpl(this._value, this._then);

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
              as List<UnwrittenResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnwrittenHistoryImplCopyWith<$Res>
    implements $UnwrittenHistoryCopyWith<$Res> {
  factory _$$UnwrittenHistoryImplCopyWith(_$UnwrittenHistoryImpl value,
          $Res Function(_$UnwrittenHistoryImpl) then) =
      __$$UnwrittenHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, List<UnwrittenResponse> data});
}

/// @nodoc
class __$$UnwrittenHistoryImplCopyWithImpl<$Res>
    extends _$UnwrittenHistoryCopyWithImpl<$Res, _$UnwrittenHistoryImpl>
    implements _$$UnwrittenHistoryImplCopyWith<$Res> {
  __$$UnwrittenHistoryImplCopyWithImpl(_$UnwrittenHistoryImpl _value,
      $Res Function(_$UnwrittenHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_$UnwrittenHistoryImpl(
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
              as List<UnwrittenResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnwrittenHistoryImpl implements _UnwrittenHistory {
  const _$UnwrittenHistoryImpl(
      {required this.success,
      required this.msg,
      required final List<UnwrittenResponse> data})
      : _data = data;

  factory _$UnwrittenHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnwrittenHistoryImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  final List<UnwrittenResponse> _data;
  @override
  List<UnwrittenResponse> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'UnwrittenHistory(success: $success, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnwrittenHistoryImpl &&
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
  _$$UnwrittenHistoryImplCopyWith<_$UnwrittenHistoryImpl> get copyWith =>
      __$$UnwrittenHistoryImplCopyWithImpl<_$UnwrittenHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnwrittenHistoryImplToJson(
      this,
    );
  }
}

abstract class _UnwrittenHistory implements UnwrittenHistory {
  const factory _UnwrittenHistory(
      {required final bool success,
      required final String msg,
      required final List<UnwrittenResponse> data}) = _$UnwrittenHistoryImpl;

  factory _UnwrittenHistory.fromJson(Map<String, dynamic> json) =
      _$UnwrittenHistoryImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  List<UnwrittenResponse> get data;
  @override
  @JsonKey(ignore: true)
  _$$UnwrittenHistoryImplCopyWith<_$UnwrittenHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UnwrittenResponse _$UnwrittenResponseFromJson(Map<String, dynamic> json) {
  return _UnwrittenResponse.fromJson(json);
}

/// @nodoc
mixin _$UnwrittenResponse {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get titleUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnwrittenResponseCopyWith<UnwrittenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnwrittenResponseCopyWith<$Res> {
  factory $UnwrittenResponseCopyWith(
          UnwrittenResponse value, $Res Function(UnwrittenResponse) then) =
      _$UnwrittenResponseCopyWithImpl<$Res, UnwrittenResponse>;
  @useResult
  $Res call({int id, String title, String titleUrl});
}

/// @nodoc
class _$UnwrittenResponseCopyWithImpl<$Res, $Val extends UnwrittenResponse>
    implements $UnwrittenResponseCopyWith<$Res> {
  _$UnwrittenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? titleUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleUrl: null == titleUrl
          ? _value.titleUrl
          : titleUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnwrittenResponseImplCopyWith<$Res>
    implements $UnwrittenResponseCopyWith<$Res> {
  factory _$$UnwrittenResponseImplCopyWith(_$UnwrittenResponseImpl value,
          $Res Function(_$UnwrittenResponseImpl) then) =
      __$$UnwrittenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String titleUrl});
}

/// @nodoc
class __$$UnwrittenResponseImplCopyWithImpl<$Res>
    extends _$UnwrittenResponseCopyWithImpl<$Res, _$UnwrittenResponseImpl>
    implements _$$UnwrittenResponseImplCopyWith<$Res> {
  __$$UnwrittenResponseImplCopyWithImpl(_$UnwrittenResponseImpl _value,
      $Res Function(_$UnwrittenResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? titleUrl = null,
  }) {
    return _then(_$UnwrittenResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleUrl: null == titleUrl
          ? _value.titleUrl
          : titleUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnwrittenResponseImpl implements _UnwrittenResponse {
  const _$UnwrittenResponseImpl(
      {required this.id, required this.title, required this.titleUrl});

  factory _$UnwrittenResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnwrittenResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String titleUrl;

  @override
  String toString() {
    return 'UnwrittenResponse(id: $id, title: $title, titleUrl: $titleUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnwrittenResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleUrl, titleUrl) ||
                other.titleUrl == titleUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, titleUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnwrittenResponseImplCopyWith<_$UnwrittenResponseImpl> get copyWith =>
      __$$UnwrittenResponseImplCopyWithImpl<_$UnwrittenResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnwrittenResponseImplToJson(
      this,
    );
  }
}

abstract class _UnwrittenResponse implements UnwrittenResponse {
  const factory _UnwrittenResponse(
      {required final int id,
      required final String title,
      required final String titleUrl}) = _$UnwrittenResponseImpl;

  factory _UnwrittenResponse.fromJson(Map<String, dynamic> json) =
      _$UnwrittenResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get titleUrl;
  @override
  @JsonKey(ignore: true)
  _$$UnwrittenResponseImplCopyWith<_$UnwrittenResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
