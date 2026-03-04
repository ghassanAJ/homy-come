// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_performance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DriverPerformanceModel _$DriverPerformanceModelFromJson(
  Map<String, dynamic> json,
) => _DriverPerformanceModel(
  ordersCount: (json['orders_count'] as num?)?.toInt() ?? 0,
  metrics:
      json['metrics'] == null
          ? const <DriverPerformanceMetricModel>[]
          : _driverPerformanceMetricsFromJson(json['metrics']),
);

Map<String, dynamic> _$DriverPerformanceModelToJson(
  _DriverPerformanceModel instance,
) => <String, dynamic>{
  'orders_count': instance.ordersCount,
  'metrics': _driverPerformanceMetricsToJson(instance.metrics),
};
