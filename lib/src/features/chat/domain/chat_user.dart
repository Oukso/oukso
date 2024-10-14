class ChatUser {
  String id;
  String userName;
  String phoneNumber;
  ChatUser(
      {required this.id, required this.userName, required this.phoneNumber});
  factory ChatUser.fromMap(Map<String, dynamic> map) {
    return ChatUser(
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
