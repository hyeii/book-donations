// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
mixin _$Book {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  List<BookData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call({bool success, String msg, List<BookData> data});
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

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
              as List<BookData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookImplCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$BookImplCopyWith(
          _$BookImpl value, $Res Function(_$BookImpl) then) =
      __$$BookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, List<BookData> data});
}

/// @nodoc
class __$$BookImplCopyWithImpl<$Res>
    extends _$BookCopyWithImpl<$Res, _$BookImpl>
    implements _$$BookImplCopyWith<$Res> {
  __$$BookImplCopyWithImpl(_$BookImpl _value, $Res Function(_$BookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_$BookImpl(
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
              as List<BookData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookImpl implements _Book {
  const _$BookImpl(
      {required this.success,
      required this.msg,
      required final List<BookData> data})
      : _data = data;

  factory _$BookImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  final List<BookData> _data;
  @override
  List<BookData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'Book(success: $success, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookImpl &&
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
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      __$$BookImplCopyWithImpl<_$BookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookImplToJson(
      this,
    );
  }
}

abstract class _Book implements Book {
  const factory _Book(
      {required final bool success,
      required final String msg,
      required final List<BookData> data}) = _$BookImpl;

  factory _Book.fromJson(Map<String, dynamic> json) = _$BookImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  List<BookData> get data;
  @override
  @JsonKey(ignore: true)
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookData _$BookDataFromJson(Map<String, dynamic> json) {
  return _BookData.fromJson(json);
}

/// @nodoc
mixin _$BookData {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get seriesTitle => throw _privateConstructorUsedError;
  String get seriesNo => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get isbn => throw _privateConstructorUsedError;
  String get publisher => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookDataCopyWith<BookData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookDataCopyWith<$Res> {
  factory $BookDataCopyWith(BookData value, $Res Function(BookData) then) =
      _$BookDataCopyWithImpl<$Res, BookData>;
  @useResult
  $Res call(
      {int id,
      String title,
      String seriesTitle,
      String seriesNo,
      String author,
      String isbn,
      String publisher});
}

/// @nodoc
class _$BookDataCopyWithImpl<$Res, $Val extends BookData>
    implements $BookDataCopyWith<$Res> {
  _$BookDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? seriesTitle = null,
    Object? seriesNo = null,
    Object? author = null,
    Object? isbn = null,
    Object? publisher = null,
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
      seriesTitle: null == seriesTitle
          ? _value.seriesTitle
          : seriesTitle // ignore: cast_nullable_to_non_nullable
              as String,
      seriesNo: null == seriesNo
          ? _value.seriesNo
          : seriesNo // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookDataImplCopyWith<$Res>
    implements $BookDataCopyWith<$Res> {
  factory _$$BookDataImplCopyWith(
          _$BookDataImpl value, $Res Function(_$BookDataImpl) then) =
      __$$BookDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String seriesTitle,
      String seriesNo,
      String author,
      String isbn,
      String publisher});
}

/// @nodoc
class __$$BookDataImplCopyWithImpl<$Res>
    extends _$BookDataCopyWithImpl<$Res, _$BookDataImpl>
    implements _$$BookDataImplCopyWith<$Res> {
  __$$BookDataImplCopyWithImpl(
      _$BookDataImpl _value, $Res Function(_$BookDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? seriesTitle = null,
    Object? seriesNo = null,
    Object? author = null,
    Object? isbn = null,
    Object? publisher = null,
  }) {
    return _then(_$BookDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      seriesTitle: null == seriesTitle
          ? _value.seriesTitle
          : seriesTitle // ignore: cast_nullable_to_non_nullable
              as String,
      seriesNo: null == seriesNo
          ? _value.seriesNo
          : seriesNo // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookDataImpl implements _BookData {
  const _$BookDataImpl(
      {required this.id,
      required this.title,
      required this.seriesTitle,
      required this.seriesNo,
      required this.author,
      required this.isbn,
      required this.publisher});

  factory _$BookDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookDataImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String seriesTitle;
  @override
  final String seriesNo;
  @override
  final String author;
  @override
  final String isbn;
  @override
  final String publisher;

  @override
  String toString() {
    return 'BookData(id: $id, title: $title, seriesTitle: $seriesTitle, seriesNo: $seriesNo, author: $author, isbn: $isbn, publisher: $publisher)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.seriesTitle, seriesTitle) ||
                other.seriesTitle == seriesTitle) &&
            (identical(other.seriesNo, seriesNo) ||
                other.seriesNo == seriesNo) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.isbn, isbn) || other.isbn == isbn) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, seriesTitle, seriesNo, author, isbn, publisher);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookDataImplCopyWith<_$BookDataImpl> get copyWith =>
      __$$BookDataImplCopyWithImpl<_$BookDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookDataImplToJson(
      this,
    );
  }
}

abstract class _BookData implements BookData {
  const factory _BookData(
      {required final int id,
      required final String title,
      required final String seriesTitle,
      required final String seriesNo,
      required final String author,
      required final String isbn,
      required final String publisher}) = _$BookDataImpl;

  factory _BookData.fromJson(Map<String, dynamic> json) =
      _$BookDataImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get seriesTitle;
  @override
  String get seriesNo;
  @override
  String get author;
  @override
  String get isbn;
  @override
  String get publisher;
  @override
  @JsonKey(ignore: true)
  _$$BookDataImplCopyWith<_$BookDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookDetail _$BookDetailFromJson(Map<String, dynamic> json) {
  return _BookDetail.fromJson(json);
}

/// @nodoc
mixin _$BookDetail {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  BookData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookDetailCopyWith<BookDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookDetailCopyWith<$Res> {
  factory $BookDetailCopyWith(
          BookDetail value, $Res Function(BookDetail) then) =
      _$BookDetailCopyWithImpl<$Res, BookDetail>;
  @useResult
  $Res call({bool success, String msg, BookData data});

  $BookDataCopyWith<$Res> get data;
}

/// @nodoc
class _$BookDetailCopyWithImpl<$Res, $Val extends BookDetail>
    implements $BookDetailCopyWith<$Res> {
  _$BookDetailCopyWithImpl(this._value, this._then);

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
              as BookData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BookDataCopyWith<$Res> get data {
    return $BookDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookDetailImplCopyWith<$Res>
    implements $BookDetailCopyWith<$Res> {
  factory _$$BookDetailImplCopyWith(
          _$BookDetailImpl value, $Res Function(_$BookDetailImpl) then) =
      __$$BookDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, BookData data});

  @override
  $BookDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$BookDetailImplCopyWithImpl<$Res>
    extends _$BookDetailCopyWithImpl<$Res, _$BookDetailImpl>
    implements _$$BookDetailImplCopyWith<$Res> {
  __$$BookDetailImplCopyWithImpl(
      _$BookDetailImpl _value, $Res Function(_$BookDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_$BookDetailImpl(
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
              as BookData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookDetailImpl implements _BookDetail {
  const _$BookDetailImpl(
      {required this.success, required this.msg, required this.data});

  factory _$BookDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookDetailImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  @override
  final BookData data;

  @override
  String toString() {
    return 'BookDetail(success: $success, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookDetailImpl &&
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
  _$$BookDetailImplCopyWith<_$BookDetailImpl> get copyWith =>
      __$$BookDetailImplCopyWithImpl<_$BookDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookDetailImplToJson(
      this,
    );
  }
}

abstract class _BookDetail implements BookDetail {
  const factory _BookDetail(
      {required final bool success,
      required final String msg,
      required final BookData data}) = _$BookDetailImpl;

  factory _BookDetail.fromJson(Map<String, dynamic> json) =
      _$BookDetailImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  BookData get data;
  @override
  @JsonKey(ignore: true)
  _$$BookDetailImplCopyWith<_$BookDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AutoList _$AutoListFromJson(Map<String, dynamic> json) {
  return _AutoList.fromJson(json);
}

/// @nodoc
mixin _$AutoList {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  List<AutoListData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AutoListCopyWith<AutoList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoListCopyWith<$Res> {
  factory $AutoListCopyWith(AutoList value, $Res Function(AutoList) then) =
      _$AutoListCopyWithImpl<$Res, AutoList>;
  @useResult
  $Res call({bool success, String msg, List<AutoListData> data});
}

/// @nodoc
class _$AutoListCopyWithImpl<$Res, $Val extends AutoList>
    implements $AutoListCopyWith<$Res> {
  _$AutoListCopyWithImpl(this._value, this._then);

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
              as List<AutoListData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AutoListImplCopyWith<$Res>
    implements $AutoListCopyWith<$Res> {
  factory _$$AutoListImplCopyWith(
          _$AutoListImpl value, $Res Function(_$AutoListImpl) then) =
      __$$AutoListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, List<AutoListData> data});
}

/// @nodoc
class __$$AutoListImplCopyWithImpl<$Res>
    extends _$AutoListCopyWithImpl<$Res, _$AutoListImpl>
    implements _$$AutoListImplCopyWith<$Res> {
  __$$AutoListImplCopyWithImpl(
      _$AutoListImpl _value, $Res Function(_$AutoListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_$AutoListImpl(
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
              as List<AutoListData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AutoListImpl implements _AutoList {
  const _$AutoListImpl(
      {required this.success,
      required this.msg,
      required final List<AutoListData> data})
      : _data = data;

  factory _$AutoListImpl.fromJson(Map<String, dynamic> json) =>
      _$$AutoListImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  final List<AutoListData> _data;
  @override
  List<AutoListData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'AutoList(success: $success, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoListImpl &&
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
  _$$AutoListImplCopyWith<_$AutoListImpl> get copyWith =>
      __$$AutoListImplCopyWithImpl<_$AutoListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AutoListImplToJson(
      this,
    );
  }
}

abstract class _AutoList implements AutoList {
  const factory _AutoList(
      {required final bool success,
      required final String msg,
      required final List<AutoListData> data}) = _$AutoListImpl;

  factory _AutoList.fromJson(Map<String, dynamic> json) =
      _$AutoListImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  List<AutoListData> get data;
  @override
  @JsonKey(ignore: true)
  _$$AutoListImplCopyWith<_$AutoListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AutoListData _$AutoListDataFromJson(Map<String, dynamic> json) {
  return _AutoListData.fromJson(json);
}

/// @nodoc
mixin _$AutoListData {
  String get title => throw _privateConstructorUsedError;
  String get isbn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AutoListDataCopyWith<AutoListData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoListDataCopyWith<$Res> {
  factory $AutoListDataCopyWith(
          AutoListData value, $Res Function(AutoListData) then) =
      _$AutoListDataCopyWithImpl<$Res, AutoListData>;
  @useResult
  $Res call({String title, String isbn});
}

/// @nodoc
class _$AutoListDataCopyWithImpl<$Res, $Val extends AutoListData>
    implements $AutoListDataCopyWith<$Res> {
  _$AutoListDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isbn = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AutoListDataImplCopyWith<$Res>
    implements $AutoListDataCopyWith<$Res> {
  factory _$$AutoListDataImplCopyWith(
          _$AutoListDataImpl value, $Res Function(_$AutoListDataImpl) then) =
      __$$AutoListDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String isbn});
}

/// @nodoc
class __$$AutoListDataImplCopyWithImpl<$Res>
    extends _$AutoListDataCopyWithImpl<$Res, _$AutoListDataImpl>
    implements _$$AutoListDataImplCopyWith<$Res> {
  __$$AutoListDataImplCopyWithImpl(
      _$AutoListDataImpl _value, $Res Function(_$AutoListDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isbn = null,
  }) {
    return _then(_$AutoListDataImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AutoListDataImpl implements _AutoListData {
  const _$AutoListDataImpl({required this.title, required this.isbn});

  factory _$AutoListDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AutoListDataImplFromJson(json);

  @override
  final String title;
  @override
  final String isbn;

  @override
  String toString() {
    return 'AutoListData(title: $title, isbn: $isbn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoListDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isbn, isbn) || other.isbn == isbn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, isbn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AutoListDataImplCopyWith<_$AutoListDataImpl> get copyWith =>
      __$$AutoListDataImplCopyWithImpl<_$AutoListDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AutoListDataImplToJson(
      this,
    );
  }
}

abstract class _AutoListData implements AutoListData {
  const factory _AutoListData(
      {required final String title,
      required final String isbn}) = _$AutoListDataImpl;

  factory _AutoListData.fromJson(Map<String, dynamic> json) =
      _$AutoListDataImpl.fromJson;

  @override
  String get title;
  @override
  String get isbn;
  @override
  @JsonKey(ignore: true)
  _$$AutoListDataImplCopyWith<_$AutoListDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
