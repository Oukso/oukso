class User {
  //Attributen
  String id;
  String userName;
  String phoneNumber;
//Konstruktor
  User({
    required this.id,
    required this.userName,
    required this.phoneNumber,
  });
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userName": userName,
      "phoneNumber": phoneNumber,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map["id"],
        userName: map["userName"],
        phoneNumber: map["phoneNumber"]);
  }
//Methoden
}
