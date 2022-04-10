import 'package:tripexpense/db/db.dart';
import 'package:tripexpense/models/categorie_model.dart';

class CategoryOperations {
  late CategoryOperations categoryOperations;

  final dbProvider = DatabaseFile.instance;

  createCategory(Categor category) async {
    final db = await dbProvider.database;
    db.insert('category', category.toMap());
    print("category inserted suuscesfully ");
  }

  Future<List<Categor>> getAllCategories() async {
    print("we are in get all Categorie ");
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('category');
    print("get alla rows is done ");
    List<Categor> categories =
        allRows.map((categor) => Categor.fromMap(categor)).toList();
    print("get all categories  ");
    return categories;
  }

  updateCategory(Categor category) async {
    final db = await dbProvider.database;
    db.update('category', category.toMap(),
        where: "categoryId=?", whereArgs: [category.categoryid]);
  }

  deleteCategory(Categor category) async {
    final db = await dbProvider.database;
    await db.delete('category',
        where: 'categoryId=?', whereArgs: [category.categoryid]);
  }
}
