import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripexpense/layout/home.dart';
import 'package:tripexpense/shared/styles/colors.dart';




Widget flatbutton({
  required String title,
  required Function() pressed,
  Color background = Colors.blue,
}) {
  return Container(
    child: MaterialButton(
      onPressed: pressed,
      color: background,
      height: 40,
      minWidth: double.minPositive,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        child: Text(
          title.toUpperCase(),
          textAlign: TextAlign.center,
          style: GoogleFonts.balooBhaijaan(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}

Widget listiteam({
  required Function tap,
  required String title,
  required IconData icon_name,
}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffE8EAE6),
          ),
          child: ListTile(
            onTap: tap(),
            selected: true,
            title: Text(
              title.toUpperCase(),
              style: TextStyle(
                  color: gris(), fontWeight: FontWeight.bold, fontSize: 15),
            ),
            leading: Icon(
              icon_name,
              color: gris(),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget materialbottum({
  required Function onpressed,
  required String title,
}) {
  return Container(
      decoration: BoxDecoration(
        color: grislight(),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child:
          MaterialButton(color: pink(), child: Text(title), onPressed: () {}));
}

SizedBox height({required double size}) {
  return SizedBox(
    height: size,
  );
}

SizedBox width({required double size}) {
  return SizedBox(
    width: size,
  );
}

AppBar appbarmodel({
  required String title,
  required IconData icon,
}) {
  return AppBar(
    title: Text("$title",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        )),
    actions: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Icon(icon),
      )
    ],
  );
}

/*Widget defautformfield(
    {required TextEditingController controller,
    required TextInputType type,
    required Function validate,
    required String title,
    required IconData icon,
    required}) {
  return TextFormField(
    keyboardType: type,
    controller: controller,
    validator: validate(),
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      labelText: title,
      prefixIcon: Icon(icon),
    ),
    onFieldSubmitted: (String value) {
      print(value);
    },
  );
}*/

/*Container(
      decoration: BoxDecoration(
        color: grislight(),
      ),
      child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.category_sharp),
            SizedBox(
              width: 10,
            ),
            Row(mainAxisSize: MainAxisSize.min, children: [
              
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  ],
                ),
              ),
            ]),
          ])));*/