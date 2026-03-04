// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_performance_metric_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DriverPerformanceMetricModel _$DriverPerformanceMetricModelFromJson(
  Map<String, dynamic> json,
) => _DriverPerformanceMetricModel(
  type:
      $enumDecodeNullable(
        _$DriverPerformanceMetricTypeEnumMap,
        json['type'],
        unknownValue: DriverPerformanceMetricType.completed,
      ) ??
      DriverPerformanceMetricType.completed,
  percentage: (json['percentage'] as num?)?.toInt() ?? 0,
  donutRatio: (json['donut_ratio'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$DriverPerformanceMetricModelToJson(
  _DriverPerformanceMetricModel instance,
) => <String, dynamic>{
  'type': _$DriverPerformanceMetricTypeEnumMap[instance.type]!,
  'percentage': instance.percentage,
  'donut_ratio': instance.donutRatio,
};

const _$DriverPerformanceMetricTypeEnumMap = {
  DriverPerformanceMetricType.completed: 'completed',
  DriverPerformanceMetricType.canceledOrder: 'canceledOrder',
  DriverPerformanceMetricType.punctuality: 'punctuality',
  DriverPerformanceMetricType.customerSatisfaction: 'customerSatisfaction',
};
