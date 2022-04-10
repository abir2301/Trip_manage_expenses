import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl_standalone.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripexpense/db/trip_operation.dart';
import 'package:tripexpense/layout/home.dart';
import 'package:tripexpense/models/trip_model.dart';
import 'package:tripexpense/presentation/pages/person_trip/PersonTripList.dart';
import 'package:tripexpense/shared/components/components.dart';
import 'package:tripexpense/shared/styles/colors.dart';
import 'package:intl/intl.dart';

import 'package:image_picker/image_picker.dart';
import 'package:tripexpense/shared/utility.dart';
import 'package:tripexpense/widgets/person_list_form.dart';

class AddTrip extends StatefulWidget {
  const AddTrip({Key? key});

  @override
  _AddTripState createState() => _AddTripState();
}

class _AddTripState extends State<AddTrip> {
  _AddTripState() {}
  final format = DateFormat.yMd('en_US');
  var Titlecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var datestartcontroler = TextEditingController();
  var date_finishcontroller = TextEditingController();
  late DateTime valur;
  late File _imageFile;
  bool _load = false;
  late DateTime date_start;
  late DateTime date_finish;
  late String string;

  // ignore: unused_element
  Future takephoto(ImageSource source) async {
    // ignore: deprecated_member_use
    // ignore: non_constant_identifier_names
    try {
      final file = await ImagePicker().pickImage(source: source);
      if (file == null) return;
      final File temporyimage = File(file.path);
      setState(() {
        this._imageFile = temporyimage;
        imageString = Utility.base64String(_imageFile.readAsBytesSync());
        _load = true;
      });
    } on PlatformException catch (e) {
      print("failed to pick image :$e");
    }
  }

  late String imageString;
  TripOperation tripOperation = TripOperation();
  //choose image from galerie or camera
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
                  takephoto(ImageSource.camera);
                },
                icon: Icon(Icons.camera),
                tooltip: "Camera",
              ),
              IconButton(
                onPressed: () {
                  takephoto(ImageSource.gallery);
                },
                icon: Icon(Icons.image),
                tooltip: "Gallery",
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget trip_image() {
    return Container(
      child: Stack(
        children: [
          Container(
              height: 100,
              child: _load == true
                  ? Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(_imageFile), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 80,
                    )
                  : Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/trip.jpg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 100,
                    )),
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

  @override
  Widget build(BuildContext context) {
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
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Expanded(child: trip_image()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: TextFormField(
                      style: TextStyle(fontSize: 12),
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
                        prefixIcon: Icon(
                          Icons.article,
                          color: green(),
                        ),
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
                          prefixIcon: Icon(
                            Icons.description,
                            color: green(),
                          ),
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
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: DateTimeField(
                                controller: datestartcontroler,
                                /* validator: (value) {
                                  if (value != null) {
                                    return " Date_start  Trip   must not be empty   ";
                                  }
                                  return null;
                                },*/
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.calendar_today,
                                    color: green(),
                                  ),
                                  labelText: "date_start",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                format: format,
                                onShowPicker: (context, currentValue) async {
                                  final date = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      initialDate:
                                          currentValue ?? DateTime.now(),
                                      lastDate: DateTime(2100));
                                  if (date != null) {
                                    date_start = date;
                                    print(
                                        " date_start est ${date_start.toString()}");

                                    date_start = date;
                                    return date_start;
                                  }
                                }),
                          ),
                          Padding(
                              padding: EdgeInsets.all(4),
                              child: Center(
                                child: Text(
                                  "to",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: green()),
                                ),
                              )),
                          Expanded(
                            child: DateTimeField(
                                controller: date_finishcontroller,
                                /* validator: (value) {
                                  if (date_finish != null) {
                                    return " Date_finish  Trip   must not be empty   ";
                                  }
                                  return null;
                                },*/
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.calendar_today,
                                    color: green(),
                                  ),
                                  labelText: "date_finish",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                format: format,
                                onShowPicker: (context, currentValue) async {
                                  final date = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      initialDate: DateTime.now(),
                                      lastDate: DateTime(2100));
                                  if (date != null) {
                                    date_finish = date;
                                    print(
                                        " la date_finish est ${date_finish.toString()}");
                                    return date;
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    child: flatbutton(
                        background: green(),
                        title: "NEXT ->",
                        pressed: () async {
                          if (formkey.currentState!.validate()) {
                            print("test positiv");
                            final trip1 = Trip(
                                trip_image: imageString,
                                name: Titlecontroller.text,
                                description: descriptioncontroller.text,
                                date_start: date_start.toString(),
                                date_finish: date_finish.toIso8601String());
                            tripOperation.createnewtrip(trip1).then((value) {
                              print(" trip inserted $trip1");
                              var push = Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PersonTripList(trip: trip1)));
                            }).catchError((error) {
                              print("error while create new trip ");
                            });
                          }
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
