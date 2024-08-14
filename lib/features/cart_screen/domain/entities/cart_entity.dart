import 'package:bn_website/features/home_screen/data/models/ProductModel.dart';

class CartEntity{
  List<ProductModel>? products;
  String? userName;
  String? userPhone;
  String? userAddress;
  num? productsPrice;
  num? totalPrice;
  CartEntity({
    required this.products,
    required this.userName,
    required this.userPhone,
    required this.userAddress,
    required this.productsPrice,
    required this.totalPrice,
  });
}