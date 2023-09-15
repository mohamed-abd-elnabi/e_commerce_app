import 'package:dartz/dartz.dart';
import 'package:shop_avatar/core/erorr_handler/erorr_handler.dart';
import 'package:shop_avatar/core/use_case/base_use_case.dart';
import 'package:shop_avatar/features/product_details/data/request/product_details_request.dart';
import 'package:shop_avatar/features/product_details/domain/model/product_details_model.dart';
import 'package:shop_avatar/features/product_details/domain/repository/product_details_repository.dart';

class ProductDetailsUesCaseInput {
  int id;

  ProductDetailsUesCaseInput({required this.id});
}

class ProductDetailsUesCaseImplementation
    implements BaseUseCase<ProductDetailsUesCaseInput, ProductDetailsModel> {
  final ProductDetailsRepository _repository;

  ProductDetailsUesCaseImplementation(this._repository);

  @override
  Future<Either<Failure, ProductDetailsModel>> execute(
      ProductDetailsUesCaseInput input) async {
    return await _repository.getProductDetails(
      ProductDetailsRequest(id: input.id),
    );
  }
}
