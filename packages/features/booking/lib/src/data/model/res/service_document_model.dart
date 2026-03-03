import 'package:booking/src/data/model/res/info_model.dart';
import 'package:booking/src/data/model/res/service_detail_item_model.dart';
import 'package:booking/src/data/model/res/service_price_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_document_model.freezed.dart';
part 'service_document_model.g.dart';

@freezed
abstract class AddOnServiceModel with _$AddOnServiceModel {
  const factory AddOnServiceModel({
    required String id,
    required String documentId,
    @JsonKey(name: 'duration_minutes') required int durationMinutes,
    required InfoModel info,
    required ServicePriceModel price,
    @Default([]) List<ServiceDetailsModel> details,
  }) = _ServiceDocumentModel;

  factory AddOnServiceModel.fromJson(Map<String, dynamic> json) =>
      _$AddOnServiceModelFromJson(json);
}
