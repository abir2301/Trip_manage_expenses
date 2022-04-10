import 'package:flutter/material.dart';
import 'package:tripexpense/db/person_trip_operation.dart';
import 'package:tripexpense/layout/home.dart';
import 'package:tripexpense/models/personel_trip_model.dart';
import 'package:tripexpense/models/trip_model.dart';
import 'package:tripexpense/presentation/pages/person_trip/PersonTripList.dart';
import 'package:tripexpense/presentation/pages/person_trip/personlistview.dart';
import 'package:tripexpense/shared/components/components.dart';
import 'package:tripexpense/shared/styles/colors.dart';

/*class Trip_person extends StatelessWidget {
  late Trip trip;
  Trip_person({required trip, Key? key}) : super(key: key);
  PersontripOperation persontripOperation = PersontripOperation();
  @override
  Widget build(BuildContext context) {
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
                        onPressed: () => addperson(context, trip),
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
              child: FutureBuilder(
                  future: persontripOperation.getAllpersons(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError)
                      print(" error  while gett all persons ");
                    Object? data = snapshot.data;
                    if (snapshot.hasData) {
                      print("we are in person_triplist ");
                      final List<Person_trip> persons =
                          data as List<Person_trip>;
                      return ListView.builder(
                        itemCount: persons.length,
                        itemBuilder: (context, index) {
                          return Personlistview(
                              value: persons[index], index: index);
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          "Add new persons",
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
                          MaterialPageRoute(builder: (context) => Home()));
                    }),
              ),
            )
          ],
        ));
  }
}*/
