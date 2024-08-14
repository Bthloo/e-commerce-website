import 'package:bn_website/features/home_screen/domain/entity/product_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure_class.dart';

abstract class HomeScreenRepo{
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}