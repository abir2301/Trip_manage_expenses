import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripexpense/main.dart';
import 'package:tripexpense/models/skip.dart';
import 'package:tripexpense/presentation/pages/skip/skippage2.dart';


class SkipPages1 extends StatefulWidget {
  @override
  _SkipPages1State createState() => _SkipPages1State();
}

class _SkipPages1State extends State<SkipPages1> {
  int _currectindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Skippage(
          boldtext: "Manage your trip expense !",
          imageurl: "assets/images/logo1.png",
          text: "Get glimpse everyone 's expense manage realtinme "),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xff3D90E3),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
        ),
        height: 55,
        child: InkWell(
          onTap: () {
            var push = Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return SkipPages2();
            }));
          },
          child: Padding(
              padding: EdgeInsets.only(top: 5, left: 280),
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    Text("Next",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white)),
                    Icon(
                      Icons.skip_next,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
