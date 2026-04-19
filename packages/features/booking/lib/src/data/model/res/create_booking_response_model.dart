import 'package:freezed_annotation/freezed_annotation.dart';

import '../req/booking_address_model.dart';

part 'create_booking_response_model.freezed.dart';
part 'create_booking_response_model.g.dart';

@freezed
abstract class CreateBookingResponseModel with _$CreateBookingResponseModel {
  const factory CreateBookingResponseModel({
    @JsonKey(name: 'scheduled_at') required DateTime scheduledAt,
    @JsonKey(name: 'duration_minutes') required int durationMinutes,
    @JsonKey(name: 'final_price') required double finalPrice,
    @JsonKey(name: 'commission_amount') required double commissionAmount,
    @JsonKey(name: 'provider_earning') required double providerEarning,
    required String status,
    required String service,
    @JsonKey(name: 'add_ons') required List<String> addOns,
    required String customer,
    required BookingAddressModel address,
    required List<String> providers,
    @JsonKey(name: 'need_cleaning_materials')
    required bool needCleaningMaterials,
    @JsonKey(name: 'specifc_instructions') String? specificInstructions,
  }) = _CreateBookingResponseModel;

  factory CreateBookingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateBookingResponseModelFromJson(json);
}
