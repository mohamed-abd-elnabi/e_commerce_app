import 'package:shop_avatar/core/extinsion/extinsion.dart';

import '../../domain/model/product_detail_choice_options_model.dart';
import '../respose/product_detail_choice_options_response.dart';

extension ProductDetailsDataChoiceOptionsMapper
    on ProductDetailsDataChoiceOptionsResponse {
  ProductDetailsDataChoiceOptionsModel toDomain() {
    return ProductDetailsDataChoiceOptionsModel(
        name: name.onNull(), options: options.onNull(), title: title.onNull());
  }
}
