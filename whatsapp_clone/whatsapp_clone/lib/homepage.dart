import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';

import 'screens/calls_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/status_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: _selectedTabIndex,
    );
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        backgroundColor: kSecondary,

        // add  pop up menu
        actions: [
          const Icon(Icons.camera_alt_outlined),
          const SizedBox(
            width: 10,
          ),
          const Icon(Icons.search),
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("New group"),
                value: "New group",
              ),
              const PopupMenuItem(
                child: Text("New broadcast"),
                value: "New broadcast",
              ),
              const PopupMenuItem(
                child: Text("WhatsApp Web"),
                value: "WhatsApp Web",
              ),
              const PopupMenuItem(
                child: Text("Starred messages"),
                value: "Starred messages",
              ),
              const PopupMenuItem(
                child: Text("Settings"),
                value: "Settings",
              ),
            ],
            icon: const Icon(Icons.more_vert),
          ),
        ],

        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Color.fromARGB(255, 255, 255, 255),
          tabs: const [
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ChatScreen(),
          StatusScreen(),
          CallScreen(),
        ],
      ),
      // floatingActionButton as profissional
      floatingActionButton: _selectedTabIndex == 0
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.message),
              backgroundColor: kPrimary,
            )
          : _selectedTabIndex == 1
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.edit),
                      backgroundColor: kPrimary,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.camera_alt),
                      backgroundColor: kPrimary,
                    ),
                  ],
                )
              : FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add_call),
                  backgroundColor: kPrimary,
                ),
    );
  }
}
