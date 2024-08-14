import '../../features/home_screen/data/models/ProductModel.dart';

/// ProductModel : [{"id":"1","name":"Product 1","price":100,"description":"Product 1 description","discount":10,"quantity":10,"tags":"tag1, tag2, tag3","imageUrl":"https://cdn.shopify.com/s/files/1/0493/9834/9974/files/5_5659124f-7fbd-4f6b-868c-91db272a4f6c.png?v=1718964539","images":["https://cdn.shopify.com/s/files/1/0493/9834/9974/files/5_5659124f-7fbd-4f6b-868c-91db272a4f6c.png?v=1718964539","https://cdn.shopify.com/s/files/1/0493/9834/9974/files/5_5659124f-7fbd-4f6b-868c-91db272a4f6c.png?v=1718964539","https://cdn.shopify.com/s/files/1/0493/9834/9974/files/5_5659124f-7fbd-4f6b-868c-91db272a4f6c.png?v=1718964539"]},{"id":"2","name":"Product 2","price":200,"description":"Product 2 description","discount":20,"quantity":20,"tags":"tag1, tag2, tag3","imageUrl":"https://cdn.shopify.com/s/files/1/0493/9834/9974/files/5_5659124f-7fbd-4f6b-868c-91db272a4f6c.png?v=1718964539","images":["https://cdn.shopify.com/s/files/1/0493/9834/9974/files/5_5659124f-7fbd-4f6b-868c-91db272"]},{"id":"3","name":"Product 3","price":200,"description":"Product 3 description","discount":20,"quantity":20,"tags":"tag1, tag2, tag3","imageUrl":"https://cdn.shopify.com/s/files/1/0493/9834/9974/files/5_5659124f-7fbd-4f6b-868c-91db272a4f6c.png?v=1718964539","images":["https://cdn.shopify.com/s/files/1/0493/9834/9974/files/5_5659124f-7fbd-4f6b-868c-91db272"]}]

class Modellll {
  Modellll({
      this.productModel,});

  Modellll.fromJson(dynamic json) {
    if (json['ProductModel'] != null) {
      productModel = [];
      json['ProductModel'].forEach((v) {
        productModel?.add(ProductModel.fromJson(v));
      });
    }
  }
  List<ProductModel>? productModel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (productModel != null) {
      map['ProductModel'] = productModel?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1"
/// name : "Product 1"
/// price : 100
/// description : "Product 1 description"
/// discount : 10
/// quantity : 10
/// tags : "tag1, tag2, tag3"
/// imageUrl : "https://cdn.shopify.com/s/files/1/0493/9834/9974/files/5_5659124f-7fbd-4f6b-868c-91db272a4f6c.png?v=1718964539"
/// images : ["https://cdn.shopify.com/s/files/1/0493/9834/9974/files/5_5659124f-7fbd-4f6b-868c-91db272a4f6c.png?v=1718964539","https://cdn.shopify.com/s/files/1/0493/9834/9974/files/5_5659124f-7fbd-4f6b-868c-91db272a4f6c.png?v=1718964539","https://cdn.shopify.com/s/files/1/0493/9834/9974/files/5_5659124f-7fbd-4f6b-868c-91db272a4f6c.png?v=1718964539"]

