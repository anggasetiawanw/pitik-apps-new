// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Room _$RoomFromJson(Map<String, dynamic> json) {
  return _Room.fromJson(json);
}

/// @nodoc
mixin _$Room {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get level => throw _privateConstructorUsedError;
  String? get roomCode =>
      throw _privateConstructorUsedError; // List<Device?> devices,
  Coop? get roomType => throw _privateConstructorUsedError;
  Coop? get building => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomCopyWith<Room> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomCopyWith<$Res> {
  factory $RoomCopyWith(Room value, $Res Function(Room) then) =
      _$RoomCopyWithImpl<$Res, Room>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? status,
      int? level,
      String? roomCode,
      Coop? roomType,
      Coop? building});

  $CoopCopyWith<$Res>? get roomType;
  $CoopCopyWith<$Res>? get building;
}

/// @nodoc
class _$RoomCopyWithImpl<$Res, $Val extends Room>
    implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? level = freezed,
    Object? roomCode = freezed,
    Object? roomType = freezed,
    Object? building = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      roomCode: freezed == roomCode
          ? _value.roomCode
          : roomCode // ignore: cast_nullable_to_non_nullable
              as String?,
      roomType: freezed == roomType
          ? _value.roomType
          : roomType // ignore: cast_nullable_to_non_nullable
              as Coop?,
      building: freezed == building
          ? _value.building
          : building // ignore: cast_nullable_to_non_nullable
              as Coop?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CoopCopyWith<$Res>? get roomType {
    if (_value.roomType == null) {
      return null;
    }

    return $CoopCopyWith<$Res>(_value.roomType!, (value) {
      return _then(_value.copyWith(roomType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CoopCopyWith<$Res>? get building {
    if (_value.building == null) {
      return null;
    }

    return $CoopCopyWith<$Res>(_value.building!, (value) {
      return _then(_value.copyWith(building: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoomImplCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$$RoomImplCopyWith(
          _$RoomImpl value, $Res Function(_$RoomImpl) then) =
      __$$RoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? status,
      int? level,
      String? roomCode,
      Coop? roomType,
      Coop? building});

  @override
  $CoopCopyWith<$Res>? get roomType;
  @override
  $CoopCopyWith<$Res>? get building;
}

/// @nodoc
class __$$RoomImplCopyWithImpl<$Res>
    extends _$RoomCopyWithImpl<$Res, _$RoomImpl>
    implements _$$RoomImplCopyWith<$Res> {
  __$$RoomImplCopyWithImpl(_$RoomImpl _value, $Res Function(_$RoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? level = freezed,
    Object? roomCode = freezed,
    Object? roomType = freezed,
    Object? building = freezed,
  }) {
    return _then(_$RoomImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      roomCode: freezed == roomCode
          ? _value.roomCode
          : roomCode // ignore: cast_nullable_to_non_nullable
              as String?,
      roomType: freezed == roomType
          ? _value.roomType
          : roomType // ignore: cast_nullable_to_non_nullable
              as Coop?,
      building: freezed == building
          ? _value.building
          : building // ignore: cast_nullable_to_non_nullable
              as Coop?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomImpl implements _Room {
  const _$RoomImpl(
      {this.id,
      this.name,
      this.status,
      this.level,
      this.roomCode,
      this.roomType,
      this.building});

  factory _$RoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? status;
  @override
  final int? level;
  @override
  final String? roomCode;
// List<Device?> devices,
  @override
  final Coop? roomType;
  @override
  final Coop? building;

  @override
  String toString() {
    return 'Room(id: $id, name: $name, status: $status, level: $level, roomCode: $roomCode, roomType: $roomType, building: $building)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.roomCode, roomCode) ||
                other.roomCode == roomCode) &&
            (identical(other.roomType, roomType) ||
                other.roomType == roomType) &&
            (identical(other.building, building) ||
                other.building == building));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, status, level, roomCode, roomType, building);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      __$$RoomImplCopyWithImpl<_$RoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomImplToJson(
      this,
    );
  }
}

abstract class _Room implements Room {
  const factory _Room(
      {final String? id,
      final String? name,
      final String? status,
      final int? level,
      final String? roomCode,
      final Coop? roomType,
      final Coop? building}) = _$RoomImpl;

  factory _Room.fromJson(Map<String, dynamic> json) = _$RoomImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get status;
  @override
  int? get level;
  @override
  String? get roomCode;
  @override // List<Device?> devices,
  Coop? get roomType;
  @override
  Coop? get building;
  @override
  @JsonKey(ignore: true)
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
