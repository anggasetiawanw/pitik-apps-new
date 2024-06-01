// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monitoring_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Monitoring _$MonitoringFromJson(Map<String, dynamic> json) {
  return _Monitoring.fromJson(json);
}

/// @nodoc
mixin _$Monitoring {
  int? get day => throw _privateConstructorUsedError;
  int? get chickenAge => throw _privateConstructorUsedError;
  String? get coopName => throw _privateConstructorUsedError;
  int? get period => throw _privateConstructorUsedError;
  int? get currentTemperature => throw _privateConstructorUsedError;
  double? get averageChickenAge => throw _privateConstructorUsedError;
  String? get chickInDate => throw _privateConstructorUsedError;
  CoopPerformance? get performance => throw _privateConstructorUsedError;
  Population? get population => throw _privateConstructorUsedError;
  Consumption? get feed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonitoringCopyWith<Monitoring> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonitoringCopyWith<$Res> {
  factory $MonitoringCopyWith(
          Monitoring value, $Res Function(Monitoring) then) =
      _$MonitoringCopyWithImpl<$Res, Monitoring>;
  @useResult
  $Res call(
      {int? day,
      int? chickenAge,
      String? coopName,
      int? period,
      int? currentTemperature,
      double? averageChickenAge,
      String? chickInDate,
      CoopPerformance? performance,
      Population? population,
      Consumption? feed});

  $CoopPerformanceCopyWith<$Res>? get performance;
  $PopulationCopyWith<$Res>? get population;
  $ConsumptionCopyWith<$Res>? get feed;
}

/// @nodoc
class _$MonitoringCopyWithImpl<$Res, $Val extends Monitoring>
    implements $MonitoringCopyWith<$Res> {
  _$MonitoringCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? chickenAge = freezed,
    Object? coopName = freezed,
    Object? period = freezed,
    Object? currentTemperature = freezed,
    Object? averageChickenAge = freezed,
    Object? chickInDate = freezed,
    Object? performance = freezed,
    Object? population = freezed,
    Object? feed = freezed,
  }) {
    return _then(_value.copyWith(
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      chickenAge: freezed == chickenAge
          ? _value.chickenAge
          : chickenAge // ignore: cast_nullable_to_non_nullable
              as int?,
      coopName: freezed == coopName
          ? _value.coopName
          : coopName // ignore: cast_nullable_to_non_nullable
              as String?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int?,
      currentTemperature: freezed == currentTemperature
          ? _value.currentTemperature
          : currentTemperature // ignore: cast_nullable_to_non_nullable
              as int?,
      averageChickenAge: freezed == averageChickenAge
          ? _value.averageChickenAge
          : averageChickenAge // ignore: cast_nullable_to_non_nullable
              as double?,
      chickInDate: freezed == chickInDate
          ? _value.chickInDate
          : chickInDate // ignore: cast_nullable_to_non_nullable
              as String?,
      performance: freezed == performance
          ? _value.performance
          : performance // ignore: cast_nullable_to_non_nullable
              as CoopPerformance?,
      population: freezed == population
          ? _value.population
          : population // ignore: cast_nullable_to_non_nullable
              as Population?,
      feed: freezed == feed
          ? _value.feed
          : feed // ignore: cast_nullable_to_non_nullable
              as Consumption?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CoopPerformanceCopyWith<$Res>? get performance {
    if (_value.performance == null) {
      return null;
    }

    return $CoopPerformanceCopyWith<$Res>(_value.performance!, (value) {
      return _then(_value.copyWith(performance: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PopulationCopyWith<$Res>? get population {
    if (_value.population == null) {
      return null;
    }

    return $PopulationCopyWith<$Res>(_value.population!, (value) {
      return _then(_value.copyWith(population: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ConsumptionCopyWith<$Res>? get feed {
    if (_value.feed == null) {
      return null;
    }

    return $ConsumptionCopyWith<$Res>(_value.feed!, (value) {
      return _then(_value.copyWith(feed: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MonitoringImplCopyWith<$Res>
    implements $MonitoringCopyWith<$Res> {
  factory _$$MonitoringImplCopyWith(
          _$MonitoringImpl value, $Res Function(_$MonitoringImpl) then) =
      __$$MonitoringImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? day,
      int? chickenAge,
      String? coopName,
      int? period,
      int? currentTemperature,
      double? averageChickenAge,
      String? chickInDate,
      CoopPerformance? performance,
      Population? population,
      Consumption? feed});

  @override
  $CoopPerformanceCopyWith<$Res>? get performance;
  @override
  $PopulationCopyWith<$Res>? get population;
  @override
  $ConsumptionCopyWith<$Res>? get feed;
}

/// @nodoc
class __$$MonitoringImplCopyWithImpl<$Res>
    extends _$MonitoringCopyWithImpl<$Res, _$MonitoringImpl>
    implements _$$MonitoringImplCopyWith<$Res> {
  __$$MonitoringImplCopyWithImpl(
      _$MonitoringImpl _value, $Res Function(_$MonitoringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? chickenAge = freezed,
    Object? coopName = freezed,
    Object? period = freezed,
    Object? currentTemperature = freezed,
    Object? averageChickenAge = freezed,
    Object? chickInDate = freezed,
    Object? performance = freezed,
    Object? population = freezed,
    Object? feed = freezed,
  }) {
    return _then(_$MonitoringImpl(
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      chickenAge: freezed == chickenAge
          ? _value.chickenAge
          : chickenAge // ignore: cast_nullable_to_non_nullable
              as int?,
      coopName: freezed == coopName
          ? _value.coopName
          : coopName // ignore: cast_nullable_to_non_nullable
              as String?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int?,
      currentTemperature: freezed == currentTemperature
          ? _value.currentTemperature
          : currentTemperature // ignore: cast_nullable_to_non_nullable
              as int?,
      averageChickenAge: freezed == averageChickenAge
          ? _value.averageChickenAge
          : averageChickenAge // ignore: cast_nullable_to_non_nullable
              as double?,
      chickInDate: freezed == chickInDate
          ? _value.chickInDate
          : chickInDate // ignore: cast_nullable_to_non_nullable
              as String?,
      performance: freezed == performance
          ? _value.performance
          : performance // ignore: cast_nullable_to_non_nullable
              as CoopPerformance?,
      population: freezed == population
          ? _value.population
          : population // ignore: cast_nullable_to_non_nullable
              as Population?,
      feed: freezed == feed
          ? _value.feed
          : feed // ignore: cast_nullable_to_non_nullable
              as Consumption?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$MonitoringImpl implements _Monitoring {
  const _$MonitoringImpl(
      {this.day,
      this.chickenAge,
      this.coopName,
      this.period,
      this.currentTemperature,
      this.averageChickenAge,
      this.chickInDate,
      this.performance,
      this.population,
      this.feed});

  factory _$MonitoringImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonitoringImplFromJson(json);

  @override
  final int? day;
  @override
  final int? chickenAge;
  @override
  final String? coopName;
  @override
  final int? period;
  @override
  final int? currentTemperature;
  @override
  final double? averageChickenAge;
  @override
  final String? chickInDate;
  @override
  final CoopPerformance? performance;
  @override
  final Population? population;
  @override
  final Consumption? feed;

  @override
  String toString() {
    return 'Monitoring(day: $day, chickenAge: $chickenAge, coopName: $coopName, period: $period, currentTemperature: $currentTemperature, averageChickenAge: $averageChickenAge, chickInDate: $chickInDate, performance: $performance, population: $population, feed: $feed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonitoringImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.chickenAge, chickenAge) ||
                other.chickenAge == chickenAge) &&
            (identical(other.coopName, coopName) ||
                other.coopName == coopName) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.currentTemperature, currentTemperature) ||
                other.currentTemperature == currentTemperature) &&
            (identical(other.averageChickenAge, averageChickenAge) ||
                other.averageChickenAge == averageChickenAge) &&
            (identical(other.chickInDate, chickInDate) ||
                other.chickInDate == chickInDate) &&
            (identical(other.performance, performance) ||
                other.performance == performance) &&
            (identical(other.population, population) ||
                other.population == population) &&
            (identical(other.feed, feed) || other.feed == feed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      day,
      chickenAge,
      coopName,
      period,
      currentTemperature,
      averageChickenAge,
      chickInDate,
      performance,
      population,
      feed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonitoringImplCopyWith<_$MonitoringImpl> get copyWith =>
      __$$MonitoringImplCopyWithImpl<_$MonitoringImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonitoringImplToJson(
      this,
    );
  }
}

abstract class _Monitoring implements Monitoring {
  const factory _Monitoring(
      {final int? day,
      final int? chickenAge,
      final String? coopName,
      final int? period,
      final int? currentTemperature,
      final double? averageChickenAge,
      final String? chickInDate,
      final CoopPerformance? performance,
      final Population? population,
      final Consumption? feed}) = _$MonitoringImpl;

  factory _Monitoring.fromJson(Map<String, dynamic> json) =
      _$MonitoringImpl.fromJson;

  @override
  int? get day;
  @override
  int? get chickenAge;
  @override
  String? get coopName;
  @override
  int? get period;
  @override
  int? get currentTemperature;
  @override
  double? get averageChickenAge;
  @override
  String? get chickInDate;
  @override
  CoopPerformance? get performance;
  @override
  Population? get population;
  @override
  Consumption? get feed;
  @override
  @JsonKey(ignore: true)
  _$$MonitoringImplCopyWith<_$MonitoringImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
