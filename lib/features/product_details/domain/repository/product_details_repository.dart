import 'package:dartz/dartz.dart';
import 'package:shop_avatar/core/erorr_handler/erorr_handler.dart';
import 'package:shop_avatar/core/internet_checker/internet_checker.dart';
import 'package:shop_avatar/features/product_details/data/mapper/product_details_mapper.dart';
import 'package:shop_avatar/features/product_details/data/request/product_details_request.dart';
import 'package:shop_avatar/features/product_details/domain/model/product_details_model.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../data/data_source/remote_data_source.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, ProductDetailsModel>> getProductDetails(
    ProductDetailsRequest request,
  );
}

class ProductDetailsRepositoryImplementation
    implements ProductDetailsRepository {
  final ProductDetailsRemoteDataSource data;
  final NetworkInfo networkInfo;

  ProductDetailsRepositoryImplementation({
    required this.data,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ProductDetailsModel>> getProductDetails(
    ProductDetailsRequest request,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await data.getProductDetails(request);
        return Right(
          response.toDomain(),
        );
      } catch (e) {
        return Left(
          ErrorHandler.handle(e).failure,
        );
      }
    } else {
      return Left(
        Failure(
          code: 400,
          message: ManagerStrings.error,
        ),
      );
    }
  }
}
