import '../../../home_screen/data/models/ProductModel.dart';
import '../../../home_screen/domain/entity/product_entity.dart';
import '../../domain/entities/cart_entity.dart';

/// userName : "Bassel"
/// userPhone : "01113794"
/// userAddress : "fdofud"
/// productPrice : 2849
/// totalPrice : 58696
/// ProductsEntity : [{"fdfd":"fdf"},{"fdfdf5":"yty"}]

class CartModel extends CartEntity {
  CartModel({
      super.userName,
    super.userPhone,
    super.userAddress,
    super.productsPrice,
    super.totalPrice,
    super.products,});
  CartModel.fromJson(dynamic json)
  :super (
    userName: json['userName'],
    userPhone: json['userPhone'],
    userAddress: json['userAddress'],
    productsPrice: json['productPrice'],
    totalPrice: json['totalPrice'],
    products: json['ProductsEntity'] != null ?
    (json['ProductsEntity'] as List).map((i) => ProductModel.fromJson(i)).toList() : [],
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userName'] = userName;
    map['userPhone'] = userPhone;
    map['userAddress'] = userAddress;
    map['productPrice'] = productsPrice;
    map['totalPrice'] = totalPrice;
    if (products != null) {
      map['ProductsEntity'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

