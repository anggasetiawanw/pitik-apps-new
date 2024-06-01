// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_coop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApproveCoopImpl _$$ApproveCoopImplFromJson(Map<String, dynamic> json) =>
    _$ApproveCoopImpl(
      id: json['id'] as String?,
      farmingCycleId: json['farmingCycleId'] as String?,
      isApproved: json['isApproved'] as bool?,
    );

Map<String, dynamic> _$$ApproveCoopImplToJson(_$ApproveCoopImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('farmingCycleId', instance.farmingCycleId);
  writeNotNull('isApproved', instance.isApproved);
  return val;
}
