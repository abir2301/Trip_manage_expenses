import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripexpense/layout/home.dart';
import 'package:tripexpense/main.dart';
import 'package:tripexpense/models/skip.dart';

import 'package:tripexpense/shared/styles/colors.dart';

class SkipPages2 extends StatefulWidget {
  @override
  _SkipPages2State createState() => _SkipPages2State();
}

class _SkipPages2State extends State<SkipPages2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Skippage(
            imageurl: "assets/images/plane.png",
            boldtext: "Let's go tavel ",
            text: "Enjoy every moment with your friend and family  "),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: blue(),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          ),
          height: 55,
          child: InkWell(
            onTap: () {
              var push = Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Home()));
            },
            child: Padding(
                padding: EdgeInsets.only(top: 20, right: 20),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    children: [
                      Text("DONE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white)),
                    ],
                  ),
                )),
          ),
        ));
  }

  Future<void> nag(context) async {
    var push = Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Home();
    }));
    return;
  }
}
