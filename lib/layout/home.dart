import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tripexpense/db/profile_operation.dart';
import 'package:tripexpense/db/trip_operation.dart';
import 'package:tripexpense/layout/trip/trip_form.dart';
import 'package:tripexpense/main.dart';
import 'package:tripexpense/models/profile.dart';
import 'package:tripexpense/models/trip_model.dart';

import 'package:tripexpense/presentation/drawer/not_user/FAQ.dart';
import 'package:tripexpense/presentation/pages/category/categorie.dart';
import 'package:tripexpense/presentation/drawer/not_user/rating.dart';
import 'package:tripexpense/presentation/drawer/not_user/settings.dart';
import 'package:tripexpense/presentation/pages/Profile/profile.dart';
import 'package:tripexpense/presentation/pages/person_trip/PersonTripList.dart';
import 'package:tripexpense/presentation/pages/trip_pages/add_new_trip.dart';
import 'package:tripexpense/presentation/pages/trip_pages/trip_info.dart';

import 'package:tripexpense/shared/components/components.dart';
import 'package:tripexpense/shared/constants.dart';
import 'package:tripexpense/presentation/pages/shareapp.dart';
import 'package:tripexpense/shared/styles/colors.dart';
import 'package:tripexpense/presentation/pages/trip_pages/trip.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  List<String> home = [
    "profile",
    "manage categories ",
    "settirngs ",
    "FAQ",
    "share APP",
    "Rate It "
  ];
  List<Widget> screen = [
    Profilepage(),
    Categorie(),
    Settings(),
    FAQ(),
    Share_App(),
    Rate()
  ];
  ProfileOperation _profileOperation = ProfileOperation();
  TripOperation _tripOperation = TripOperation();
  Widget Tripstack({
    required Trip value,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {},
        child: Material(
          borderRadius: BorderRadius.circular(15),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/trip1.jpg",
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        value.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(value.date_start),
                          SizedBox(
                            width: 3,
                          ),
                          Text("to "),
                          Text(value.date_finish),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(value.description),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trip"),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: null,
                icon: Icon(Icons.search),
                tooltip: " search trip name   ",
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.sort,
                ),
                tooltip: " sort trip's name  ",
              )
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            FutureBuilder(
                future: _profileOperation.getProfile(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(" error  while get profiles ");
                  Object? data = snapshot.data;
                  print("create data  ");
                  if (snapshot.hasData) {
                    print("we are in profile list list ");
                    return NewWidget(data as List<Profile>);
                  } else {
                    return new Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: blue(),
                      ),
                      child: Center(
                        child: Text(
                          "crete your profile   ",
                          style: TextStyle(color: pink()),
                        ),
                      ),
                    );
                  }
                }),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffE8EAE6),
                            ),
                            child: ListTile(
                              title: Text(
                                home[0],
                                style: TextStyle(
                                    color: gris(),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              leading: Icon(
                                Icons.person,
                              ),
                              onTap: () {
                                var push = Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return screen[0];
                                }));
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffE8EAE6),
                            ),
                            child: ListTile(
                              title: Text(
                                home[1],
                                style: TextStyle(
                                    color: gris(),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              leading: Icon(Icons.feed),
                              onTap: () {
                                var push = Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return screen[1];
                                }));
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffE8EAE6),
                            ),
                            child: ListTile(
                              title: Text(
                                home[2],
                                style: TextStyle(
                                    color: gris(),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              leading: Icon(Icons.settings),
                              onTap: () {
                                var push = Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return screen[2];
                                }));
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffE8EAE6),
                            ),
                            child: ListTile(
                              title: Text(
                                home[3],
                                style: TextStyle(
                                    color: gris(),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              leading: Icon(Icons.help),
                              onTap: () {
                                var push = Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return screen[3];
                                }));
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffE8EAE6),
                            ),
                            child: ListTile(
                              title: Text(
                                home[4],
                                style: TextStyle(
                                    color: gris(),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              leading: Icon(Icons.share),
                              onTap: () {
                                var push = Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return screen[4];
                                }));
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffE8EAE6),
                            ),
                            child: ListTile(
                              title: Text(
                                home[5],
                                style: TextStyle(
                                    color: gris(),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              leading: Icon(Icons.star),
                              onTap: () {
                                var push = Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return screen[5];
                                }));
                              },
                            ),
                          ),
                        ),
                      ],
                    )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: _tripOperation.getAlltrips(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(" error  while gett all trips ");
              Object? data = snapshot.data;
              if (snapshot.hasData) {
                print("we are in trip list ");
                final List<Trip> trips = data as List<Trip>;
                return ListView.builder(
                  itemCount: trips.length,
                  itemBuilder: (context, index) {
                    return TripStack(value: trips[index], index: index);
                  },
                );
              } else {
                return Center(
                  child: Text(
                    "Add new trip",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            var push = Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddTrip()));
          }),
    );
  }
}

class NewWidget extends StatelessWidget {
  late List<Profile> profiles;
  NewWidget(
    List<Profile> this.profiles, {
    Key? key,
  }) : super(key: key);
  late Profile _profile = profiles.last;
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: blue(),
      ),
      accountName: Text(_profile.name),
      accountEmail: Text(_profile.email),
      currentAccountPicture: CircleAvatar(
        child: Icon(
          Icons.person,
        ),
      ),
    );
  }
}
