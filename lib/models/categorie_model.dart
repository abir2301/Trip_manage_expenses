class Categor {
  late int categoryid;
  late String categoryname;
  Categor({
    required this.categoryname,
  });
  Categor.fromMap(dynamic obj) {
    this.categoryid = obj['categoryId'];
    this.categoryname = obj['categoryName'];
    print("frommap");
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'categoryName': categoryname,
    };
    print("to map ");
    return map;
  }
}
