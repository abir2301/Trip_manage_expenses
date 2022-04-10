class Profile {
  late String name;
  late String email;
  late int profileid;
  Profile({
    required this.name,
    required this.email,
  });

  Profile.fromMap(dynamic obj) {
    this.name = obj['profileName'];
    print("frommap profile name  ");
    this.profileid = obj['profileId'];
    print("frommap profileid  ");
    this.email = obj['ProfileEmail'];
    print("frommap profile email  ");
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'profileName': name,
      'ProfileEmail': email,
    };
    return map;
  }
}
