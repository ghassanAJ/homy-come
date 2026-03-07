import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:orders/src/data/models/res/booking_model_response.dart';

part 'today_schadule_model_response.freezed.dart';
part 'today_schadule_model_response.g.dart';

@freezed
abstract class TodaySchaduleModelResponse with _$TodaySchaduleModelResponse {
  factory TodaySchaduleModelResponse({
    required int id,
    required String time,
    required String address,
    required ProviderModel cleanerInfo,
  }) = _TodaySchaduleModelResponse;

  factory TodaySchaduleModelResponse.fromJson(Map<String, dynamic> json) =>
      _$TodaySchaduleModelResponseFromJson(json);
}
