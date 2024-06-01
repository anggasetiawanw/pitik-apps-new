import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pitik_app_core/domain/models/coop/coop_model.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class Room with _$Room {
  const factory Room({
    String? id,
    String? name,
    String? status,
    int? level,
    String? roomCode,
    // List<Device?> devices,
    Coop? roomType,
    Coop? building,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
