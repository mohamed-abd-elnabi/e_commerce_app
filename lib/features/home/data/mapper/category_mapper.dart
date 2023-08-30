import 'package:shop_avatar/core/extinsion/extinsion.dart';
import 'package:shop_avatar/features/home/data/response/category_response.dart';
import 'package:shop_avatar/features/home/presentation/model/category_model.dart';

extension CategoryMapper on CategoryResponse {
  CategoryModel toDomain() {
    return CategoryModel(
      id: id.onNull(),
      name: name.onNull(),
      banner: banner.onNull(),
      icon: icon.onNull(),
      numberOfChildren: numberOfChildren.onNull(),
      links: links!.toDomain(),
    );
  }
}

extension LinksMapper on CategoryResponseLinks {
  CategoryModelLinks toDomain() {
    return CategoryModelLinks(
        products: products.onNull(), subCategories: subCategories.onNull());
  }
}
