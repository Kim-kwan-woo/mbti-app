// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mbti.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Mbti _$MbtiFromJson(Map<String, dynamic> json) {
  return _Mbti.fromJson(json);
}

/// @nodoc
mixin _$Mbti {
  String get mbti => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MbtiCopyWith<Mbti> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MbtiCopyWith<$Res> {
  factory $MbtiCopyWith(Mbti value, $Res Function(Mbti) then) =
      _$MbtiCopyWithImpl<$Res, Mbti>;
  @useResult
  $Res call({String mbti, String type, String description});
}

/// @nodoc
class _$MbtiCopyWithImpl<$Res, $Val extends Mbti>
    implements $MbtiCopyWith<$Res> {
  _$MbtiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mbti = null,
    Object? type = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      mbti: null == mbti
          ? _value.mbti
          : mbti // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MbtiImplCopyWith<$Res> implements $MbtiCopyWith<$Res> {
  factory _$$MbtiImplCopyWith(
          _$MbtiImpl value, $Res Function(_$MbtiImpl) then) =
      __$$MbtiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mbti, String type, String description});
}

/// @nodoc
class __$$MbtiImplCopyWithImpl<$Res>
    extends _$MbtiCopyWithImpl<$Res, _$MbtiImpl>
    implements _$$MbtiImplCopyWith<$Res> {
  __$$MbtiImplCopyWithImpl(_$MbtiImpl _value, $Res Function(_$MbtiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mbti = null,
    Object? type = null,
    Object? description = null,
  }) {
    return _then(_$MbtiImpl(
      mbti: null == mbti
          ? _value.mbti
          : mbti // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MbtiImpl implements _Mbti {
  _$MbtiImpl(
      {required this.mbti, required this.type, required this.description});

  factory _$MbtiImpl.fromJson(Map<String, dynamic> json) =>
      _$$MbtiImplFromJson(json);

  @override
  final String mbti;
  @override
  final String type;
  @override
  final String description;

  @override
  String toString() {
    return 'Mbti(mbti: $mbti, type: $type, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MbtiImpl &&
            (identical(other.mbti, mbti) || other.mbti == mbti) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mbti, type, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MbtiImplCopyWith<_$MbtiImpl> get copyWith =>
      __$$MbtiImplCopyWithImpl<_$MbtiImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MbtiImplToJson(
      this,
    );
  }
}

abstract class _Mbti implements Mbti {
  factory _Mbti(
      {required final String mbti,
      required final String type,
      required final String description}) = _$MbtiImpl;

  factory _Mbti.fromJson(Map<String, dynamic> json) = _$MbtiImpl.fromJson;

  @override
  String get mbti;
  @override
  String get type;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$MbtiImplCopyWith<_$MbtiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
