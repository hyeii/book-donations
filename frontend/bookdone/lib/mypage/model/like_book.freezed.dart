// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyLikeBook _$MyLikeBookFromJson(Map<String, dynamic> json) {
  return _MyLikeBook.fromJson(json);
}

/// @nodoc
mixin _$MyLikeBook {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  List<LikeInfo> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyLikeBookCopyWith<MyLikeBook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyLikeBookCopyWith<$Res> {
  factory $MyLikeBookCopyWith(
          MyLikeBook value, $Res Function(MyLikeBook) then) =
      _$MyLikeBookCopyWithImpl<$Res, MyLikeBook>;
  @useResult
  $Res call({bool success, String msg, List<LikeInfo> data});
}

/// @nodoc
class _$MyLikeBookCopyWithImpl<$Res, $Val extends MyLikeBook>
    implements $MyLikeBookCopyWith<$Res> {
  _$MyLikeBookCopyWithImpl(this._value, this._then);

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
              as List<LikeInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyLikeBookImplCopyWith<$Res>
    implements $MyLikeBookCopyWith<$Res> {
  factory _$$MyLikeBookImplCopyWith(
          _$MyLikeBookImpl value, $Res Function(_$MyLikeBookImpl) then) =
      __$$MyLikeBookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, List<LikeInfo> data});
}

/// @nodoc
class __$$MyLikeBookImplCopyWithImpl<$Res>
    extends _$MyLikeBookCopyWithImpl<$Res, _$MyLikeBookImpl>
    implements _$$MyLikeBookImplCopyWith<$Res> {
  __$$MyLikeBookImplCopyWithImpl(
      _$MyLikeBookImpl _value, $Res Function(_$MyLikeBookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_$MyLikeBookImpl(
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
              as List<LikeInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyLikeBookImpl implements _MyLikeBook {
  const _$MyLikeBookImpl(
      {required this.success,
      required this.msg,
      required final List<LikeInfo> data})
      : _data = data;

  factory _$MyLikeBookImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyLikeBookImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  final List<LikeInfo> _data;
  @override
  List<LikeInfo> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'MyLikeBook(success: $success, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyLikeBookImpl &&
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
  _$$MyLikeBookImplCopyWith<_$MyLikeBookImpl> get copyWith =>
      __$$MyLikeBookImplCopyWithImpl<_$MyLikeBookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyLikeBookImplToJson(
      this,
    );
  }
}

abstract class _MyLikeBook implements MyLikeBook {
  const factory _MyLikeBook(
      {required final bool success,
      required final String msg,
      required final List<LikeInfo> data}) = _$MyLikeBookImpl;

  factory _MyLikeBook.fromJson(Map<String, dynamic> json) =
      _$MyLikeBookImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  List<LikeInfo> get data;
  @override
  @JsonKey(ignore: true)
  _$$MyLikeBookImplCopyWith<_$MyLikeBookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LikeInfo _$LikeInfoFromJson(Map<String, dynamic> json) {
  return _LikeInfo.fromJson(json);
}

/// @nodoc
mixin _$LikeInfo {
  String get localCode => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  bool get likes => throw _privateConstructorUsedError;
  BookData get book => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikeInfoCopyWith<LikeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeInfoCopyWith<$Res> {
  factory $LikeInfoCopyWith(LikeInfo value, $Res Function(LikeInfo) then) =
      _$LikeInfoCopyWithImpl<$Res, LikeInfo>;
  @useResult
  $Res call({String localCode, int count, bool likes, BookData book});

  $BookDataCopyWith<$Res> get book;
}

/// @nodoc
class _$LikeInfoCopyWithImpl<$Res, $Val extends LikeInfo>
    implements $LikeInfoCopyWith<$Res> {
  _$LikeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localCode = null,
    Object? count = null,
    Object? likes = null,
    Object? book = null,
  }) {
    return _then(_value.copyWith(
      localCode: null == localCode
          ? _value.localCode
          : localCode // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as bool,
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as BookData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BookDataCopyWith<$Res> get book {
    return $BookDataCopyWith<$Res>(_value.book, (value) {
      return _then(_value.copyWith(book: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LikeInfoImplCopyWith<$Res>
    implements $LikeInfoCopyWith<$Res> {
  factory _$$LikeInfoImplCopyWith(
          _$LikeInfoImpl value, $Res Function(_$LikeInfoImpl) then) =
      __$$LikeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String localCode, int count, bool likes, BookData book});

  @override
  $BookDataCopyWith<$Res> get book;
}

/// @nodoc
class __$$LikeInfoImplCopyWithImpl<$Res>
    extends _$LikeInfoCopyWithImpl<$Res, _$LikeInfoImpl>
    implements _$$LikeInfoImplCopyWith<$Res> {
  __$$LikeInfoImplCopyWithImpl(
      _$LikeInfoImpl _value, $Res Function(_$LikeInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localCode = null,
    Object? count = null,
    Object? likes = null,
    Object? book = null,
  }) {
    return _then(_$LikeInfoImpl(
      localCode: null == localCode
          ? _value.localCode
          : localCode // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as bool,
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as BookData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LikeInfoImpl implements _LikeInfo {
  const _$LikeInfoImpl(
      {required this.localCode,
      required this.count,
      required this.likes,
      required this.book});

  factory _$LikeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LikeInfoImplFromJson(json);

  @override
  final String localCode;
  @override
  final int count;
  @override
  final bool likes;
  @override
  final BookData book;

  @override
  String toString() {
    return 'LikeInfo(localCode: $localCode, count: $count, likes: $likes, book: $book)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeInfoImpl &&
            (identical(other.localCode, localCode) ||
                other.localCode == localCode) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.book, book) || other.book == book));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, localCode, count, likes, book);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeInfoImplCopyWith<_$LikeInfoImpl> get copyWith =>
      __$$LikeInfoImplCopyWithImpl<_$LikeInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LikeInfoImplToJson(
      this,
    );
  }
}

abstract class _LikeInfo implements LikeInfo {
  const factory _LikeInfo(
      {required final String localCode,
      required final int count,
      required final bool likes,
      required final BookData book}) = _$LikeInfoImpl;

  factory _LikeInfo.fromJson(Map<String, dynamic> json) =
      _$LikeInfoImpl.fromJson;

  @override
  String get localCode;
  @override
  int get count;
  @override
  bool get likes;
  @override
  BookData get book;
  @override
  @JsonKey(ignore: true)
  _$$LikeInfoImplCopyWith<_$LikeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationsResp _$NotificationsRespFromJson(Map<String, dynamic> json) {
  return _NotificationsResp.fromJson(json);
}

/// @nodoc
mixin _$NotificationsResp {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  List<NotificationsData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationsRespCopyWith<NotificationsResp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsRespCopyWith<$Res> {
  factory $NotificationsRespCopyWith(
          NotificationsResp value, $Res Function(NotificationsResp) then) =
      _$NotificationsRespCopyWithImpl<$Res, NotificationsResp>;
  @useResult
  $Res call({bool success, String msg, List<NotificationsData> data});
}

/// @nodoc
class _$NotificationsRespCopyWithImpl<$Res, $Val extends NotificationsResp>
    implements $NotificationsRespCopyWith<$Res> {
  _$NotificationsRespCopyWithImpl(this._value, this._then);

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
              as List<NotificationsData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationsRespImplCopyWith<$Res>
    implements $NotificationsRespCopyWith<$Res> {
  factory _$$NotificationsRespImplCopyWith(_$NotificationsRespImpl value,
          $Res Function(_$NotificationsRespImpl) then) =
      __$$NotificationsRespImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, List<NotificationsData> data});
}

/// @nodoc
class __$$NotificationsRespImplCopyWithImpl<$Res>
    extends _$NotificationsRespCopyWithImpl<$Res, _$NotificationsRespImpl>
    implements _$$NotificationsRespImplCopyWith<$Res> {
  __$$NotificationsRespImplCopyWithImpl(_$NotificationsRespImpl _value,
      $Res Function(_$NotificationsRespImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_$NotificationsRespImpl(
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
              as List<NotificationsData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationsRespImpl implements _NotificationsResp {
  const _$NotificationsRespImpl(
      {required this.success,
      required this.msg,
      required final List<NotificationsData> data})
      : _data = data;

  factory _$NotificationsRespImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationsRespImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  final List<NotificationsData> _data;
  @override
  List<NotificationsData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'NotificationsResp(success: $success, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsRespImpl &&
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
  _$$NotificationsRespImplCopyWith<_$NotificationsRespImpl> get copyWith =>
      __$$NotificationsRespImplCopyWithImpl<_$NotificationsRespImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationsRespImplToJson(
      this,
    );
  }
}

abstract class _NotificationsResp implements NotificationsResp {
  const factory _NotificationsResp(
      {required final bool success,
      required final String msg,
      required final List<NotificationsData> data}) = _$NotificationsRespImpl;

  factory _NotificationsResp.fromJson(Map<String, dynamic> json) =
      _$NotificationsRespImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  List<NotificationsData> get data;
  @override
  @JsonKey(ignore: true)
  _$$NotificationsRespImplCopyWith<_$NotificationsRespImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationsData _$NotificationsDataFromJson(Map<String, dynamic> json) {
  return _NotificationsData.fromJson(json);
}

/// @nodoc
mixin _$NotificationsData {
  int get id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationsDataCopyWith<NotificationsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsDataCopyWith<$Res> {
  factory $NotificationsDataCopyWith(
          NotificationsData value, $Res Function(NotificationsData) then) =
      _$NotificationsDataCopyWithImpl<$Res, NotificationsData>;
  @useResult
  $Res call({int id, String message, DateTime createdAt});
}

/// @nodoc
class _$NotificationsDataCopyWithImpl<$Res, $Val extends NotificationsData>
    implements $NotificationsDataCopyWith<$Res> {
  _$NotificationsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationsDataImplCopyWith<$Res>
    implements $NotificationsDataCopyWith<$Res> {
  factory _$$NotificationsDataImplCopyWith(_$NotificationsDataImpl value,
          $Res Function(_$NotificationsDataImpl) then) =
      __$$NotificationsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String message, DateTime createdAt});
}

/// @nodoc
class __$$NotificationsDataImplCopyWithImpl<$Res>
    extends _$NotificationsDataCopyWithImpl<$Res, _$NotificationsDataImpl>
    implements _$$NotificationsDataImplCopyWith<$Res> {
  __$$NotificationsDataImplCopyWithImpl(_$NotificationsDataImpl _value,
      $Res Function(_$NotificationsDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? createdAt = null,
  }) {
    return _then(_$NotificationsDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
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
class _$NotificationsDataImpl implements _NotificationsData {
  const _$NotificationsDataImpl(
      {required this.id, required this.message, required this.createdAt});

  factory _$NotificationsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationsDataImplFromJson(json);

  @override
  final int id;
  @override
  final String message;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'NotificationsData(id: $id, message: $message, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, message, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsDataImplCopyWith<_$NotificationsDataImpl> get copyWith =>
      __$$NotificationsDataImplCopyWithImpl<_$NotificationsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationsDataImplToJson(
      this,
    );
  }
}

abstract class _NotificationsData implements NotificationsData {
  const factory _NotificationsData(
      {required final int id,
      required final String message,
      required final DateTime createdAt}) = _$NotificationsDataImpl;

  factory _NotificationsData.fromJson(Map<String, dynamic> json) =
      _$NotificationsDataImpl.fromJson;

  @override
  int get id;
  @override
  String get message;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$NotificationsDataImplCopyWith<_$NotificationsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
