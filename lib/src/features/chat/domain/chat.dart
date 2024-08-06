class Chat {
  String id;
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;
  bool select;
  Chat({
    required this.id,
    required this.name,
    required this.icon,
    required this.isGroup,
    required this.time,
    required this.currentMessage,
    required this.select,
  });
  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      id: map['id'] as String,
      name: map['name'] as String,
      icon: map['icon'] as String,
      isGroup: map['isGroup'] as bool,
      time: map['time'] as String,
      currentMessage: map['currentMessage'] as String,
      select: map['select'] as bool,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'isGroup': isGroup,
      'time': time,
      'currentMessage': currentMessage,
      'select': select,
    };
  }
}
