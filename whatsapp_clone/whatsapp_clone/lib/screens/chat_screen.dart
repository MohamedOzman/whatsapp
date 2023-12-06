import 'package:flutter/material.dart';


import '../models/chat.dart';
import '../widgets/chat_tile.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            return ChatTile(
              chat: chats[index],
            );
          }),
    );
  }
}
