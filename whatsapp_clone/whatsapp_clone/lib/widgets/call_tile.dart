import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/chat.dart';


class CallTile extends StatelessWidget {
  const CallTile({
    required this.chat,
    required this.type,
  });

  final String type;

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: NetworkImage(chat.avatar),
              ),
            ),
          ),
          title: Text(chat.name),
          subtitle: Row(
            children: [
              Icon(
                type == "made" ? Icons.call_made : Icons.call_received,
                size: 15,
                color: Random().nextInt(8) > 2 ? Colors.red : Colors.green,
              ),
              Text(chat.time),
            ],
          ),
          trailing: Icon(
          
            type == "made" ? Icons.call : Icons.videocam,
            color: kSecondary,

           
          ),
        ),
        const Divider(
          height: 0,
          thickness: 1,
          indent: 80,
          endIndent: 20,
        ),
      ],
    );
  }
}
