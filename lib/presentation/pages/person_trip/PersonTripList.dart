import 'package:flutter/material.dart';
import 'package:tripexpense/db/person_trip_operation.dart';
import 'package:tripexpense/layout/home.dart';
import 'package:tripexpense/models/personel_trip_model.dart';
import 'package:tripexpense/models/trip_model.dart';
import 'package:tripexpense/presentation/pages/person_trip/personlistview.dart';
import 'package:tripexpense/shared/components/components.dart';
import 'package:tripexpense/shared/styles/colors.dart';

class PersonTripList extends StatefulWidget {
  final Trip trip;
  PersonTripList({Key? key, required this.trip}) : super(key: key);

  @override
  _PersonTripListState createState() => _PersonTripListState(trip);
}

class _PersonTripListState extends State<PersonTripList> {
  late final Trip trip;
  _PersonTripListState(
    this.trip,
  );
  PersontripOperation persontripOperation = PersontripOperation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(trip.name),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                color: green(),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Container(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: blue(),
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
                        Positioned(
                          right: 10,
                          child: IconButton(
                              onPressed: () => addperson(context, trip.getid()),
                              icon: Icon(
                                Icons.add,
                                size: 25,
                              )),
                        ),
                      ],
                    ),
                  )),
                  Container(
                    decoration: BoxDecoration(
                      color: pink(),
                      //borderRadius: BorderRadius.circular(12),
                    ),
                    height: 100,
                    child: FutureBuilder(
                        future: persontripOperation.getAllpersons(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError)
                            print(" error  while get all persons ");
                          Object? data = snapshot.data;
                          if (snapshot.hasData) {
                            print("we are in person_triplist ");
                            final List<Person_trip> persons =
                                data as List<Person_trip>;
                            return ListView.builder(
                              itemCount: persons.length,
                              itemBuilder: (context, index) {
                                return persontripiteam(
                                    value: persons[index], index: index);
                              },
                            );
                          } else {
                            return Center(
                              child: Text(
                                "No PERSON TRIP YET ADD NEW PERSON",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            );
                          }
                        }),
                  ),
                  Container(
                    child: GestureDetector(
                      child: flatbutton(
                          title: "SAVE TRIP",
                          pressed: () {
                            var push = Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          }),
                    ),
                  )
                ],
              )),
        ));
  }

  Widget persontripiteam({required Person_trip value, required int index}) {
    return ListTile(
      title: Text(value.name),
      subtitle: Text(value.depositamount),
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
    );
  }

  void addperson(context, id) {
    PersontripOperation persontripOperation = PersontripOperation();
    late var personnamecontroler = TextEditingController();
    late var depositamountcontroler = TextEditingController();
    var dialogkey = GlobalKey<FormState>();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text(
              "add new person ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Form(
                key: dialogkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      onSaved: (value) {
                        print(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return (" person name must be not empty ");
                        }
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return (" person deposit amount must be not empty ");
                        }
                      },
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
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("CANEL"))),
                        Expanded(
                          child: flatbutton(
                              title: "save",
                              background: green(),
                              pressed: () async {
                                if (dialogkey.currentState!.validate()) {
                                  final person1 = Person_trip(
                                      name: personnamecontroler.text,
                                      depositamount:
                                          depositamountcontroler.text,
                                      trip: id);

                                  persontripOperation
                                      .createnewperson(person1)
                                      .then((value) {
                                    print(
                                        " trip inserted $person1 et ${person1.trip}");
                                    Navigator.pop(context);
                                    var push = Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PersonTripList(
                                                  trip: trip,
                                                )));
                                  }).onError((error, stackTrace) {
                                    // ignore: unnecessary_brace_in_string_interps
                                    print(" ${error}");
                                  });
                                }
                              }),
                        ),
                      ],
                    )
                  ],
                ))));
  }
}
