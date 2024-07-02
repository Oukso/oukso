class Message {
  String type;
  String message;
  String time;
  Message({
    required this.message,
    required this.type,
    required this.time,
  });
  Map<String, dynamic> toMap() {
    return {
      "type": type,
      "message": message,
      "time": time,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
        message: map["message"], type: map["type"], time: map["time"]);
  }
}
