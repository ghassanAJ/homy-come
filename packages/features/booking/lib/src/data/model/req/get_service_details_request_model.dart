import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_service_details_request_model.freezed.dart';
part 'get_service_details_request_model.g.dart';

@freezed
abstract class GetServiceDetailsRequestModel
    with _$GetServiceDetailsRequestModel {
  const factory GetServiceDetailsRequestModel({
    required String serviceId,
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'location_id') String? locationId,
  }) = _GetServiceDetailsRequestModel;

  factory GetServiceDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GetServiceDetailsRequestModelFromJson(json);
}

extension GetServiceDetailsRequestModelX on GetServiceDetailsRequestModel {
  Map<String, dynamic> toQueryParameters() {
    final json = toJson();
    json.remove('serviceId');
    json.removeWhere((key, value) => value == null || value.toString().isEmpty);
    return json;
  }
}
