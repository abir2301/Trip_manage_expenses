import 'package:flutter/material.dart';
import 'package:tripexpense/db/category_operation.dart';
import 'package:tripexpense/models/categorie_model.dart';
import 'package:tripexpense/presentation/pages/category/categorie.dart';
import 'package:tripexpense/shared/components/components.dart';
import 'package:tripexpense/shared/styles/colors.dart';

class Editcategory extends StatefulWidget {
  late Categor category;
  Editcategory(Categor this.category, {Key? key}) : super(key: key);

  @override
  _EditcategoryState createState() => _EditcategoryState();
}

class _EditcategoryState extends State<Editcategory> {
  var namecontroller = TextEditingController();
  CategoryOperations categoryOperations = CategoryOperations();
  var formkey = GlobalKey<FormState>();
  bool ischanged = false;
  String title = "SAVE CHANGE";

  @override
  Widget build(BuildContext context) {
    namecontroller.text = widget.category.categoryname;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Categorie "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              Form(
                key: formkey,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " title must not be empty    ";
                    }
                    return null;
                  },
                  controller: namecontroller,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  decoration: InputDecoration(
                    labelText: "categorie name  ",
                    prefixIcon: Icon(Icons.category_rounded),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  flatbutton(
                      background: gris(),
                      title: "SKIP",
                      pressed: () async {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: flatbutton(
                        background: pink(),
                        title: "SAVE CHANGE",
                        pressed: () async {
                          widget.category.categoryname = namecontroller.text;
                          categoryOperations.updateCategory(widget.category);
                          ischanged = true;
                          if (formkey.currentState!.validate()) {
                            var push = Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Categorie()));
                          }
                        }),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
