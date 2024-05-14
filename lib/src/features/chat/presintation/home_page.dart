import 'package:flutter/material.dart';
import 'package:oukso/src/features/chat/presintation/chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF152B37),
          title: const Text(
            "Oukso",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                )),
            const IconButton(
                onPressed: null, icon: Icon(Icons.search, color: Colors.white)),
            PopupMenuButton<String>(
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(child: Text("data")),
                  const PopupMenuItem(child: Text("data")),
                  const PopupMenuItem(child: Text("data")),
                  const PopupMenuItem(child: Text("data")),
                  const PopupMenuItem(child: Text("data"))
                ];
              },
            )
          ],
          bottom: TabBar(
              automaticIndicatorColorAdjustment: true,
              indicatorColor: Colors.orange,
              controller: _controller,
              tabs: const [
                Tab(
                  text: "Chat",
                ),
                Tab(
                  text: "Status",
                ),
                Tab(
                  text: "Anruf",
                )
              ])),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF1587B8), Color(0xFF0D3A7F)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    transform: GradientRotation(0.5))),
          ),
          TabBarView(controller: _controller, children: const [
            ChatPage(),
            Text("Status", style: TextStyle(color: Colors.white)),
            Text("Anruf", style: TextStyle(color: Colors.white)),
          ])
        ],
      ),
    );
  }
}