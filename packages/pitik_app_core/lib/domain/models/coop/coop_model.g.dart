// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoopImpl _$$CoopImplFromJson(Map<String, dynamic> json) => _$CoopImpl(
      id: json['id'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      name: json['name'] as String?,
      status: json['status'],
      coopId: json['coopId'] as String?,
      coopCode: json['coopCode'] as String?,
      coopName: json['coopName'] as String?,
      coopType: json['coopType'] as String?,
      coopStatus: json['coopStatus'] as String?,
      farmId: json['farmId'] as String?,
      farmCode: json['farmCode'] as String?,
      chickInRequestId: json['chickInRequestId'] as String?,
      farmingCycleId: json['farmingCycleId'] as String?,
      farmName: json['farmName'] as String?,
      coopDistrict: json['coopDistrict'] as String?,
      coopCity: json['coopCity'] as String?,
      period: json['period'] as int?,
      isNew: json['isNew'] as bool?,
      startDate: json['startDate'] as String?,
      closedDate: json['closedDate'] as String?,
      hasChickInRequest: json['hasChickInRequest'] as bool?,
      day: json['day'] as int?,
      statusText: json['statusText'] as String?,
      isActionNeeded: json['isActionNeeded'] as bool?,
      isOwnFarm: json['isOwnFarm'] as bool?,
      week: json['week'] as int?,
      farmCategory: json['farmCategory'] as String?,
      bw: json['bw'] == null
          ? null
          : CoopActiveStandard.fromJson(json['bw'] as Map<String, dynamic>),
      ip: json['ip'] == null
          ? null
          : CoopActiveStandard.fromJson(json['ip'] as Map<String, dynamic>),
      hdp: json['hdp'] == null
          ? null
          : CoopActiveStandard.fromJson(json['hdp'] as Map<String, dynamic>),
      feedIntake: json['feedIntake'] == null
          ? null
          : CoopActiveStandard.fromJson(
              json['feedIntake'] as Map<String, dynamic>),
      chickInRequest: json['chickInRequest'] == null
          ? null
          : ApproveCoop.fromJson(
              json['chickInRequest'] as Map<String, dynamic>),
      purchaseRequestOvk: json['purchaseRequestOvk'] == null
          ? null
          : ApproveCoop.fromJson(
              json['purchaseRequestOvk'] as Map<String, dynamic>),
      branch: json['branch'] == null ? null : Branch.fromJson(json['branch']),
      room: json['room'] == null
          ? null
          : Room.fromJson(json['room'] as Map<String, dynamic>),
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Room.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CoopImplToJson(_$CoopImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('name', instance.name);
  writeNotNull('status', instance.status);
  writeNotNull('coopId', instance.coopId);
  writeNotNull('coopCode', instance.coopCode);
  writeNotNull('coopName', instance.coopName);
  writeNotNull('coopType', instance.coopType);
  writeNotNull('coopStatus', instance.coopStatus);
  writeNotNull('farmId', instance.farmId);
  writeNotNull('farmCode', instance.farmCode);
  writeNotNull('chickInRequestId', instance.chickInRequestId);
  writeNotNull('farmingCycleId', instance.farmingCycleId);
  writeNotNull('farmName', instance.farmName);
  writeNotNull('coopDistrict', instance.coopDistrict);
  writeNotNull('coopCity', instance.coopCity);
  writeNotNull('period', instance.period);
  writeNotNull('isNew', instance.isNew);
  writeNotNull('startDate', instance.startDate);
  writeNotNull('closedDate', instance.closedDate);
  writeNotNull('hasChickInRequest', instance.hasChickInRequest);
  writeNotNull('day', instance.day);
  writeNotNull('statusText', instance.statusText);
  writeNotNull('isActionNeeded', instance.isActionNeeded);
  writeNotNull('isOwnFarm', instance.isOwnFarm);
  writeNotNull('week', instance.week);
  writeNotNull('farmCategory', instance.farmCategory);
  writeNotNull('bw', instance.bw);
  writeNotNull('ip', instance.ip);
  writeNotNull('hdp', instance.hdp);
  writeNotNull('feedIntake', instance.feedIntake);
  writeNotNull('chickInRequest', instance.chickInRequest);
  writeNotNull('purchaseRequestOvk', instance.purchaseRequestOvk);
  writeNotNull('branch', instance.branch);
  writeNotNull('room', instance.room);
  writeNotNull('rooms', instance.rooms);
  return val;
}
