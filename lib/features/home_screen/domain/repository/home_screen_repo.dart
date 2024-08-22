import 'package:bn_website/features/home_screen/data/models/categoty_model.dart';
import 'package:bn_website/features/home_screen/domain/entity/product_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure_class.dart';

abstract class HomeScreenRepo{
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getSpecialProducts();
  Future<Either<Failure, List<CategoryModel>>> getCategories();
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory({required String category});
  Future<Either<Failure, List<ProductEntity>>> searchProducts({required String query});
}