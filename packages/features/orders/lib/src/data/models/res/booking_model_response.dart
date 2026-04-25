import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_model_response.freezed.dart';
part 'booking_model_response.g.dart';

@freezed
abstract class BookingModelResponse with _$BookingModelResponse {
  factory BookingModelResponse({
    required int id,
    @JsonKey(name: 'service_type') required String serviceType,
    required OrderStatus status,
    required ProviderModel provider,
    required String date,
    required String time,
    required String address,
  }) = _BookingModelResponse;

  factory BookingModelResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingModelResponseFromJson(json);
}

@freezed
abstract class ProviderModel with _$ProviderModel {
  const factory ProviderModel({
    required int id,
    required String name,
    required double rating,
    required String numberPhone,
    String? image,
  }) = _ProviderModel;

  factory ProviderModel.fromJson(Map<String, dynamic> json) =>
      _$ProviderModelFromJson(json);
}

@freezed
abstract class BookingDetailseModelResponse
    with _$BookingDetailseModelResponse {
  const factory BookingDetailseModelResponse({
    required int id,
    @JsonKey(name: 'service_type') required String serviceType,
    required String status,
    required ProviderModel provider,
    required String date,
    required String time,
    required String address,
    required int workingHour,
    required int servicesCharge,
    required int deepCleaning,
  }) = _BookingDetailseModelResponse;

  factory BookingDetailseModelResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingDetailseModelResponseFromJson(json);
}

enum OrderStatus { draft, canceled, completed, scheduled, inProgress }
