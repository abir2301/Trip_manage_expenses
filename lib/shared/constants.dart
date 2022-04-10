import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'components/components.dart';
import 'styles/colors.dart';

String email = "";
String name = "";
bool insertedprofile = false;

class floatingActionbutton extends StatefulWidget {
  floatingActionbutton();

  @override
  _floatingActionbuttonState createState() => _floatingActionbuttonState();
}

class _floatingActionbuttonState extends State<floatingActionbutton> {
  var formkey = GlobalKey<FormState>();
  IconData icon = Icons.add;
  Color baghround = gris();
  bool isopen = false;
  var textcontroller = TextEditingController();
  bool saved = false;
  late Database db;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(icon),
      onPressed: () {
        if (isopen == true) {
          if (saved) {
            Navigator.pop(context);
            print(isopen);
            isopen = false;
            setState(() {
              icon = Icons.add;
            });
          }
        } else {
          saved = false;
          Scaffold.of(context).showBottomSheet<void>(
            (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                  color: grislight(),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                padding: EdgeInsets.all(20),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
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
                          labelText: "categorie title  ",
                          prefixIcon: Icon(Icons.category_rounded),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: flatbutton(
                            title: "save",
                            pressed: () {
                              if (formkey.currentState!.validate()) {
                                saved = true;
                              } else
                                saved = false;
                            },
                            background: pink()),
                      )
                    ],
                  ),
                ),
              );
            },
          );
          isopen = true;
          setState(() {
            icon = Icons.edit;
            baghround = pink();
          });
        }
      },
    );
  }

  createDatabase() async {
    // ignore: unused_local_variable

    db = await openDatabase(
      "abir.db",
      version: 1,
      onCreate: (db, version) async {
        print("database created ");
        await db
            .execute(
                'CREATE TABLE Categories (id INTEGER PRIMARY KEY, name TEXT, status TEXT)')
            .then((value) {
          print(" Ucategories table is  created ");
          print("la base est composer de $db");
        }).catchError((error) {
          print("error catched when creating table ");
        });
      },
      onOpen: (db) {
        print("database is opened ");
      },
    );
  }

  Future insertodatabase({
    required String name,
  }) async {
    return await db.transaction((txn) async {
      await txn
          .rawInsert(
        'INSERT INTO Categories(name,status)VALUES ( "$name","new")',
      )
          .then((value) {
        print("$value INSERTED SUCCESSFULY");
      }).catchError((error) {
        print("there is an error while inserting into databsa ");
      });
    });
  }

  Future<List<Map>> getdatafromdatabase(db) async {
    return await db.rawQuery(' SELECT * FROM Categories');
  }
}
