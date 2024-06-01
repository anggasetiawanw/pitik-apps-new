// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'population_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Population _$PopulationFromJson(Map<String, dynamic> json) {
  return _Population.fromJson(json);
}

/// @nodoc
mixin _$Population {
  int? get total => throw _privateConstructorUsedError;
  int? get mortaled => throw _privateConstructorUsedError;
  int? get mortality => throw _privateConstructorUsedError;
  int? get harvested => throw _privateConstructorUsedError;
  int? get remaining => throw _privateConstructorUsedError;
  int? get feedConsumed => throw _privateConstructorUsedError;
  int? get culled => throw _privateConstructorUsedError;
  int? get initialPopulation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PopulationCopyWith<Population> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopulationCopyWith<$Res> {
  factory $PopulationCopyWith(
          Population value, $Res Function(Population) then) =
      _$PopulationCopyWithImpl<$Res, Population>;
  @useResult
  $Res call(
      {int? total,
      int? mortaled,
      int? mortality,
      int? harvested,
      int? remaining,
      int? feedConsumed,
      int? culled,
      int? initialPopulation});
}

/// @nodoc
class _$PopulationCopyWithImpl<$Res, $Val extends Population>
    implements $PopulationCopyWith<$Res> {
  _$PopulationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? mortaled = freezed,
    Object? mortality = freezed,
    Object? harvested = freezed,
    Object? remaining = freezed,
    Object? feedConsumed = freezed,
    Object? culled = freezed,
    Object? initialPopulation = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      mortaled: freezed == mortaled
          ? _value.mortaled
          : mortaled // ignore: cast_nullable_to_non_nullable
              as int?,
      mortality: freezed == mortality
          ? _value.mortality
          : mortality // ignore: cast_nullable_to_non_nullable
              as int?,
      harvested: freezed == harvested
          ? _value.harvested
          : harvested // ignore: cast_nullable_to_non_nullable
              as int?,
      remaining: freezed == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int?,
      feedConsumed: freezed == feedConsumed
          ? _value.feedConsumed
          : feedConsumed // ignore: cast_nullable_to_non_nullable
              as int?,
      culled: freezed == culled
          ? _value.culled
          : culled // ignore: cast_nullable_to_non_nullable
              as int?,
      initialPopulation: freezed == initialPopulation
          ? _value.initialPopulation
          : initialPopulation // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PopulationImplCopyWith<$Res>
    implements $PopulationCopyWith<$Res> {
  factory _$$PopulationImplCopyWith(
          _$PopulationImpl value, $Res Function(_$PopulationImpl) then) =
      __$$PopulationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? total,
      int? mortaled,
      int? mortality,
      int? harvested,
      int? remaining,
      int? feedConsumed,
      int? culled,
      int? initialPopulation});
}

/// @nodoc
class __$$PopulationImplCopyWithImpl<$Res>
    extends _$PopulationCopyWithImpl<$Res, _$PopulationImpl>
    implements _$$PopulationImplCopyWith<$Res> {
  __$$PopulationImplCopyWithImpl(
      _$PopulationImpl _value, $Res Function(_$PopulationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? mortaled = freezed,
    Object? mortality = freezed,
    Object? harvested = freezed,
    Object? remaining = freezed,
    Object? feedConsumed = freezed,
    Object? culled = freezed,
    Object? initialPopulation = freezed,
  }) {
    return _then(_$PopulationImpl(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      mortaled: freezed == mortaled
          ? _value.mortaled
          : mortaled // ignore: cast_nullable_to_non_nullable
              as int?,
      mortality: freezed == mortality
          ? _value.mortality
          : mortality // ignore: cast_nullable_to_non_nullable
              as int?,
      harvested: freezed == harvested
          ? _value.harvested
          : harvested // ignore: cast_nullable_to_non_nullable
              as int?,
      remaining: freezed == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int?,
      feedConsumed: freezed == feedConsumed
          ? _value.feedConsumed
          : feedConsumed // ignore: cast_nullable_to_non_nullable
              as int?,
      culled: freezed == culled
          ? _value.culled
          : culled // ignore: cast_nullable_to_non_nullable
              as int?,
      initialPopulation: freezed == initialPopulation
          ? _value.initialPopulation
          : initialPopulation // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$PopulationImpl implements _Population {
  const _$PopulationImpl(
      {this.total,
      this.mortaled,
      this.mortality,
      this.harvested,
      this.remaining,
      this.feedConsumed,
      this.culled,
      this.initialPopulation});

  factory _$PopulationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PopulationImplFromJson(json);

  @override
  final int? total;
  @override
  final int? mortaled;
  @override
  final int? mortality;
  @override
  final int? harvested;
  @override
  final int? remaining;
  @override
  final int? feedConsumed;
  @override
  final int? culled;
  @override
  final int? initialPopulation;

  @override
  String toString() {
    return 'Population(total: $total, mortaled: $mortaled, mortality: $mortality, harvested: $harvested, remaining: $remaining, feedConsumed: $feedConsumed, culled: $culled, initialPopulation: $initialPopulation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopulationImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.mortaled, mortaled) ||
                other.mortaled == mortaled) &&
            (identical(other.mortality, mortality) ||
                other.mortality == mortality) &&
            (identical(other.harvested, harvested) ||
                other.harvested == harvested) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.feedConsumed, feedConsumed) ||
                other.feedConsumed == feedConsumed) &&
            (identical(other.culled, culled) || other.culled == culled) &&
            (identical(other.initialPopulation, initialPopulation) ||
                other.initialPopulation == initialPopulation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, mortaled, mortality,
      harvested, remaining, feedConsumed, culled, initialPopulation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PopulationImplCopyWith<_$PopulationImpl> get copyWith =>
      __$$PopulationImplCopyWithImpl<_$PopulationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PopulationImplToJson(
      this,
    );
  }
}

abstract class _Population implements Population {
  const factory _Population(
      {final int? total,
      final int? mortaled,
      final int? mortality,
      final int? harvested,
      final int? remaining,
      final int? feedConsumed,
      final int? culled,
      final int? initialPopulation}) = _$PopulationImpl;

  factory _Population.fromJson(Map<String, dynamic> json) =
      _$PopulationImpl.fromJson;

  @override
  int? get total;
  @override
  int? get mortaled;
  @override
  int? get mortality;
  @override
  int? get harvested;
  @override
  int? get remaining;
  @override
  int? get feedConsumed;
  @override
  int? get culled;
  @override
  int? get initialPopulation;
  @override
  @JsonKey(ignore: true)
  _$$PopulationImplCopyWith<_$PopulationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
