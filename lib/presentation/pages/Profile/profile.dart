import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripexpense/db/profile_operation.dart';
import 'package:tripexpense/layout/home.dart';
import 'package:tripexpense/models/profile.dart';
import 'package:tripexpense/shared/components/components.dart';
import 'package:tripexpense/shared/constants.dart';
import 'package:tripexpense/shared/styles/colors.dart';
import 'package:sqflite/sqflite.dart';

class Profilepage extends StatefulWidget {
  @override
  _ProfilepageState createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  var namecontroller = TextEditingController();

  var emailcontroller = TextEditingController();

  var formkey = GlobalKey<FormState>();
  ProfileOperation profileOperation = ProfileOperation();

  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
  }

// Navigator.pop(context);
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Text(
                  "create your Profile",
                  style: TextStyle(
                    color: blue(),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Center(
                  child: Form(
                    key: formkey,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return " name  must not be empty   ";
                                }
                                return null;
                              },
                              controller: namecontroller,
                              keyboardType: TextInputType.name,
                              onFieldSubmitted: (value) {},
                              decoration: InputDecoration(
                                labelText: "name ",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return " email   must not be empty   ";
                                  }
                                  return null;
                                },
                                controller: emailcontroller,
                                keyboardType: TextInputType.emailAddress,
                                onFieldSubmitted: (String value) {
                                  print(value);
                                },
                                decoration: InputDecoration(
                                  labelText: "email ",
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                              )),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            child: Center(
                                child: GestureDetector(
                              child: flatbutton(
                                  title: "save",
                                  pressed: () {
                                    if (formkey.currentState!.validate()) {
                                      final profile = Profile(
                                          name: namecontroller.text,
                                          email: emailcontroller.text);
                                      profileOperation.createProfile(profile);
                                      var push = Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Home()));
                                    }
                                  },
                                  background: pink()),
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
