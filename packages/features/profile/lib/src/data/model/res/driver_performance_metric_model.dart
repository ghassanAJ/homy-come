// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_performance_metric_model.freezed.dart';
part 'driver_performance_metric_model.g.dart';

enum DriverPerformanceMetricType {
  completed,
  canceledOrder,
  punctuality,
  customerSatisfaction,
}

@freezed
abstract class DriverPerformanceMetricModel with _$DriverPerformanceMetricModel {
  const factory DriverPerformanceMetricModel({
    @JsonKey(unknownEnumValue: DriverPerformanceMetricType.completed)
    @Default(DriverPerformanceMetricType.completed)
    DriverPerformanceMetricType type,
    @Default(0) int percentage,
    @JsonKey(name: 'donut_ratio') @Default(0) double donutRatio,
  }) = _DriverPerformanceMetricModel;

  factory DriverPerformanceMetricModel.fromJson(Map<String, dynamic> json) =>
      _$DriverPerformanceMetricModelFromJson(json);
}
