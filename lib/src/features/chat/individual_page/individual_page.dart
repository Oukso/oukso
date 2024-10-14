import 'package:flutter/material.dart';
import 'package:oukso/src/features/chat/customs/own_message_card.dart';
import 'package:oukso/src/features/chat/customs/replay_card.dart';
import 'package:oukso/src/features/chat/domain/chat.dart';
import 'package:oukso/src/features/chat/domain/message.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key, required this.chat, required this.sourchat});
  final Chat chat;
  final Chat sourchat;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
  List<Message> messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
    connect();
  }

  void connect() {
    socket = IO.io("http://192.168.0.106:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit("signin", widget.sourchat.id);
    socket.onConnect((data) {
      debugPrint("Connected");
      socket.on("message", (msg) {
        debugPrint(msg);
        setMessage("destination", msg["message"]);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    debugPrint(socket.connected.toString());
  }

  void sendMessage(String message, int sourceId, int targetId) {
    setMessage("source", message);
    socket.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
  }

  void setMessage(String type, String message1) {
    Message message = Message(
      senderId: type == "source"
          ? widget.sourchat.id.toString()
          : widget.chat.id.toString(),
      content: message1,
      time: DateTime.now().toString().substring(10, 16),
    );

    setState(() {
      messages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1587B8),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          leadingWidth: 70,
          titleSpacing: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blueGrey,
                  child: Icon(
                    widget.chat.isGroup ? Icons.group : Icons.person,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          title: InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chat.name,
                    style: const TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Text(
                    "last seen today at 12:05",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          actions: [
            const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.video_call,
                  color: Colors.white,
                )),
            const IconButton(
                onPressed: null, icon: Icon(Icons.call, color: Colors.white)),
            PopupMenuButton<String>(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onSelected: (value) {
                debugPrint(value);
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(child: Text("Neue Groupe")),
                  const PopupMenuItem(child: Text("Kontakt ansehen")),
                  const PopupMenuItem(child: Text("Hintergrund")),
                  const PopupMenuItem(child: Text("Einstellungen")),
                  const PopupMenuItem(child: Text("mehr"))
                ];
              },
            )
          ],
          backgroundColor: const Color(0xFF152B37),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // ignore: deprecated_member_use
        child: WillPopScope(
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: messages.length + 1,
                  itemBuilder: (context, index) {
                    if (index == messages.length) {
                      return Container(
                        height: 70,
                      );
                    }
                    if (messages[index].senderId ==
                        widget.sourchat.id.toString()) {
                      return OwnMessageCard(
                        message: messages[index].content,
                        time: messages[index].time,
                      );
                    } else {
                      return ReplayCard(
                        message: messages[index].content,
                        time: messages[index].time,
                      );
                    }
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  left: 2, right: 2, bottom: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextFormField(
                                controller: _controller,
                                focusNode: focusNode,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    setState(() {
                                      sendButton = true;
                                    });
                                  } else {
                                    setState(() {
                                      sendButton = false;
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Type a message",
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  prefixIcon: IconButton(
                                    icon: Icon(
                                      show
                                          ? Icons.keyboard
                                          : Icons.emoji_emotions_outlined,
                                    ),
                                    onPressed: () {
                                      if (!show) {
                                        focusNode.unfocus();
                                        focusNode.canRequestFocus = false;
                                      }
                                      setState(() {
                                        show = !show;
                                      });
                                    },
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.attach_file),
                                        onPressed: () {
                                          showModalBottomSheet(
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (builder) =>
                                                  bottomSheet());
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.camera_alt),
                                        onPressed: () {
                                          // Implement camera functionality
                                        },
                                      ),
                                    ],
                                  ),
                                  contentPadding: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8,
                              right: 2,
                              left: 2,
                            ),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: const Color(0xFF128C7E),
                              child: IconButton(
                                icon: Icon(
                                  sendButton ? Icons.send : Icons.mic,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  if (sendButton) {
                                    _scrollController.animateTo(
                                        _scrollController
                                            .position.maxScrollExtent,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeOut);
                                    sendMessage(
                                        _controller.text,
                                        widget.sourchat.id as int,
                                        widget.chat.id as int);
                                    _controller.clear();
                                    setState(() {
                                      sendButton = false;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.location_pin, Colors.teal, "Location"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              size: 29,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
