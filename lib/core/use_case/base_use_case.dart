import 'package:dartz/dartz.dart';
import 'package:shop_avatar/core/erorr_handler/erorr_handler.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
