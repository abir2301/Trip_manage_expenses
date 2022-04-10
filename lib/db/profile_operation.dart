import 'package:tripexpense/db/db.dart';
import 'package:tripexpense/models/categorie_model.dart';
import 'package:tripexpense/models/profile.dart';

class ProfileOperation {
  late ProfileOperation categoryOperations;

  final dbProvider = DatabaseFile.instance;

  createProfile(Profile profile) async {
    final db = await dbProvider.database;
    db.insert('profile', profile.toMap());
    print("Profile inserted suuscesfully ");
  }

  Future<List<Profile>> getProfile() async {
    print("we are in get profile ");
    final db = await dbProvider.database;
    print("we will get profiles ");
    List<Map<String, dynamic>> allRows = await db.query('profile');
    print("get all rows is done ");
    List<Profile> profiles =
        allRows.map((profile) => Profile.fromMap(profile)).toList();
    print("get all Profile  ");
    return profiles;
  }

  updateProfile(Profile profile) async {
    final db = await dbProvider.database;
    db.update('profile', profile.toMap(),
        where: "profileId=?", whereArgs: [profile.profileid]);
  }
}
