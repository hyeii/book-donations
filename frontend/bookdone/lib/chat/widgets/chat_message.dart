import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ChatMessage extends HookWidget {
  final String nickname;
  final String message;
  final String time;
  final bool isMine;

  const ChatMessage({
    Key? key,
    required this.nickname,
    required this.message,
    required this.time,
    this.isMine = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMine ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        if (isMine) ...[
          SizedBox(width: MediaQuery.of(context).size.width * 0.25),
        ],
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: isMine ? Colors.grey[300] : Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nickname,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isMine ? Colors.black : Colors.white,
                  ),
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: isMine ? Colors.black : Colors.white,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    time,
                    style: TextStyle(
                      fontSize: 10,
                      color: isMine ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (!isMine) ...[
          SizedBox(width: MediaQuery.of(context).size.width * 0.25),
        ],
      ],
    );
  }
}
