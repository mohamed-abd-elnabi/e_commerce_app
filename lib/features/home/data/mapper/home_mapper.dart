import 'package:shop_avatar/core/extinsion/extinsion.dart';
import 'package:shop_avatar/features/home/data/response/home_response.dart';
import 'package:shop_avatar/features/home/presentation/model/home_model.dart';

extension HomeMapper on HomeResponse {
  HomeModel toDomain() {
    return HomeModel(
      data:
          data!.map((homeDataResponse) => homeDataResponse.toDomain()).toList(),
      success: success.onNull(),
      status: status.onNull(),
    );
  }
}

extension DataMapper on DataResponse {
  HomeModelData toDomain() {
    return HomeModelData(
      id: id.onNull(),
      name: name.onNull(),
      photos: photos.onNull(),
      thumbnailImage: thumbnailImage.onNull(),
      basePrice: basePrice.onNull(),
      baseDiscountedPrice: baseDiscountedPrice.onNull(),
      todaysDeal: todaysDeal.onNull(),
      featured: featured.onNull(),
      unit: unit.onNull(),
      discount: discount.onNull(),
      discountType: discountType.onNull(),
      rating: rating.onNull(),
      sales: sales.onNull(),
      links: links!.toDomain(),
    );
  }
}

extension LinksMapper on LinksResponse {
  Links toDomain() {
    return Links(
        details: details.onNull(),
        reviews: reviews.onNull(),
        related: related.onNull());
  }
}
