import '../../domain/entity/product_entity.dart';

/// id : "dsds"
/// name : "sds"
/// description : "fdfd"
/// price : 645645
/// discount : 6456
/// quantity : 545
/// tags : "dfdf"
/// imageUrl : "dfdff"

class ProductModel extends ProductEntity {
  static const collectionName = 'Products';
  ProductModel({
      super.id,
      super.name,
      super.description,
      super.price,
      super.discount,
      super.quantity,
      super.tags,
    super.images,
    super.category,
      super.imageUrl,});

  ProductModel.fromJson(Map<String,dynamic>?data)
  :super(
    id: data?['id'],
    name: data?['name'],
    description: data?['description'],
    price: data?['price'],
    discount: data?['discount'],
    quantity: data?['quantity'],
    tags: data?['tags'],
    imageUrl: data?['imageUrl'],
    category: data?['category'],
    images: data?['images'] is Iterable ? List<String>.from(data?['images']) : [],
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['discount'] = discount;
    map['quantity'] = quantity;
    map['tags'] = tags;
    map['imageUrl'] = imageUrl;
    map['category'] = category;
    map['images'] = images;
    return map;
  }

}