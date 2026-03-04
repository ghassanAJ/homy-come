import 'package:profile/src/data/model/res/driver_performance_metric_model.dart';

class DriverPerformanceModel {
  const DriverPerformanceModel({
    required this.ordersCount,
    required this.metrics,
  });

  final int ordersCount;
  final List<DriverPerformanceMetricModel> metrics;

  static const empty = DriverPerformanceModel(ordersCount: 0, metrics: []);

  factory DriverPerformanceModel.fromJson(Map<String, dynamic> json) {
    final metricsJson = json['metrics'] as List<dynamic>? ?? [];

    return DriverPerformanceModel(
      ordersCount:
          (json['orders_count'] as num?)?.toInt() ??
          (json['ordersCount'] as num?)?.toInt() ??
          0,
      metrics:
          metricsJson
              .whereType<Map<String, dynamic>>()
              .map(DriverPerformanceMetricModel.fromJson)
              .toList(growable: false),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orders_count': ordersCount,
      'metrics': metrics.map((metric) => metric.toJson()).toList(),
    };
  }
}
