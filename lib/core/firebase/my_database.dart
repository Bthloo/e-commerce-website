import 'package:bn_website/core/firebase/models/get_product_url.dart';
import 'package:bn_website/features/home_screen/data/models/ProductModel.dart';
import 'package:bn_website/features/home_screen/data/models/categoty_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class MyDatabase{



  static CollectionReference<CategoryModel> getCategoriesCollection(){
    return   FirebaseFirestore.instance.collection(CategoryModel.collectionName)
        .withConverter<CategoryModel>(
      fromFirestore: (snapshot, options) => CategoryModel.fromJson(snapshot.data()),
      toFirestore: (products, options) => products.toJson(),
    );
  }



  static Query<ProductModel> getProductsByCategoryCollection({required String category}){
    return   FirebaseFirestore.instance.collection(ProductModel.collectionName).
    where( 'category',isEqualTo: category,)
        .withConverter<ProductModel>(
      fromFirestore: (snapshot, options) => ProductModel.fromJson(snapshot.data()),
      toFirestore: (products, options) => products.toJson(),
    );
  }


  static Query<ProductModel>searchProduct({required String searchQuery})  {
    return   FirebaseFirestore.instance.collection(ProductModel.collectionName)
    .where("search",arrayContains: searchQuery.toLowerCase(),)
       // .where("name", isGreaterThanOrEqualTo: searchQuery)
       // .where("name", isLessThanOrEqualTo: "$searchQuery\uf7ff")
        .withConverter<ProductModel>(
      fromFirestore: (snapshot, options) => ProductModel.fromJson(snapshot.data()),
      toFirestore: (products, options) => products.toJson(),
    );
  }


  static CollectionReference<ProductModel> getProductsCollection(){
    return   FirebaseFirestore.instance.collection(ProductModel.collectionName)
        .withConverter<ProductModel>(
      fromFirestore: (snapshot, options) => ProductModel.fromJson(snapshot.data()),
      toFirestore: (products, options) => products.toJson(),
    );
  }


   static DocumentReference<ProductModel>getURL ({required String collectionPath,required String documentId}) {
   return FirebaseFirestore.instance.collection(collectionPath).doc(documentId)
       .withConverter<ProductModel>(
     fromFirestore: (snapshot, options) => ProductModel.fromJson(snapshot.data()),
     toFirestore: (products, options) => products.toJson(),
   );

  }


  static Future<ProductModel?>getProductsByURL({required String path})async{
    List<String> parts = path.split('/');
    parts.removeWhere((part) => part.isEmpty);
    String collectionId = parts[0];
    String documentId = parts[1];

   var getDocumentReference = MyDatabase.getURL(collectionPath: collectionId, documentId: documentId);
   var getDocumentSnapShot = await getDocumentReference.get();
   return getDocumentSnapShot.data();

  }

  static CollectionReference<GetProductURL> getBestSellCollecton(){
    return FirebaseFirestore.instance.collection('BestSell')
        .withConverter<GetProductURL>(
      fromFirestore: (snapshot, options) => GetProductURL.fromJson(snapshot.data()),
      toFirestore: (products, options) => products.toJson(),
    );
  }




  static CollectionReference<GetProductURL> getSpecialCollection(){
    return FirebaseFirestore.instance.collection('Special')
        .withConverter<GetProductURL>(
      fromFirestore: (snapshot, options) => GetProductURL.fromJson(snapshot.data()),
      toFirestore: (products, options) => products.toJson(),
    );
  }

}