import 'dart:convert';

import 'package:bn_website/core/firebase/my_database.dart';
import 'package:bn_website/core/json/Modellll.dart';
import 'package:flutter/services.dart';

import '../models/ProductModel.dart';

class HomeScreenDataSource{
  List<ProductModel> products = [];
  getProducts() async {
   var request = await MyDatabase.getProductsCollection().get();
    for (var element in request.docs) {
      products.add(element.data());
    }
    return products;
  }
}