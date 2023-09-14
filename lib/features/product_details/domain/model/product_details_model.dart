import 'package:shop_avatar/features/product_details/domain/model/product_details_data_model.dart';

class ProductDetailsModel {
  int status;
  String success;
  List<ProductDetailsDataModel> data;

  ProductDetailsModel({
    required this.status,
    required this.success,
    required this.data,
  });
}
