import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:tripexpense/presentation/pages/trip_pages/add_new_trip.dart';

class Trip {
  int? tripId;
  late String trip_image;
  late String name;
  late String description;
  late String date_start;
  late String date_finish;
  /* late int totalamount;
  late int totalexpence;
  late int personnumber;*/

  Trip({
    this.tripId,
    required this.trip_image,
    required this.name,
    required this.description,
    required this.date_start,
    required this.date_finish,
  }) {}

  Trip copy(
      {int? tripId,
      String? name,
      String? description,
      String? date_start,
      String? date_finish,
      String? trip_image}) {
    return Trip(
        tripId: tripId ?? this.tripId,
        trip_image: trip_image ?? this.trip_image,
        name: name ?? this.name,
        description: description ?? this.description,
        date_start: date_start ?? this.date_start,
        date_finish: date_finish ?? this.date_finish);
  }

  int? getid() {
    return this.tripId;
  }

  // get from data base
  Trip.fromMap(dynamic obj) {
    this.tripId = obj['tripId'];
    this.name = obj['tripName'];
    this.description = obj['tripDescription'];
    this.date_start = obj['trip_Date_Start'];
    this.date_finish = obj['trip_date_finich'];
    this.trip_image = obj['trip_Image'];
  }
  //insert into data base
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'tripName': name,
      'tripDescription': description,
      'trip_Date_Start': date_start,
      'trip_date_finich': date_finish,
      'trip_Image': trip_image,
    };
    return map;
  }
}
