class CategoryModel {
  static const collectionName = 'categories';

  final String name;

  CategoryModel({required this.name});

  CategoryModel.fromJson(Map<String, dynamic>? data)
      : name = data?['name'];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    return map;
  }

}