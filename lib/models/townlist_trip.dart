class Town {
  late String townname;
  late int townid;
  late int trip;
  Town({
    required this.townid,
    required this.townname,
    required this.trip,
  });
  Town.frommap(dynamic obj) {
    this.townname = obj['TownName'];
    this.townid = obj['TownId'];
    this.trip = obj['Key_trip_town'];
  }
  Map<String, dynamic> tomap() {
    var map = <String, dynamic>{
      'TownName': townname,
      'TownId': townid,
      'Key_trip_town': trip
    };
    return map;
  }
}
