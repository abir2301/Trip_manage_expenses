import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:intl/intl_standalone.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:tripexpense/shared/components/components.dart';
import 'package:tripexpense/shared/styles/colors.dart';
import 'package:intl/intl.dart';

import 'package:image_picker/image_picker.dart';

/*
class TripForm extends StatefulWidget {
  const TripForm({Key? key}) : super(key: key);

  @override
  _TripFormState createState() => _TripFormState();
}

class _TripFormState extends State<TripForm> {
  final format = DateFormat("yyyy-MM-dd");
  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  // ignore: unused_element
  void takephoto(ImageSource source) async {
    // ignore: deprecated_member_use
    // ignore: non_constant_identifier_names
    final PickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = PickedFile!;
    });
  }

  var personnamecontroler = TextEditingController();
  var depositamountcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var Titlecontroller = TextEditingController();
    var descriptioncontroller = TextEditingController();
    var formkey = GlobalKey<FormState>();
    var datestartcontroler = TextEditingController();
    var date_finishcontroller = TextEditingController();
    late DateTime valur;

    return Scaffold(
      appBar: appbarmodel(title: "Add new trip", icon: Icons.bolt),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Expanded(child: trip_image()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child: TextFormField(
                            onSaved: (value) {
                              print(value);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " Title  must not be empty   ";
                              }
                              return null;
                            },
                            controller: Titlecontroller,
                            keyboardType: TextInputType.name,
                            onFieldSubmitted: (value) {},
                            decoration: InputDecoration(
                              labelText: " Trip Title ",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          )
                              //trip title
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: TextFormField(
                              style: TextStyle(fontSize: 12),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return " Trip Description   must not be empty   ";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                print(value);
                              },
                              controller: descriptioncontroller,
                              keyboardType: TextInputType.name,
                              onFieldSubmitted: (value) {},
                              decoration: InputDecoration(
                                labelText: " Trip Description ",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            //trip title

                            //trip description
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: DateTimeField(
                                      validator: (value) {
                                        if (value != null) {
                                          return " Date_start  Trip   must not be empty   ";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.calendar_today),
                                        labelText: " Date _start  ",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                      ),
                                      format: format,
                                      onShowPicker: (context, currentValue) {
                                       
                                        return showDatePicker(
                                            context: context,
                                            firstDate: DateTime.now(),
                                            initialDate: currentValue,
                                            lastDate: DateTime(2100));
                                      },
                                    ),
                                  ),
                                  //form date start

                                  Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Center(
                                      child: Text(
                                        "to",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: pink()),
                                      ),
                                    ),
                                  ),
                                  //form date start

                                  Expanded(
                                    child: DateTimeField(
                                      validator: (value) {
                                        if (value != null) {
                                          return "date _finish  Trip   must not be empty   ";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.calendar_today),
                                        labelText: " Date_finish  ",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                      ),
                                      format: format,
                                      onShowPicker: (context, currentValue) {
                                        return showDatePicker(
                                            context: context,
                                            firstDate: DateTime.now(),
                                            initialDate: valur,
                                            lastDate: DateTime(2100));
                                      },
                                    ),
                                  ),
                                  //form date finish
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                   Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: grislight(),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: list_person(value: personlsit)),
                          ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: MaterialButton(
                            color: pink(),
                            child: Text(
                              "SAVE",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: white()),
                            ),
                            onPressed: () {})),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

buildperson({required Map val}) {
    return ListTile(
      title: Text(val['name']),
      subtitle: Text(val['deposit amount']),
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
    );
  }

  Widget list_person({required List<Map> value}) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Container(
                child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: white(),
                  width: 1,
                ),
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Person Details",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: () => addperson(),
                        icon: Icon(
                          Icons.add,
                          color: blue(),
                          size: 25,
                        )),
                  ),
                ],
              ),
            )),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              height: double.minPositive,
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) =>
                      buildperson(val: value[index]),
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 1,
                      color: white(),
                    );
                  },
                  itemCount: value.length),
            ),
          ],
        ));
  }

  void addperson() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              "add new person ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  onSaved: (value) {
                    print(value);
                  },
                  controller: personnamecontroler,
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.person_add,
                    ),
                    labelText: " person name  ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  onSaved: (value) {
                    print(value);
                  },
                  controller: depositamountcontroler,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.money),
                    labelText: " deposit amount   ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                        child:
                            TextButton(onPressed: () {}, child: Text("CANEL"))),
                    Expanded(
                        child:
                            TextButton(onPressed: () {}, child: Text("SAVE"))),
                  ],
                )
              ],
            ))
          ));

Widget trip_image() {
  var context;
  return Container(
    child: Stack(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/trip.jpg")
                  _imageFile==null ?  AssetImage(
                        "assets/images/trip.jpg"),

                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(8)),
        ),
        Positioned(
            bottom: 10,
            right: 10,
            child: InkWell(
              onTap: () => showModalBottomSheet(
                  context: context,
                   builder: (Builder) => inkwellbuttomsheet()),
              child: Icon(
                Icons.camera_alt,
                color: white(),
              ),
            ))
      ],
    ),
  );
}

Widget inkwellbuttomsheet() {
  return Container(
    color: grislight(),
    height: 100,

    // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "choose your trip image ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                // takephoto(ImageSource.camera);
              },
              icon: Icon(Icons.camera),
              tooltip: "Camera",
            ),
            IconButton(
              onPressed: () {
                //  takephoto(ImageSource.gallery);
              },
              icon: Icon(Icons.image),
              tooltip: "Gallery",
            ),
          ],
        )
      ],
    ),
  );
}*/
