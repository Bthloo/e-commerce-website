/// images : ["fdfd","fdgfd","dffd"]

class Fffff {
  Fffff({
      this.images,});

  Fffff.fromJson(dynamic json) {
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['images'] = images;
    return map;
  }

}