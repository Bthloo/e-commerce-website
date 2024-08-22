

import 'package:bn_website/core/firebase/my_database.dart';
import 'package:flutter/cupertino.dart';

import '../models/ProductModel.dart';
import '../models/categoty_model.dart';

class HomeScreenDataSource{
 // List<ProductModel> products = [];
  List<ProductModel> specialProducts = [];
  List<CategoryModel> categories = [];


  getCategories() async {
    var request = await MyDatabase.getCategoriesCollection().get();

    for (var element in request.docs) {
      categories.add(element.data());
    }
    return categories;
  }


  getProductsByCategory({required String category}) async {
    List<ProductModel> products = [];
    var request = await MyDatabase.getProductsByCategoryCollection(category: category).get();
    for (var element in request.docs) {
      products.add(element.data());
    }
    return products;
  }

  getProducts() async {
    List<ProductModel> products = [];
   var request = await MyDatabase.getProductsCollection().get();
    for (var element in request.docs) {
      products.add(element.data());
    }
    return products;
  }

  getSpecialProducts() async {
    var request = await MyDatabase.getSpecialCollection().get();

    for (var element in request.docs) {
     var getProductBuUrl = await MyDatabase.getProductsByURL(path: element.data().path!);
      specialProducts.add( getProductBuUrl!);
    }
    return specialProducts;
  }

searchProducts({required String query}) async {
    List<ProductModel> products = [];
    var request = await MyDatabase.searchProduct(searchQuery: query).get();
    for (var element in request.docs) {
      products.add(element.data());
      debugPrint('searchProducts data source: ${element.data().name}');
    }
    return products;
  }

}