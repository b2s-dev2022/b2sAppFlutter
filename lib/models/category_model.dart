/// categories : [{"catid":2,"name":"Food"},{"catid":351,"name":"Food, Beverages & Hospitality"},{"catid":102,"name":"Health Food"},{"catid":108,"name":"Seafood"},{"catid":79,"name":"Takeaway Food"},{"catid":18,"name":"Bakery"},{"catid":84,"name":"Bottle Shop"},{"catid":103,"name":"Butcher Shops"},{"catid":26,"name":"Cafe And Coffee Shop"},{"catid":101,"name":"Catering"},{"catid":74,"name":"Convenience Stores"},{"catid":32,"name":"Corporate Cafes"},{"catid":33,"name":"Deli"},{"catid":107,"name":"Fish And Chips"},{"catid":87,"name":"Fruit And Vegetables"},{"catid":117,"name":"Juice Bar"},{"catid":123,"name":"Liquor Store"},{"catid":65,"name":"Restaurant"},{"catid":7,"name":"Supermarket"},{"catid":114,"name":"Tobacconists"},{"catid":8,"name":"Wholesale Distribution"}]

class CategoryModel {
  CategoryModel({
      List<Categories>? categories,}){
    _categories = categories;
}

  CategoryModel.fromJson(dynamic json) {
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
  }
  List<Categories>? _categories;
CategoryModel copyWith({  List<Categories>? categories,
}) => CategoryModel(  categories: categories ?? _categories,
);
  List<Categories>? get categories => _categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// catid : 2
/// name : "Food"

class Categories {
  Categories({
      num? catid, 
      String? name,}){
    _catid = catid;
    _name = name;
}

  Categories.fromJson(dynamic json) {
    _catid = json['catid'];
    _name = json['name'];
  }
  num? _catid;
  String? _name;
Categories copyWith({  num? catid,
  String? name,
}) => Categories(  catid: catid ?? _catid,
  name: name ?? _name,
);
  num? get catid => _catid;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['catid'] = _catid;
    map['name'] = _name;
    return map;
  }

}