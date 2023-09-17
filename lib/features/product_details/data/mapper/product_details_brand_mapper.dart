import 'package:shop_avatar/core/extinsion/extinsion.dart';

import '../../domain/model/product_details_brand_model.dart';
import '../respose/product_details_brand_response.dart';

extension ProductDetailsBrandMapper on ProductDetailsBrandResponse {
  ProductDetailsBrandModel toDomain() {
    return ProductDetailsBrandModel(
      id: id.onNull(),
      name: name.onNull(),
      logo: logo.onNull(),
    );
  }
}
