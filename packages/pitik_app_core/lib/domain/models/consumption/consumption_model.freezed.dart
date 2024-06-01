// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consumption_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Consumption _$ConsumptionFromJson(Map<String, dynamic> json) {
  return _Consumption.fromJson(json);
}

/// @nodoc
mixin _$Consumption {
  double? get remaining => throw _privateConstructorUsedError;
  String? get estimation => throw _privateConstructorUsedError;
  String? get stockoutDate => throw _privateConstructorUsedError;
  double? get consumption => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsumptionCopyWith<Consumption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsumptionCopyWith<$Res> {
  factory $ConsumptionCopyWith(
          Consumption value, $Res Function(Consumption) then) =
      _$ConsumptionCopyWithImpl<$Res, Consumption>;
  @useResult
  $Res call(
      {double? remaining,
      String? estimation,
      String? stockoutDate,
      double? consumption});
}

/// @nodoc
class _$ConsumptionCopyWithImpl<$Res, $Val extends Consumption>
    implements $ConsumptionCopyWith<$Res> {
  _$ConsumptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remaining = freezed,
    Object? estimation = freezed,
    Object? stockoutDate = freezed,
    Object? consumption = freezed,
  }) {
    return _then(_value.copyWith(
      remaining: freezed == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as double?,
      estimation: freezed == estimation
          ? _value.estimation
          : estimation // ignore: cast_nullable_to_non_nullable
              as String?,
      stockoutDate: freezed == stockoutDate
          ? _value.stockoutDate
          : stockoutDate // ignore: cast_nullable_to_non_nullable
              as String?,
      consumption: freezed == consumption
          ? _value.consumption
          : consumption // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsumptionImplCopyWith<$Res>
    implements $ConsumptionCopyWith<$Res> {
  factory _$$ConsumptionImplCopyWith(
          _$ConsumptionImpl value, $Res Function(_$ConsumptionImpl) then) =
      __$$ConsumptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? remaining,
      String? estimation,
      String? stockoutDate,
      double? consumption});
}

/// @nodoc
class __$$ConsumptionImplCopyWithImpl<$Res>
    extends _$ConsumptionCopyWithImpl<$Res, _$ConsumptionImpl>
    implements _$$ConsumptionImplCopyWith<$Res> {
  __$$ConsumptionImplCopyWithImpl(
      _$ConsumptionImpl _value, $Res Function(_$ConsumptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remaining = freezed,
    Object? estimation = freezed,
    Object? stockoutDate = freezed,
    Object? consumption = freezed,
  }) {
    return _then(_$ConsumptionImpl(
      remaining: freezed == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as double?,
      estimation: freezed == estimation
          ? _value.estimation
          : estimation // ignore: cast_nullable_to_non_nullable
              as String?,
      stockoutDate: freezed == stockoutDate
          ? _value.stockoutDate
          : stockoutDate // ignore: cast_nullable_to_non_nullable
              as String?,
      consumption: freezed == consumption
          ? _value.consumption
          : consumption // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$ConsumptionImpl implements _Consumption {
  const _$ConsumptionImpl(
      {this.remaining, this.estimation, this.stockoutDate, this.consumption});

  factory _$ConsumptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsumptionImplFromJson(json);

  @override
  final double? remaining;
  @override
  final String? estimation;
  @override
  final String? stockoutDate;
  @override
  final double? consumption;

  @override
  String toString() {
    return 'Consumption(remaining: $remaining, estimation: $estimation, stockoutDate: $stockoutDate, consumption: $consumption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsumptionImpl &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.estimation, estimation) ||
                other.estimation == estimation) &&
            (identical(other.stockoutDate, stockoutDate) ||
                other.stockoutDate == stockoutDate) &&
            (identical(other.consumption, consumption) ||
                other.consumption == consumption));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, remaining, estimation, stockoutDate, consumption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsumptionImplCopyWith<_$ConsumptionImpl> get copyWith =>
      __$$ConsumptionImplCopyWithImpl<_$ConsumptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsumptionImplToJson(
      this,
    );
  }
}

abstract class _Consumption implements Consumption {
  const factory _Consumption(
      {final double? remaining,
      final String? estimation,
      final String? stockoutDate,
      final double? consumption}) = _$ConsumptionImpl;

  factory _Consumption.fromJson(Map<String, dynamic> json) =
      _$ConsumptionImpl.fromJson;

  @override
  double? get remaining;
  @override
  String? get estimation;
  @override
  String? get stockoutDate;
  @override
  double? get consumption;
  @override
  @JsonKey(ignore: true)
  _$$ConsumptionImplCopyWith<_$ConsumptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
