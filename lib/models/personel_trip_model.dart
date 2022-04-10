class Person_trip {
  late int? trip;
  late String name;
  late String depositamount;
  late int? personId;
  Person_trip({
    this.personId,
    required this.trip,
    required this.name,
    required this.depositamount,
  });
  Person_trip.fromMap(dynamic obj) {
    this.personId = obj['personid'];
    this.name = obj['personName'];
    this.depositamount = obj['personDepositAmount'];
    this.trip = obj['Key_person_trip'];
    print(" From map person ");
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'personName': name,
      'personDepositAmount': depositamount,
      'Key_person_trip': trip,
    };
    print(" to map person ");
    return map;
  }

  Person_trip copy({
    int? personId,
    String? name,
    String? depositamount,
    int? trip,
  }) {
    return Person_trip(
        personId: personId ?? this.personId,
        trip: trip ?? this.trip,
        name: name ?? this.name,
        depositamount: depositamount ?? this.depositamount);
  }
}
