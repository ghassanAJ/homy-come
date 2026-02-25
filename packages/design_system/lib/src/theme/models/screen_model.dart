import 'package:json_annotation/json_annotation.dart';

part 'screen_model.g.dart';

/// Model for screen sizes from design tokens
@JsonSerializable()
class ScreenSize {
  /// Minimum width of the screen in pixels
  final int minWidth;
  
  /// Maximum width of the screen in pixels
  final int maxWidth;

  /// Creates a ScreenSize
  ScreenSize({
    required this.minWidth,
    required this.maxWidth,
  });

  /// Converts JSON to ScreenSize
  factory ScreenSize.fromJson(Map<String, dynamic> json) => 
      _$ScreenSizeFromJson(json);

  /// Converts ScreenSize to JSON
  Map<String, dynamic> toJson() => _$ScreenSizeToJson(this);
  
  /// Checks if a width is within this screen size range
  bool isInRange(double width) => 
      width >= minWidth && width <= maxWidth;
}
