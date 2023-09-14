import 'package:dio/dio.dart';
import '../../../features/product_details/data/respose/product_details_response.dart';
import '../../constants.dart';
import 'package:retrofit/retrofit.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: ApiRequest.baseUrl)
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;
  @GET(ApiRequest.productDetails)
  Future<ProductDetailsResponse> productDetails();
}
