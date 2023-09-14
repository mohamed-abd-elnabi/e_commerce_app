import 'package:shop_avatar/core/extinsion/extinsion.dart';
import 'package:shop_avatar/features/product_details/data/mapper/product_details_data_mapper.dart';
import 'package:shop_avatar/features/product_details/data/respose/product_details_response.dart';
import '../../domain/model/product_details_model.dart';

extension ProductDetailsMapper on ProductDetailsResponse {
  ProductDetailsModel toDomain() {
    return ProductDetailsModel(
      status: status.onNull(),
      success: success.onNull(),
      data: data!.map((e) => e.toDomain()).toList(),
    );
  }
}
