// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approve_coop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApproveCoop _$ApproveCoopFromJson(Map<String, dynamic> json) {
  return _ApproveCoop.fromJson(json);
}

/// @nodoc
mixin _$ApproveCoop {
  String? get id => throw _privateConstructorUsedError;
  String? get farmingCycleId => throw _privateConstructorUsedError;
  bool? get isApproved => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproveCoopCopyWith<ApproveCoop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproveCoopCopyWith<$Res> {
  factory $ApproveCoopCopyWith(
          ApproveCoop value, $Res Function(ApproveCoop) then) =
      _$ApproveCoopCopyWithImpl<$Res, ApproveCoop>;
  @useResult
  $Res call({String? id, String? farmingCycleId, bool? isApproved});
}

/// @nodoc
class _$ApproveCoopCopyWithImpl<$Res, $Val extends ApproveCoop>
    implements $ApproveCoopCopyWith<$Res> {
  _$ApproveCoopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? farmingCycleId = freezed,
    Object? isApproved = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      farmingCycleId: freezed == farmingCycleId
          ? _value.farmingCycleId
          : farmingCycleId // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApproveCoopImplCopyWith<$Res>
    implements $ApproveCoopCopyWith<$Res> {
  factory _$$ApproveCoopImplCopyWith(
          _$ApproveCoopImpl value, $Res Function(_$ApproveCoopImpl) then) =
      __$$ApproveCoopImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? farmingCycleId, bool? isApproved});
}

/// @nodoc
class __$$ApproveCoopImplCopyWithImpl<$Res>
    extends _$ApproveCoopCopyWithImpl<$Res, _$ApproveCoopImpl>
    implements _$$ApproveCoopImplCopyWith<$Res> {
  __$$ApproveCoopImplCopyWithImpl(
      _$ApproveCoopImpl _value, $Res Function(_$ApproveCoopImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? farmingCycleId = freezed,
    Object? isApproved = freezed,
  }) {
    return _then(_$ApproveCoopImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      farmingCycleId: freezed == farmingCycleId
          ? _value.farmingCycleId
          : farmingCycleId // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$ApproveCoopImpl implements _ApproveCoop {
  const _$ApproveCoopImpl({this.id, this.farmingCycleId, this.isApproved});

  factory _$ApproveCoopImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApproveCoopImplFromJson(json);

  @override
  final String? id;
  @override
  final String? farmingCycleId;
  @override
  final bool? isApproved;

  @override
  String toString() {
    return 'ApproveCoop(id: $id, farmingCycleId: $farmingCycleId, isApproved: $isApproved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveCoopImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.farmingCycleId, farmingCycleId) ||
                other.farmingCycleId == farmingCycleId) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, farmingCycleId, isApproved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveCoopImplCopyWith<_$ApproveCoopImpl> get copyWith =>
      __$$ApproveCoopImplCopyWithImpl<_$ApproveCoopImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApproveCoopImplToJson(
      this,
    );
  }
}

abstract class _ApproveCoop implements ApproveCoop {
  const factory _ApproveCoop(
      {final String? id,
      final String? farmingCycleId,
      final bool? isApproved}) = _$ApproveCoopImpl;

  factory _ApproveCoop.fromJson(Map<String, dynamic> json) =
      _$ApproveCoopImpl.fromJson;

  @override
  String? get id;
  @override
  String? get farmingCycleId;
  @override
  bool? get isApproved;
  @override
  @JsonKey(ignore: true)
  _$$ApproveCoopImplCopyWith<_$ApproveCoopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
