class GetProductURL{
  String? path;
  GetProductURL({this.path});
  GetProductURL.fromJson(Map<String, dynamic>? json){
    path = json?['path'];
  }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    return data;
  }

}