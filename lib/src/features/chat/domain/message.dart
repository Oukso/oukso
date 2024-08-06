class Message {
  String senderId;
  String content;
  String time;

  Message({
    required this.senderId,
    required this.content,
    required this.time,
  });

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      senderId: map['senderId'] as String,
      content: map['content'] as String,
      time: map['time'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'content': content,
      'time': time,
    };
  }
}
