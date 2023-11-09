// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DonationByRegionData _$DonationByRegionDataFromJson(Map<String, dynamic> json) {
  return _DonationByRegionData.fromJson(json);
}

/// @nodoc
mixin _$DonationByRegionData {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  List<DonationByRegion>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DonationByRegionDataCopyWith<DonationByRegionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DonationByRegionDataCopyWith<$Res> {
  factory $DonationByRegionDataCopyWith(DonationByRegionData value,
          $Res Function(DonationByRegionData) then) =
      _$DonationByRegionDataCopyWithImpl<$Res, DonationByRegionData>;
  @useResult
  $Res call({bool success, String msg, List<DonationByRegion>? data});
}

/// @nodoc
class _$DonationByRegionDataCopyWithImpl<$Res,
        $Val extends DonationByRegionData>
    implements $DonationByRegionDataCopyWith<$Res> {
  _$DonationByRegionDataCopyWithImpl(this._value, this._then);

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
              as List<DonationByRegion>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DonationByRegionDataImplCopyWith<$Res>
    implements $DonationByRegionDataCopyWith<$Res> {
  factory _$$DonationByRegionDataImplCopyWith(_$DonationByRegionDataImpl value,
          $Res Function(_$DonationByRegionDataImpl) then) =
      __$$DonationByRegionDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, List<DonationByRegion>? data});
}

/// @nodoc
class __$$DonationByRegionDataImplCopyWithImpl<$Res>
    extends _$DonationByRegionDataCopyWithImpl<$Res, _$DonationByRegionDataImpl>
    implements _$$DonationByRegionDataImplCopyWith<$Res> {
  __$$DonationByRegionDataImplCopyWithImpl(_$DonationByRegionDataImpl _value,
      $Res Function(_$DonationByRegionDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = freezed,
  }) {
    return _then(_$DonationByRegionDataImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DonationByRegion>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DonationByRegionDataImpl
    with DiagnosticableTreeMixin
    implements _DonationByRegionData {
  const _$DonationByRegionDataImpl(
      {required this.success,
      required this.msg,
      final List<DonationByRegion>? data})
      : _data = data;

  factory _$DonationByRegionDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DonationByRegionDataImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  final List<DonationByRegion>? _data;
  @override
  List<DonationByRegion>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DonationByRegionData(success: $success, msg: $msg, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DonationByRegionData'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('msg', msg))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DonationByRegionDataImpl &&
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
  _$$DonationByRegionDataImplCopyWith<_$DonationByRegionDataImpl>
      get copyWith =>
          __$$DonationByRegionDataImplCopyWithImpl<_$DonationByRegionDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DonationByRegionDataImplToJson(
      this,
    );
  }
}

abstract class _DonationByRegionData implements DonationByRegionData {
  const factory _DonationByRegionData(
      {required final bool success,
      required final String msg,
      final List<DonationByRegion>? data}) = _$DonationByRegionDataImpl;

  factory _DonationByRegionData.fromJson(Map<String, dynamic> json) =
      _$DonationByRegionDataImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  List<DonationByRegion>? get data;
  @override
  @JsonKey(ignore: true)
  _$$DonationByRegionDataImplCopyWith<_$DonationByRegionDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DonationByRegion _$DonationByRegionFromJson(Map<String, dynamic> json) {
  return _DonationByRegion.fromJson(json);
}

/// @nodoc
mixin _$DonationByRegion {
  int get id => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  int get historyCount => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DonationByRegionCopyWith<DonationByRegion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DonationByRegionCopyWith<$Res> {
  factory $DonationByRegionCopyWith(
          DonationByRegion value, $Res Function(DonationByRegion) then) =
      _$DonationByRegionCopyWithImpl<$Res, DonationByRegion>;
  @useResult
  $Res call(
      {int id,
      String nickname,
      int historyCount,
      String address,
      String createdAt});
}

/// @nodoc
class _$DonationByRegionCopyWithImpl<$Res, $Val extends DonationByRegion>
    implements $DonationByRegionCopyWith<$Res> {
  _$DonationByRegionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? historyCount = null,
    Object? address = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      historyCount: null == historyCount
          ? _value.historyCount
          : historyCount // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DonationByRegionImplCopyWith<$Res>
    implements $DonationByRegionCopyWith<$Res> {
  factory _$$DonationByRegionImplCopyWith(_$DonationByRegionImpl value,
          $Res Function(_$DonationByRegionImpl) then) =
      __$$DonationByRegionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String nickname,
      int historyCount,
      String address,
      String createdAt});
}

/// @nodoc
class __$$DonationByRegionImplCopyWithImpl<$Res>
    extends _$DonationByRegionCopyWithImpl<$Res, _$DonationByRegionImpl>
    implements _$$DonationByRegionImplCopyWith<$Res> {
  __$$DonationByRegionImplCopyWithImpl(_$DonationByRegionImpl _value,
      $Res Function(_$DonationByRegionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? historyCount = null,
    Object? address = null,
    Object? createdAt = null,
  }) {
    return _then(_$DonationByRegionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      historyCount: null == historyCount
          ? _value.historyCount
          : historyCount // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
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
class _$DonationByRegionImpl
    with DiagnosticableTreeMixin
    implements _DonationByRegion {
  const _$DonationByRegionImpl(
      {required this.id,
      required this.nickname,
      required this.historyCount,
      required this.address,
      required this.createdAt});

  factory _$DonationByRegionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DonationByRegionImplFromJson(json);

  @override
  final int id;
  @override
  final String nickname;
  @override
  final int historyCount;
  @override
  final String address;
  @override
  final String createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DonationByRegion(id: $id, nickname: $nickname, historyCount: $historyCount, address: $address, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DonationByRegion'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('nickname', nickname))
      ..add(DiagnosticsProperty('historyCount', historyCount))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DonationByRegionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.historyCount, historyCount) ||
                other.historyCount == historyCount) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nickname, historyCount, address, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DonationByRegionImplCopyWith<_$DonationByRegionImpl> get copyWith =>
      __$$DonationByRegionImplCopyWithImpl<_$DonationByRegionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DonationByRegionImplToJson(
      this,
    );
  }
}

abstract class _DonationByRegion implements DonationByRegion {
  const factory _DonationByRegion(
      {required final int id,
      required final String nickname,
      required final int historyCount,
      required final String address,
      required final String createdAt}) = _$DonationByRegionImpl;

  factory _DonationByRegion.fromJson(Map<String, dynamic> json) =
      _$DonationByRegionImpl.fromJson;

  @override
  int get id;
  @override
  String get nickname;
  @override
  int get historyCount;
  @override
  String get address;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$DonationByRegionImplCopyWith<_$DonationByRegionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KeepingBookByRegion _$KeepingBookByRegionFromJson(Map<String, dynamic> json) {
  return _KeepingBookByRegion.fromJson(json);
}

/// @nodoc
mixin _$KeepingBookByRegion {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  List<KeepingBookData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeepingBookByRegionCopyWith<KeepingBookByRegion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeepingBookByRegionCopyWith<$Res> {
  factory $KeepingBookByRegionCopyWith(
          KeepingBookByRegion value, $Res Function(KeepingBookByRegion) then) =
      _$KeepingBookByRegionCopyWithImpl<$Res, KeepingBookByRegion>;
  @useResult
  $Res call({bool success, String msg, List<KeepingBookData> data});
}

/// @nodoc
class _$KeepingBookByRegionCopyWithImpl<$Res, $Val extends KeepingBookByRegion>
    implements $KeepingBookByRegionCopyWith<$Res> {
  _$KeepingBookByRegionCopyWithImpl(this._value, this._then);

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
              as List<KeepingBookData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KeepingBookByRegionImplCopyWith<$Res>
    implements $KeepingBookByRegionCopyWith<$Res> {
  factory _$$KeepingBookByRegionImplCopyWith(_$KeepingBookByRegionImpl value,
          $Res Function(_$KeepingBookByRegionImpl) then) =
      __$$KeepingBookByRegionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, List<KeepingBookData> data});
}

/// @nodoc
class __$$KeepingBookByRegionImplCopyWithImpl<$Res>
    extends _$KeepingBookByRegionCopyWithImpl<$Res, _$KeepingBookByRegionImpl>
    implements _$$KeepingBookByRegionImplCopyWith<$Res> {
  __$$KeepingBookByRegionImplCopyWithImpl(_$KeepingBookByRegionImpl _value,
      $Res Function(_$KeepingBookByRegionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = null,
  }) {
    return _then(_$KeepingBookByRegionImpl(
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
              as List<KeepingBookData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KeepingBookByRegionImpl
    with DiagnosticableTreeMixin
    implements _KeepingBookByRegion {
  const _$KeepingBookByRegionImpl(
      {required this.success,
      required this.msg,
      required final List<KeepingBookData> data})
      : _data = data;

  factory _$KeepingBookByRegionImpl.fromJson(Map<String, dynamic> json) =>
      _$$KeepingBookByRegionImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  final List<KeepingBookData> _data;
  @override
  List<KeepingBookData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KeepingBookByRegion(success: $success, msg: $msg, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KeepingBookByRegion'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('msg', msg))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeepingBookByRegionImpl &&
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
  _$$KeepingBookByRegionImplCopyWith<_$KeepingBookByRegionImpl> get copyWith =>
      __$$KeepingBookByRegionImplCopyWithImpl<_$KeepingBookByRegionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KeepingBookByRegionImplToJson(
      this,
    );
  }
}

abstract class _KeepingBookByRegion implements KeepingBookByRegion {
  const factory _KeepingBookByRegion(
      {required final bool success,
      required final String msg,
      required final List<KeepingBookData> data}) = _$KeepingBookByRegionImpl;

  factory _KeepingBookByRegion.fromJson(Map<String, dynamic> json) =
      _$KeepingBookByRegionImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  List<KeepingBookData> get data;
  @override
  @JsonKey(ignore: true)
  _$$KeepingBookByRegionImplCopyWith<_$KeepingBookByRegionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KeepingBookData _$KeepingBookDataFromJson(Map<String, dynamic> json) {
  return _KeepingBookData.fromJson(json);
}

/// @nodoc
mixin _$KeepingBookData {
  String get address => throw _privateConstructorUsedError;
  int get bookCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeepingBookDataCopyWith<KeepingBookData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeepingBookDataCopyWith<$Res> {
  factory $KeepingBookDataCopyWith(
          KeepingBookData value, $Res Function(KeepingBookData) then) =
      _$KeepingBookDataCopyWithImpl<$Res, KeepingBookData>;
  @useResult
  $Res call({String address, int bookCount});
}

/// @nodoc
class _$KeepingBookDataCopyWithImpl<$Res, $Val extends KeepingBookData>
    implements $KeepingBookDataCopyWith<$Res> {
  _$KeepingBookDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? bookCount = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      bookCount: null == bookCount
          ? _value.bookCount
          : bookCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KeepingBookDataImplCopyWith<$Res>
    implements $KeepingBookDataCopyWith<$Res> {
  factory _$$KeepingBookDataImplCopyWith(_$KeepingBookDataImpl value,
          $Res Function(_$KeepingBookDataImpl) then) =
      __$$KeepingBookDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String address, int bookCount});
}

/// @nodoc
class __$$KeepingBookDataImplCopyWithImpl<$Res>
    extends _$KeepingBookDataCopyWithImpl<$Res, _$KeepingBookDataImpl>
    implements _$$KeepingBookDataImplCopyWith<$Res> {
  __$$KeepingBookDataImplCopyWithImpl(
      _$KeepingBookDataImpl _value, $Res Function(_$KeepingBookDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? bookCount = null,
  }) {
    return _then(_$KeepingBookDataImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      bookCount: null == bookCount
          ? _value.bookCount
          : bookCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KeepingBookDataImpl
    with DiagnosticableTreeMixin
    implements _KeepingBookData {
  const _$KeepingBookDataImpl({required this.address, required this.bookCount});

  factory _$KeepingBookDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$KeepingBookDataImplFromJson(json);

  @override
  final String address;
  @override
  final int bookCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KeepingBookData(address: $address, bookCount: $bookCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KeepingBookData'))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('bookCount', bookCount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeepingBookDataImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.bookCount, bookCount) ||
                other.bookCount == bookCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, bookCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KeepingBookDataImplCopyWith<_$KeepingBookDataImpl> get copyWith =>
      __$$KeepingBookDataImplCopyWithImpl<_$KeepingBookDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KeepingBookDataImplToJson(
      this,
    );
  }
}

abstract class _KeepingBookData implements KeepingBookData {
  const factory _KeepingBookData(
      {required final String address,
      required final int bookCount}) = _$KeepingBookDataImpl;

  factory _KeepingBookData.fromJson(Map<String, dynamic> json) =
      _$KeepingBookDataImpl.fromJson;

  @override
  String get address;
  @override
  int get bookCount;
  @override
  @JsonKey(ignore: true)
  _$$KeepingBookDataImplCopyWith<_$KeepingBookDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BooksLikeResp _$BooksLikeRespFromJson(Map<String, dynamic> json) {
  return _BooksLikeResp.fromJson(json);
}

/// @nodoc
mixin _$BooksLikeResp {
  bool get success => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  List<BooksLikeData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BooksLikeRespCopyWith<BooksLikeResp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BooksLikeRespCopyWith<$Res> {
  factory $BooksLikeRespCopyWith(
          BooksLikeResp value, $Res Function(BooksLikeResp) then) =
      _$BooksLikeRespCopyWithImpl<$Res, BooksLikeResp>;
  @useResult
  $Res call({bool success, String msg, List<BooksLikeData>? data});
}

/// @nodoc
class _$BooksLikeRespCopyWithImpl<$Res, $Val extends BooksLikeResp>
    implements $BooksLikeRespCopyWith<$Res> {
  _$BooksLikeRespCopyWithImpl(this._value, this._then);

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
              as List<BooksLikeData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BooksLikeRespImplCopyWith<$Res>
    implements $BooksLikeRespCopyWith<$Res> {
  factory _$$BooksLikeRespImplCopyWith(
          _$BooksLikeRespImpl value, $Res Function(_$BooksLikeRespImpl) then) =
      __$$BooksLikeRespImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String msg, List<BooksLikeData>? data});
}

/// @nodoc
class __$$BooksLikeRespImplCopyWithImpl<$Res>
    extends _$BooksLikeRespCopyWithImpl<$Res, _$BooksLikeRespImpl>
    implements _$$BooksLikeRespImplCopyWith<$Res> {
  __$$BooksLikeRespImplCopyWithImpl(
      _$BooksLikeRespImpl _value, $Res Function(_$BooksLikeRespImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? msg = null,
    Object? data = freezed,
  }) {
    return _then(_$BooksLikeRespImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BooksLikeData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BooksLikeRespImpl
    with DiagnosticableTreeMixin
    implements _BooksLikeResp {
  const _$BooksLikeRespImpl(
      {required this.success,
      required this.msg,
      final List<BooksLikeData>? data})
      : _data = data;

  factory _$BooksLikeRespImpl.fromJson(Map<String, dynamic> json) =>
      _$$BooksLikeRespImplFromJson(json);

  @override
  final bool success;
  @override
  final String msg;
  final List<BooksLikeData>? _data;
  @override
  List<BooksLikeData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BooksLikeResp(success: $success, msg: $msg, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BooksLikeResp'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('msg', msg))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksLikeRespImpl &&
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
  _$$BooksLikeRespImplCopyWith<_$BooksLikeRespImpl> get copyWith =>
      __$$BooksLikeRespImplCopyWithImpl<_$BooksLikeRespImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BooksLikeRespImplToJson(
      this,
    );
  }
}

abstract class _BooksLikeResp implements BooksLikeResp {
  const factory _BooksLikeResp(
      {required final bool success,
      required final String msg,
      final List<BooksLikeData>? data}) = _$BooksLikeRespImpl;

  factory _BooksLikeResp.fromJson(Map<String, dynamic> json) =
      _$BooksLikeRespImpl.fromJson;

  @override
  bool get success;
  @override
  String get msg;
  @override
  List<BooksLikeData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$BooksLikeRespImplCopyWith<_$BooksLikeRespImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BooksLikeData _$BooksLikeDataFromJson(Map<String, dynamic> json) {
  return _BooksLikeData.fromJson(json);
}

/// @nodoc
mixin _$BooksLikeData {
  BookData get book => throw _privateConstructorUsedError;
  String get localCode => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  bool get likes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BooksLikeDataCopyWith<BooksLikeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BooksLikeDataCopyWith<$Res> {
  factory $BooksLikeDataCopyWith(
          BooksLikeData value, $Res Function(BooksLikeData) then) =
      _$BooksLikeDataCopyWithImpl<$Res, BooksLikeData>;
  @useResult
  $Res call({BookData book, String localCode, int count, bool likes});

  $BookDataCopyWith<$Res> get book;
}

/// @nodoc
class _$BooksLikeDataCopyWithImpl<$Res, $Val extends BooksLikeData>
    implements $BooksLikeDataCopyWith<$Res> {
  _$BooksLikeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
    Object? localCode = null,
    Object? count = null,
    Object? likes = null,
  }) {
    return _then(_value.copyWith(
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as BookData,
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
abstract class _$$BooksLikeDataImplCopyWith<$Res>
    implements $BooksLikeDataCopyWith<$Res> {
  factory _$$BooksLikeDataImplCopyWith(
          _$BooksLikeDataImpl value, $Res Function(_$BooksLikeDataImpl) then) =
      __$$BooksLikeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BookData book, String localCode, int count, bool likes});

  @override
  $BookDataCopyWith<$Res> get book;
}

/// @nodoc
class __$$BooksLikeDataImplCopyWithImpl<$Res>
    extends _$BooksLikeDataCopyWithImpl<$Res, _$BooksLikeDataImpl>
    implements _$$BooksLikeDataImplCopyWith<$Res> {
  __$$BooksLikeDataImplCopyWithImpl(
      _$BooksLikeDataImpl _value, $Res Function(_$BooksLikeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
    Object? localCode = null,
    Object? count = null,
    Object? likes = null,
  }) {
    return _then(_$BooksLikeDataImpl(
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as BookData,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BooksLikeDataImpl
    with DiagnosticableTreeMixin
    implements _BooksLikeData {
  const _$BooksLikeDataImpl(
      {required this.book,
      required this.localCode,
      required this.count,
      required this.likes});

  factory _$BooksLikeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BooksLikeDataImplFromJson(json);

  @override
  final BookData book;
  @override
  final String localCode;
  @override
  final int count;
  @override
  final bool likes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BooksLikeData(book: $book, localCode: $localCode, count: $count, likes: $likes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BooksLikeData'))
      ..add(DiagnosticsProperty('book', book))
      ..add(DiagnosticsProperty('localCode', localCode))
      ..add(DiagnosticsProperty('count', count))
      ..add(DiagnosticsProperty('likes', likes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksLikeDataImpl &&
            (identical(other.book, book) || other.book == book) &&
            (identical(other.localCode, localCode) ||
                other.localCode == localCode) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.likes, likes) || other.likes == likes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, book, localCode, count, likes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BooksLikeDataImplCopyWith<_$BooksLikeDataImpl> get copyWith =>
      __$$BooksLikeDataImplCopyWithImpl<_$BooksLikeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BooksLikeDataImplToJson(
      this,
    );
  }
}

abstract class _BooksLikeData implements BooksLikeData {
  const factory _BooksLikeData(
      {required final BookData book,
      required final String localCode,
      required final int count,
      required final bool likes}) = _$BooksLikeDataImpl;

  factory _BooksLikeData.fromJson(Map<String, dynamic> json) =
      _$BooksLikeDataImpl.fromJson;

  @override
  BookData get book;
  @override
  String get localCode;
  @override
  int get count;
  @override
  bool get likes;
  @override
  @JsonKey(ignore: true)
  _$$BooksLikeDataImplCopyWith<_$BooksLikeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
