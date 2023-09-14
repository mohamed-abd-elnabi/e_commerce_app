import 'package:json_annotation/json_annotation.dart';
part 'product_details_brand_response.g.dart';

@JsonSerializable()
class ProductDetailsBrandResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'logo')
  String? logo;

  ProductDetailsBrandResponse({this.id, this.name, this.logo});
  factory ProductDetailsBrandResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsBrandResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsBrandResponseToJson(this);
}
