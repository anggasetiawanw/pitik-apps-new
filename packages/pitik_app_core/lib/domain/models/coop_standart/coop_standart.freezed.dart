// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coop_standart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoopActiveStandard _$CoopActiveStandardFromJson(Map<String, dynamic> json) {
  return _CoopActiveStandard.fromJson(json);
}

/// @nodoc
mixin _$CoopActiveStandard {
  int? get day => throw _privateConstructorUsedError;
  double? get actual => throw _privateConstructorUsedError;
  double? get standard => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoopActiveStandardCopyWith<CoopActiveStandard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoopActiveStandardCopyWith<$Res> {
  factory $CoopActiveStandardCopyWith(
          CoopActiveStandard value, $Res Function(CoopActiveStandard) then) =
      _$CoopActiveStandardCopyWithImpl<$Res, CoopActiveStandard>;
  @useResult
  $Res call({int? day, double? actual, double? standard});
}

/// @nodoc
class _$CoopActiveStandardCopyWithImpl<$Res, $Val extends CoopActiveStandard>
    implements $CoopActiveStandardCopyWith<$Res> {
  _$CoopActiveStandardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? actual = freezed,
    Object? standard = freezed,
  }) {
    return _then(_value.copyWith(
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      actual: freezed == actual
          ? _value.actual
          : actual // ignore: cast_nullable_to_non_nullable
              as double?,
      standard: freezed == standard
          ? _value.standard
          : standard // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoopActiveStandardImplCopyWith<$Res>
    implements $CoopActiveStandardCopyWith<$Res> {
  factory _$$CoopActiveStandardImplCopyWith(_$CoopActiveStandardImpl value,
          $Res Function(_$CoopActiveStandardImpl) then) =
      __$$CoopActiveStandardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? day, double? actual, double? standard});
}

/// @nodoc
class __$$CoopActiveStandardImplCopyWithImpl<$Res>
    extends _$CoopActiveStandardCopyWithImpl<$Res, _$CoopActiveStandardImpl>
    implements _$$CoopActiveStandardImplCopyWith<$Res> {
  __$$CoopActiveStandardImplCopyWithImpl(_$CoopActiveStandardImpl _value,
      $Res Function(_$CoopActiveStandardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? actual = freezed,
    Object? standard = freezed,
  }) {
    return _then(_$CoopActiveStandardImpl(
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      actual: freezed == actual
          ? _value.actual
          : actual // ignore: cast_nullable_to_non_nullable
              as double?,
      standard: freezed == standard
          ? _value.standard
          : standard // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$CoopActiveStandardImpl implements _CoopActiveStandard {
  const _$CoopActiveStandardImpl({this.day, this.actual, this.standard});

  factory _$CoopActiveStandardImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoopActiveStandardImplFromJson(json);

  @override
  final int? day;
  @override
  final double? actual;
  @override
  final double? standard;

  @override
  String toString() {
    return 'CoopActiveStandard(day: $day, actual: $actual, standard: $standard)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoopActiveStandardImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.actual, actual) || other.actual == actual) &&
            (identical(other.standard, standard) ||
                other.standard == standard));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, day, actual, standard);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoopActiveStandardImplCopyWith<_$CoopActiveStandardImpl> get copyWith =>
      __$$CoopActiveStandardImplCopyWithImpl<_$CoopActiveStandardImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoopActiveStandardImplToJson(
      this,
    );
  }
}

abstract class _CoopActiveStandard implements CoopActiveStandard {
  const factory _CoopActiveStandard(
      {final int? day,
      final double? actual,
      final double? standard}) = _$CoopActiveStandardImpl;

  factory _CoopActiveStandard.fromJson(Map<String, dynamic> json) =
      _$CoopActiveStandardImpl.fromJson;

  @override
  int? get day;
  @override
  double? get actual;
  @override
  double? get standard;
  @override
  @JsonKey(ignore: true)
  _$$CoopActiveStandardImplCopyWith<_$CoopActiveStandardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
