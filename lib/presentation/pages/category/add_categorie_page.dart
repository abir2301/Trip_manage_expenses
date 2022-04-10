import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tripexpense/db/category_operation.dart';
import 'package:tripexpense/layout/home.dart';
import 'package:tripexpense/models/categorie_model.dart';
import 'package:tripexpense/presentation/pages/category/categorie.dart';
import 'package:tripexpense/shared/components/components.dart';
import 'package:tripexpense/shared/constants.dart';
import 'package:tripexpense/shared/styles/colors.dart';

class floatingActionbutton extends StatefulWidget {
  floatingActionbutton({Key? key}) : super(key: key);
  @override
  _floatingActionbuttonState createState() => _floatingActionbuttonState();
}

class _floatingActionbuttonState extends State<floatingActionbutton> {
  var formkey = GlobalKey<FormState>();

  IconData icon = Icons.add;
  final textcontroller = TextEditingController();
  CategoryOperations categoryOperations = CategoryOperations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("add new categorie "),),
          
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
                  controller: textcontroller,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
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
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    flatbutton(
                        background: gris(),
                        title: "Skip",
                        pressed: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: flatbutton(
                          background: pink(),
                          title: "SAVE",
                          pressed: () async {
                            if (formkey.currentState!.validate()) {
                              final category =
                                  Categor(categoryname: textcontroller.text);
                              categoryOperations.createCategory(category);
                              var push = Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => Categorie()));
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
