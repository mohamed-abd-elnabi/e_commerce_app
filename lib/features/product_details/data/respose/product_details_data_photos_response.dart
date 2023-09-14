import 'package:json_annotation/json_annotation.dart';
part 'product_details_data_photos_response.g.dart';

@JsonSerializable()
class ProductDetailsDataPhotosResponse {
  @JsonKey(name: 'variant')
  String? variant;
  @JsonKey(name: 'path')
  String? path;

  ProductDetailsDataPhotosResponse({this.variant, this.path});
  factory ProductDetailsDataPhotosResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ProductDetailsDataPhotosResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProductDetailsDataPhotosResponseToJson(this);
}
