enum DriverPerformanceMetricType {
  completed,
  canceledOrder,
  punctuality,
  customerSatisfaction;

  static DriverPerformanceMetricType fromValue(String? rawValue) {
    return DriverPerformanceMetricType.values.firstWhere(
      (type) => type.name == rawValue,
      orElse: () => DriverPerformanceMetricType.completed,
    );
  }
}

class DriverPerformanceMetricModel {
  const DriverPerformanceMetricModel({
    required this.type,
    required this.percentage,
    required this.donutRatio,
  });

  final DriverPerformanceMetricType type;
  final int percentage;
  final double donutRatio;

  factory DriverPerformanceMetricModel.fromJson(Map<String, dynamic> json) {
    return DriverPerformanceMetricModel(
      type: DriverPerformanceMetricType.fromValue(json['type'] as String?),
      percentage: (json['percentage'] as num?)?.toInt() ?? 0,
      donutRatio: (json['donut_ratio'] as num?)?.toDouble() ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'percentage': percentage,
      'donut_ratio': donutRatio,
    };
  }
}
