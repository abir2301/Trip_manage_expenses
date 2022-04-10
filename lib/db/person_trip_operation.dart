import 'package:tripexpense/db/db.dart';
import 'package:tripexpense/models/personel_trip_model.dart';

class PersontripOperation {
  late PersontripOperation persontripOperation;
  final dbProvider = DatabaseFile.instance;

  Future<Person_trip> createnewperson(Person_trip person) async {
    print("we ara in create new person trip ");
    final db = await dbProvider.database;
    final id = await db.insert('person', person.toMap());
    print("person  inserted suuscesfully ");
    print("person_trip id  , $id ");
    return person.copy(personId: id);
  }

  Future<List<Person_trip>> getAllpersons() async {
    print("we are in get all person_trip  ");
    final db = await dbProvider.database;
    print("provide the data base  ");
    List<Map<String, dynamic>> allRows = await db.query('person');
    print("get all  person_trip rows is done ");
    List<Person_trip> personlist =
        allRows.map((person) => Person_trip.fromMap(person)).toList();
    print("get all person trips   ");
    return personlist;
  }

  updatePerson(Person_trip person) async {
    final db = await dbProvider.database;
    db.update('person', person.toMap(),
        where: "personid=?", whereArgs: [person.personId]);
  }

  deletePerson(Person_trip person) async {
    final db = await dbProvider.database;
    await db
        .delete('person', where: 'personid=?', whereArgs: [person.personId]);
  }
}
