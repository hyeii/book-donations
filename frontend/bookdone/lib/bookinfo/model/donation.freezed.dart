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
