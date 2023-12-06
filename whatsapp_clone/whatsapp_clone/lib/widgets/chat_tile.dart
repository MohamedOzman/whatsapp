import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/chat.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    required this.chat,
  });

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
                Icons.done_all,
                size: 15,
                color: Random().nextInt(8) > 5 ? Colors.blue : Colors.grey,
              ),
              const SizedBox(width: 5),
              Text(chat.message),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(chat.time),
              Container(
                height: 20,
                width: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kAccent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(1, 1),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ],
                ),
                child: Text(
                  Random().nextInt(5).toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
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
