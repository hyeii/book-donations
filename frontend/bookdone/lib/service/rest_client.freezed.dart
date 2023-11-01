// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rest_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RestClient _$RestClientFromJson(Map<String, dynamic> json) {
  return _RestClient.fromJson(json);
}

/// @nodoc
mixin _$RestClient {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestClientCopyWith<RestClient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestClientCopyWith<$Res> {
  factory $RestClientCopyWith(
          RestClient value, $Res Function(RestClient) then) =
      _$RestClientCopyWithImpl<$Res, RestClient>;
  @useResult
  $Res call({int id, String title, String type, String url});
}

/// @nodoc
class _$RestClientCopyWithImpl<$Res, $Val extends RestClient>
    implements $RestClientCopyWith<$Res> {
  _$RestClientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? url = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestClientImplCopyWith<$Res>
    implements $RestClientCopyWith<$Res> {
  factory _$$RestClientImplCopyWith(
          _$RestClientImpl value, $Res Function(_$RestClientImpl) then) =
      __$$RestClientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String type, String url});
}

/// @nodoc
class __$$RestClientImplCopyWithImpl<$Res>
    extends _$RestClientCopyWithImpl<$Res, _$RestClientImpl>
    implements _$$RestClientImplCopyWith<$Res> {
  __$$RestClientImplCopyWithImpl(
      _$RestClientImpl _value, $Res Function(_$RestClientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? url = null,
  }) {
    return _then(_$RestClientImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestClientImpl with DiagnosticableTreeMixin implements _RestClient {
  const _$RestClientImpl(
      {required this.id,
      required this.title,
      required this.type,
      required this.url});

  factory _$RestClientImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestClientImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String type;
  @override
  final String url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RestClient(id: $id, title: $title, type: $type, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RestClient'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestClientImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, type, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestClientImplCopyWith<_$RestClientImpl> get copyWith =>
      __$$RestClientImplCopyWithImpl<_$RestClientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestClientImplToJson(
      this,
    );
  }
}

abstract class _RestClient implements RestClient {
  const factory _RestClient(
      {required final int id,
      required final String title,
      required final String type,
      required final String url}) = _$RestClientImpl;

  factory _RestClient.fromJson(Map<String, dynamic> json) =
      _$RestClientImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get type;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$RestClientImplCopyWith<_$RestClientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
