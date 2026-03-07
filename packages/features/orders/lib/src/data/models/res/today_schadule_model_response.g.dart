// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_schadule_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodaySchaduleModelResponse _$TodaySchaduleModelResponseFromJson(
  Map<String, dynamic> json,
) => _TodaySchaduleModelResponse(
  id: (json['id'] as num).toInt(),
  time: json['time'] as String,
  address: json['address'] as String,
  cleanerInfo: ProviderModel.fromJson(
    json['cleanerInfo'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$TodaySchaduleModelResponseToJson(
  _TodaySchaduleModelResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'time': instance.time,
  'address': instance.address,
  'cleanerInfo': instance.cleanerInfo,
};
