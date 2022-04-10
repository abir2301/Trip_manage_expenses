import 'package:sqflite/sqflite.dart';

List<Map> user = [];

/*late Database db;
createDatabase() async {
  // ignore: unused_local_variable

  db = await openDatabase(
    "dbase.db",
    version: 1,
    onCreate: (db, version) async {
      print("database created ");
      await db
          .execute(
              'CREATE TABLE User (id INTEGER PRIMARY KEY, name TEXT, email TEXT,status TEXT)')
          .then((value) {
        print(" User table is  created ");
      }).catchError((error) {
        print("error catched when creating table ");
      });
    },
    onOpen: (db) async {
      print("database is opened ");
    },
  );
}

Future insertodatabase({
  required String name,
  required String email,
}) async {
  return await db.transaction((txn) async {
    await txn
        .rawInsert(
      'INSERT INTO User(name,email,status)VALUES ( "$name","$email","new")',
    )
        .then((value) {
      print("$value INSERTED SUCCESSFULY");
    }).catchError((error) {
      print("there is an error while inserting into databsa ");
    });
  });
}

getdatafromdatabase(db, List) async {
  List = await db.rawQuery(' SELECT * FROM User');
  print("la liste dans getdata");
  print(List);
}*/
