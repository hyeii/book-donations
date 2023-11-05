// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Region _$RegionFromJson(Map<String, dynamic> json) {
  return _Region.fromJson(json);
}

/// @nodoc
mixin _$Region {
  String get first => throw _privateConstructorUsedError;
  List<SecondList> get secondList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegionCopyWith<Region> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionCopyWith<$Res> {
  factory $RegionCopyWith(Region value, $Res Function(Region) then) =
      _$RegionCopyWithImpl<$Res, Region>;
  @useResult
  $Res call({String first, List<SecondList> secondList});
}

/// @nodoc
class _$RegionCopyWithImpl<$Res, $Val extends Region>
    implements $RegionCopyWith<$Res> {
  _$RegionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? secondList = null,
  }) {
    return _then(_value.copyWith(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      secondList: null == secondList
          ? _value.secondList
          : secondList // ignore: cast_nullable_to_non_nullable
              as List<SecondList>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegionImplCopyWith<$Res> implements $RegionCopyWith<$Res> {
  factory _$$RegionImplCopyWith(
          _$RegionImpl value, $Res Function(_$RegionImpl) then) =
      __$$RegionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String first, List<SecondList> secondList});
}

/// @nodoc
class __$$RegionImplCopyWithImpl<$Res>
    extends _$RegionCopyWithImpl<$Res, _$RegionImpl>
    implements _$$RegionImplCopyWith<$Res> {
  __$$RegionImplCopyWithImpl(
      _$RegionImpl _value, $Res Function(_$RegionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? secondList = null,
  }) {
    return _then(_$RegionImpl(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      secondList: null == secondList
          ? _value._secondList
          : secondList // ignore: cast_nullable_to_non_nullable
              as List<SecondList>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegionImpl implements _Region {
  const _$RegionImpl(
      {required this.first, required final List<SecondList> secondList})
      : _secondList = secondList;

  factory _$RegionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegionImplFromJson(json);

  @override
  final String first;
  final List<SecondList> _secondList;
  @override
  List<SecondList> get secondList {
    if (_secondList is EqualUnmodifiableListView) return _secondList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_secondList);
  }

  @override
  String toString() {
    return 'Region(first: $first, secondList: $secondList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionImpl &&
            (identical(other.first, first) || other.first == first) &&
            const DeepCollectionEquality()
                .equals(other._secondList, _secondList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, first, const DeepCollectionEquality().hash(_secondList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionImplCopyWith<_$RegionImpl> get copyWith =>
      __$$RegionImplCopyWithImpl<_$RegionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegionImplToJson(
      this,
    );
  }
}

abstract class _Region implements Region {
  const factory _Region(
      {required final String first,
      required final List<SecondList> secondList}) = _$RegionImpl;

  factory _Region.fromJson(Map<String, dynamic> json) = _$RegionImpl.fromJson;

  @override
  String get first;
  @override
  List<SecondList> get secondList;
  @override
  @JsonKey(ignore: true)
  _$$RegionImplCopyWith<_$RegionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SecondList _$SecondListFromJson(Map<String, dynamic> json) {
  return _SecondList.fromJson(json);
}

/// @nodoc
mixin _$SecondList {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get second => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SecondListCopyWith<SecondList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecondListCopyWith<$Res> {
  factory $SecondListCopyWith(
          SecondList value, $Res Function(SecondList) then) =
      _$SecondListCopyWithImpl<$Res, SecondList>;
  @useResult
  $Res call({String code, String name, String second});
}

/// @nodoc
class _$SecondListCopyWithImpl<$Res, $Val extends SecondList>
    implements $SecondListCopyWith<$Res> {
  _$SecondListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? second = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      second: null == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SecondListImplCopyWith<$Res>
    implements $SecondListCopyWith<$Res> {
  factory _$$SecondListImplCopyWith(
          _$SecondListImpl value, $Res Function(_$SecondListImpl) then) =
      __$$SecondListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, String second});
}

/// @nodoc
class __$$SecondListImplCopyWithImpl<$Res>
    extends _$SecondListCopyWithImpl<$Res, _$SecondListImpl>
    implements _$$SecondListImplCopyWith<$Res> {
  __$$SecondListImplCopyWithImpl(
      _$SecondListImpl _value, $Res Function(_$SecondListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? second = null,
  }) {
    return _then(_$SecondListImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      second: null == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SecondListImpl implements _SecondList {
  const _$SecondListImpl(
      {required this.code, required this.name, required this.second});

  factory _$SecondListImpl.fromJson(Map<String, dynamic> json) =>
      _$$SecondListImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final String second;

  @override
  String toString() {
    return 'SecondList(code: $code, name: $name, second: $second)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecondListImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.second, second) || other.second == second));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, second);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SecondListImplCopyWith<_$SecondListImpl> get copyWith =>
      __$$SecondListImplCopyWithImpl<_$SecondListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SecondListImplToJson(
      this,
    );
  }
}

abstract class _SecondList implements SecondList {
  const factory _SecondList(
      {required final String code,
      required final String name,
      required final String second}) = _$SecondListImpl;

  factory _SecondList.fromJson(Map<String, dynamic> json) =
      _$SecondListImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String get second;
  @override
  @JsonKey(ignore: true)
  _$$SecondListImplCopyWith<_$SecondListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
