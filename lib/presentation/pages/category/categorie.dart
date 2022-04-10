import 'package:flutter/material.dart';
import 'package:tripexpense/db/category_operation.dart';
import 'package:tripexpense/db/db.dart';
import 'package:tripexpense/layout/home.dart';
import 'package:tripexpense/models/categorie_model.dart';
import 'package:tripexpense/presentation/pages/category/add_categorie_page.dart';
import 'package:tripexpense/presentation/pages/category/edit_categorie_page.dart';
import 'package:tripexpense/shared/components/components.dart';
import 'package:tripexpense/shared/styles/colors.dart';

class Categorie extends StatefulWidget {
  Categorie({Key? key})
      : super(
          key: key,
        );

  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  var scafoldkey = GlobalKey<ScaffoldState>();

  CategoryOperations categoryOperations = CategoryOperations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldkey,
      appBar: AppBar(
        title: Text("Manage Categories"),
        leading: IconButton(
            onPressed: () {
              var push = Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return Home();
              }));
            },
            icon: Icon(Icons.arrow_back)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(Icons.category),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Center(
        child: FutureBuilder(
            future: categoryOperations.getAllCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(" error ");
              Object? data = snapshot.data;
              if (snapshot.hasData) {
                print("we are in categories list ");
                return Category_list(data as List<Categor>);
              } else {
                return new Center(
                  child: Text(
                    "you have no categorie yet ",
                    style: TextStyle(color: pink()),
                  ),
                );
              }
            }),
      )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            var push = Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => floatingActionbutton()));
          }),

      // ignore: dead_code
    );
  }
}

class Category_list extends StatelessWidget {
  late List<Categor> categories;
  CategoryOperations categoryOperations = CategoryOperations();
  // ignore: type_init_formals
  Category_list(List<Categor> this.categories, {Key? key}) : super(key: key);

  // ignore: non_constant_identifier_names
  Widget categirieiteam(
      {required Categor value, required int index, required context}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: grislight()),
        child: Dismissible(
          key: Key('${value.categoryid}'),
          child: ListTile(
            title: Text(
              value.categoryname,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            trailing: Container(
              child: IconButton(
                  onPressed: () {
                    var push = Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Editcategory(value)));
                  },
                  icon: Icon(Icons.edit)),
            ),
            leading: Icon(Icons.category_sharp),
          ),
          onDismissed: (direction) {
            categoryOperations.deleteCategory(value);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemBuilder: (Context, index) {
                return Dismissible(
                    key: Key('${categories[index].categoryid}'),
                    child: categirieiteam(
                        value: categories[index],
                        index: index,
                        context: context));
              },
              itemCount: categories.length)),
    );
  }
}
