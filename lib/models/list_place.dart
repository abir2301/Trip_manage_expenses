class Lsit_place {
  late int id;
  late String name;
  late int trip;
  Lsit_place({
    
    required this.name,
    
  });
  Lsit_place.frommap(dynamic obj) {
    this.name = obj['place_name'];
    this.id = obj['place_id'];
    this.trip = obj['key_trip_place'];
  }
  Map<String, dynamic> tomap() {
    var map = <String, dynamic>{
      'place_name': name,
    };
    return map;
  }
}
