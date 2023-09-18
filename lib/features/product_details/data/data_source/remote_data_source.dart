import 'package:shop_avatar/core/network/api/app_api.dart';
import '../request/product_details_request.dart';
import '../respose/product_details_response.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<ProductDetailsResponse> getProductDetails(
    ProductDetailsRequest request,
  );
}

class ProductDetailsRemoteDataSourceImplementation
    implements ProductDetailsRemoteDataSource {
  final AppApi _appApi;

  ProductDetailsRemoteDataSourceImplementation(this._appApi);

  @override
  Future<ProductDetailsResponse> getProductDetails(
    ProductDetailsRequest request,
  ) async {
    return await _appApi.productDetails(request.id);
  }
}
