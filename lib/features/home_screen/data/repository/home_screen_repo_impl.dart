import 'package:bn_website/features/home_screen/data/models/categoty_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure_class.dart';
import '../../domain/entity/product_entity.dart';
import '../../domain/repository/home_screen_repo.dart';
import '../data_source/home_screen_data_source.dart';

class HomeScreenRepoImpl implements HomeScreenRepo {
  final HomeScreenDataSource remoteDataSource;

  HomeScreenRepoImpl({required this.remoteDataSource});


  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async{
    try {
      final homeScreenData = await remoteDataSource.getCategories();
      return Right(homeScreenData);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }





  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final homeScreenData = await remoteDataSource.getProducts();
      return Right(homeScreenData);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getSpecialProducts() async{
    try {
      final homeScreenData = await remoteDataSource.getSpecialProducts();
      return Right(homeScreenData);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory({required String category}) async{
    try {
      final homeScreenData = await remoteDataSource.getProductsByCategory(category: category);
      return Right(homeScreenData);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> searchProducts({required String query}) async{
    try {
      final homeScreenData = await remoteDataSource.searchProducts(query: query);
      return Right(homeScreenData);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }


}