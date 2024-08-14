import 'package:bn_website/core/firebase/models/get_product_url.dart';
import 'package:bn_website/features/home_screen/data/models/ProductModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyDatabase{

  static CollectionReference<ProductModel> getProductsCollection(){
    return FirebaseFirestore.instance.collection(ProductModel.collectionName)
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
}