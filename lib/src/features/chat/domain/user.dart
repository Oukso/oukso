class User {
  String id;
  String userName;
  String phoneNumber;
  User({required this.id, required this.userName, required this.phoneNumber});
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      userName: map['userName'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'phoneNumber': phoneNumber,
    };
  }
}
