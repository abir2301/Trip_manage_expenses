import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripexpense/layout/home.dart';
import 'package:tripexpense/main.dart';
import 'package:tripexpense/models/skip.dart';
import 'package:tripexpense/presentation/pages/skip/skippage1.dart';


import 'package:tripexpense/shared/styles/colors.dart';

class SkipPages extends StatefulWidget {
  @override
  _SkipPagesState createState() => _SkipPagesState();
}

class _SkipPagesState extends State<SkipPages> {
  int _currectindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Skippage(
        boldtext: 'WELCOME!',
        imageurl: 'assets/images/logo.png',
        text: '''Worried about managing expenses in groupe travel?'''
            ''' Here you go!''',
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: blue(),
        selectedItemColor: Colors.white,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        iconSize: 30,
        currentIndex: _currectindex,
        onTap: (int value) {
          _currectindex = value;
          int i = 0;
          setState(() {
            if (value == 0) {
              var push = Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return Home();
              }));
            } else {
              var push = Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return SkipPages1();
              }));
            }
            ;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.skip_previous,
              ),
              label: "skip",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.skip_next,
            ),
            label: "next",
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
