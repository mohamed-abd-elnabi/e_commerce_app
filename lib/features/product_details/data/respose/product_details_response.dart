import 'package:json_annotation/json_annotation.dart';
import 'package:shop_avatar/features/product_details/data/respose/product_details_data_response.dart';
part 'product_details_response.g.dart';

@JsonSerializable()
class ProductDetailsResponse {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'data')
  List<ProductDetailsDataResponse>? data;

  ProductDetailsResponse({this.status, this.success, this.data});

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsResponseToJson(this);
}
