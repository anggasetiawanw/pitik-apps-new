// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mortality_reason_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MortalityReasonImpl _$$MortalityReasonImplFromJson(
        Map<String, dynamic> json) =>
    _$MortalityReasonImpl(
      quantity: json['quantity'] as int?,
      cause: json['cause'] as String?,
    );

Map<String, dynamic> _$$MortalityReasonImplToJson(
    _$MortalityReasonImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('quantity', instance.quantity);
  writeNotNull('cause', instance.cause);
  return val;
}
