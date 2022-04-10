import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripexpense/layout/home.dart';
import 'package:tripexpense/layout/trip/trip.dart';
import 'package:tripexpense/layout/trip/trip_form.dart';
import 'package:tripexpense/presentation/pages/category/categorie.dart';
import 'package:tripexpense/presentation/pages/skip/skippage.dart';

import 'package:tripexpense/shared/bloc_observer.dart';

import 'package:tripexpense/shared/components/components.dart';
import 'package:tripexpense/shared/styles/colors.dart';

import 'db/db.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MaterialApp(home: Home()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final dbProvider = DatabaseFile.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'trip expense manager ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 233,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: 255,
                height: 250,
              ),
              SizedBox(
                height: 100,
              ),
              flatbutton(
                title: "get started ",
                pressed: () {
                  var push = Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SkipPages()));
                },
                background: pink(),
              ),
            ],
          ),
        )),
        routes: {
          '/categorie': (context) => Categorie(),
        });
  }
}
