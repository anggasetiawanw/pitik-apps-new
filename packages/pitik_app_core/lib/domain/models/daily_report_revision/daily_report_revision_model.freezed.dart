// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_report_revision_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyReportRevision _$DailyReportRevisionFromJson(Map<String, dynamic> json) {
  return _DailyReportRevision.fromJson(json);
}

/// @nodoc
mixin _$DailyReportRevision {
  String? get reason => throw _privateConstructorUsedError;
  List<String?>? get changes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyReportRevisionCopyWith<DailyReportRevision> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyReportRevisionCopyWith<$Res> {
  factory $DailyReportRevisionCopyWith(
          DailyReportRevision value, $Res Function(DailyReportRevision) then) =
      _$DailyReportRevisionCopyWithImpl<$Res, DailyReportRevision>;
  @useResult
  $Res call({String? reason, List<String?>? changes});
}

/// @nodoc
class _$DailyReportRevisionCopyWithImpl<$Res, $Val extends DailyReportRevision>
    implements $DailyReportRevisionCopyWith<$Res> {
  _$DailyReportRevisionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = freezed,
    Object? changes = freezed,
  }) {
    return _then(_value.copyWith(
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      changes: freezed == changes
          ? _value.changes
          : changes // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyReportRevisionImplCopyWith<$Res>
    implements $DailyReportRevisionCopyWith<$Res> {
  factory _$$DailyReportRevisionImplCopyWith(_$DailyReportRevisionImpl value,
          $Res Function(_$DailyReportRevisionImpl) then) =
      __$$DailyReportRevisionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? reason, List<String?>? changes});
}

/// @nodoc
class __$$DailyReportRevisionImplCopyWithImpl<$Res>
    extends _$DailyReportRevisionCopyWithImpl<$Res, _$DailyReportRevisionImpl>
    implements _$$DailyReportRevisionImplCopyWith<$Res> {
  __$$DailyReportRevisionImplCopyWithImpl(_$DailyReportRevisionImpl _value,
      $Res Function(_$DailyReportRevisionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = freezed,
    Object? changes = freezed,
  }) {
    return _then(_$DailyReportRevisionImpl(
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      changes: freezed == changes
          ? _value._changes
          : changes // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$DailyReportRevisionImpl implements _DailyReportRevision {
  const _$DailyReportRevisionImpl({this.reason, final List<String?>? changes})
      : _changes = changes;

  factory _$DailyReportRevisionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyReportRevisionImplFromJson(json);

  @override
  final String? reason;
  final List<String?>? _changes;
  @override
  List<String?>? get changes {
    final value = _changes;
    if (value == null) return null;
    if (_changes is EqualUnmodifiableListView) return _changes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DailyReportRevision(reason: $reason, changes: $changes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyReportRevisionImpl &&
            (identical(other.reason, reason) || other.reason == reason) &&
            const DeepCollectionEquality().equals(other._changes, _changes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, reason, const DeepCollectionEquality().hash(_changes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyReportRevisionImplCopyWith<_$DailyReportRevisionImpl> get copyWith =>
      __$$DailyReportRevisionImplCopyWithImpl<_$DailyReportRevisionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyReportRevisionImplToJson(
      this,
    );
  }
}

abstract class _DailyReportRevision implements DailyReportRevision {
  const factory _DailyReportRevision(
      {final String? reason,
      final List<String?>? changes}) = _$DailyReportRevisionImpl;

  factory _DailyReportRevision.fromJson(Map<String, dynamic> json) =
      _$DailyReportRevisionImpl.fromJson;

  @override
  String? get reason;
  @override
  List<String?>? get changes;
  @override
  @JsonKey(ignore: true)
  _$$DailyReportRevisionImplCopyWith<_$DailyReportRevisionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
