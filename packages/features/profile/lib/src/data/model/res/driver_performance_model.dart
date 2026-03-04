// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:profile/src/data/model/res/driver_performance_metric_model.dart';

part 'driver_performance_model.freezed.dart';
part 'driver_performance_model.g.dart';

List<DriverPerformanceMetricModel> _driverPerformanceMetricsFromJson(
  Object? json,
) {
  final metricsJson = (json as List<dynamic>? ?? []);
  return metricsJson
      .whereType<Map<String, dynamic>>()
      .map(DriverPerformanceMetricModel.fromJson)
      .toList(growable: false);
}

List<Map<String, dynamic>> _driverPerformanceMetricsToJson(
  List<DriverPerformanceMetricModel> metrics,
) {
  return metrics.map((metric) => metric.toJson()).toList(growable: false);
}

@freezed
abstract class DriverPerformanceModel with _$DriverPerformanceModel {
  @JsonSerializable(explicitToJson: true)
  const factory DriverPerformanceModel({
    @JsonKey(name: 'orders_count') @Default(0) int ordersCount,
    @JsonKey(
      fromJson: _driverPerformanceMetricsFromJson,
      toJson: _driverPerformanceMetricsToJson,
    )
    @Default(<DriverPerformanceMetricModel>[])
    List<DriverPerformanceMetricModel> metrics,
  }) = _DriverPerformanceModel;

  factory DriverPerformanceModel.fromJson(Map<String, dynamic> json) {
    final normalizedJson = Map<String, dynamic>.from(json);
    normalizedJson['orders_count'] ??= json['ordersCount'];
    return _$DriverPerformanceModelFromJson(normalizedJson);
  }

  static const empty = DriverPerformanceModel();
}
