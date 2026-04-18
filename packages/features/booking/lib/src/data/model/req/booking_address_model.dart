import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_address_model.freezed.dart';
part 'booking_address_model.g.dart';

@freezed
abstract class BookingAddressModel with _$BookingAddressModel {
  const factory BookingAddressModel({
    required String id,
    required double latitude,
    required double longitude,
    required String name,
  }) = _BookingAddressModel;

  factory BookingAddressModel.fromJson(Map<String, dynamic> json) =>
      _$BookingAddressModelFromJson(json);
}
