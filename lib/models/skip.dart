import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripexpense/layout/home.dart';

class Skippage extends StatefulWidget {
  late final String? imageurl;
  late final String? boldtext;
  late final String? text;
  Skippage({
    required this.imageurl,
    required this.boldtext,
    required this.text,
  });

  @override
  _SkippageState createState() => _SkippageState();
}

class _SkippageState extends State<Skippage> {
  int _currectindex = 0;
  @override
  Widget build(BuildContext context) {
    var text1 = Text(widget.text!,
        textAlign: TextAlign.center,
        style: GoogleFonts.raleway(
          color: Color.fromRGBO(111, 103, 103, 10),
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ));
    var text2 = Text(
      widget.boldtext!,
      style: GoogleFonts.balooBhaijaan(
        color: Color.fromRGBO(111, 103, 103, 10),
        fontSize: 15,
      ),
    );

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Expanded(
                child: Image.asset(
                  widget.imageurl!,
                  width: 255,
                  height: 100,
                ),
              ),
              Expanded(
                child: Container(
                    width: 300,
                    child: Column(
                      children: [
                        text2,
                        text1,
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
