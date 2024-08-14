class GetProductURL{
  String? productURL;
  GetProductURL({this.productURL});
  GetProductURL.fromJson(Map<String, dynamic>? json){
    productURL = json?['productUrl'];
  }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productUrl'] = productURL;
    return data;
  }

}