// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      level: json['level'] as int?,
      roomCode: json['roomCode'] as String?,
      roomType: json['roomType'] == null
          ? null
          : Coop.fromJson(json['roomType'] as Map<String, dynamic>),
      building: json['building'] == null
          ? null
          : Coop.fromJson(json['building'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RoomImplToJson(_$RoomImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'level': instance.level,
      'roomCode': instance.roomCode,
      'roomType': instance.roomType,
      'building': instance.building,
    };
