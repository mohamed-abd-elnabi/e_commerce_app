import 'package:shop_avatar/core/extinsion/extinsion.dart';

import '../../domain/model/product_details_data_photos_model.dart';
import '../respose/product_details_data_photos_response.dart';

extension ProductDetailsDataPhotoMapper on ProductDetailsDataPhotoResponse {
  ProductDetailsDataPhotoModel toDomain() {
    return ProductDetailsDataPhotoModel(
      variant: variant.onNull(),
      path: path.onNull(),
    );
  }
}
