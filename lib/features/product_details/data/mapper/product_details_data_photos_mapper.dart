import 'package:shop_avatar/core/extinsion/extinsion.dart';

import '../../domain/model/product_details_data_photos_model.dart';
import '../respose/product_details_data_photos_response.dart';

extension ProductDetailsDataPhotosMapper on ProductDetailsDataPhotosResponse {
  ProductDetailsDataPhotosModel toDomain() {
    return ProductDetailsDataPhotosModel(
      variant: variant.onNull(),
      path: path.onNull(),
    );
  }
}
