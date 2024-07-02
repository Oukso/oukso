class Chat {
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;

  Chat({
    required this.name,
    required this.icon,
    required this.isGroup,
    required this.time,
    required this.currentMessage,
  });
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "icon": icon,
      "isGroup": isGroup,
      "time": time,
      "currentMessage": currentMessage,
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
        name: map["name"],
        icon: map["icon"],
        isGroup: map["isGroup"],
        time: map["time"],
        currentMessage: map["currentMessage"]);
  }
}
