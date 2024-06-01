// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mortality_reason_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MortalityReason _$MortalityReasonFromJson(Map<String, dynamic> json) {
  return _MortalityReason.fromJson(json);
}

/// @nodoc
mixin _$MortalityReason {
  int? get quantity => throw _privateConstructorUsedError;
  String? get cause => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MortalityReasonCopyWith<MortalityReason> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MortalityReasonCopyWith<$Res> {
  factory $MortalityReasonCopyWith(
          MortalityReason value, $Res Function(MortalityReason) then) =
      _$MortalityReasonCopyWithImpl<$Res, MortalityReason>;
  @useResult
  $Res call({int? quantity, String? cause});
}

/// @nodoc
class _$MortalityReasonCopyWithImpl<$Res, $Val extends MortalityReason>
    implements $MortalityReasonCopyWith<$Res> {
  _$MortalityReasonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = freezed,
    Object? cause = freezed,
  }) {
    return _then(_value.copyWith(
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      cause: freezed == cause
          ? _value.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MortalityReasonImplCopyWith<$Res>
    implements $MortalityReasonCopyWith<$Res> {
  factory _$$MortalityReasonImplCopyWith(_$MortalityReasonImpl value,
          $Res Function(_$MortalityReasonImpl) then) =
      __$$MortalityReasonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? quantity, String? cause});
}

/// @nodoc
class __$$MortalityReasonImplCopyWithImpl<$Res>
    extends _$MortalityReasonCopyWithImpl<$Res, _$MortalityReasonImpl>
    implements _$$MortalityReasonImplCopyWith<$Res> {
  __$$MortalityReasonImplCopyWithImpl(
      _$MortalityReasonImpl _value, $Res Function(_$MortalityReasonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = freezed,
    Object? cause = freezed,
  }) {
    return _then(_$MortalityReasonImpl(
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      cause: freezed == cause
          ? _value.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$MortalityReasonImpl implements _MortalityReason {
  const _$MortalityReasonImpl({this.quantity, this.cause});

  factory _$MortalityReasonImpl.fromJson(Map<String, dynamic> json) =>
      _$$MortalityReasonImplFromJson(json);

  @override
  final int? quantity;
  @override
  final String? cause;

  @override
  String toString() {
    return 'MortalityReason(quantity: $quantity, cause: $cause)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MortalityReasonImpl &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, quantity, cause);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MortalityReasonImplCopyWith<_$MortalityReasonImpl> get copyWith =>
      __$$MortalityReasonImplCopyWithImpl<_$MortalityReasonImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MortalityReasonImplToJson(
      this,
    );
  }
}

abstract class _MortalityReason implements MortalityReason {
  const factory _MortalityReason({final int? quantity, final String? cause}) =
      _$MortalityReasonImpl;

  factory _MortalityReason.fromJson(Map<String, dynamic> json) =
      _$MortalityReasonImpl.fromJson;

  @override
  int? get quantity;
  @override
  String? get cause;
  @override
  @JsonKey(ignore: true)
  _$$MortalityReasonImplCopyWith<_$MortalityReasonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
