import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ChatMessage extends HookWidget {
  final String senderNickname;
  final String message;
  final String createdAt;
  final bool isMine;

  const ChatMessage({
    Key? key,
    required this.senderNickname,
    required this.message,
    required this.createdAt,
    this.isMine = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String datePart = createdAt.substring(2, 10); // "YYYY-MM-DD"
    String timePart = createdAt.substring(10, 16); // "HH:MM"

    // 최종적으로 표시할 문자열 조합
    String formattedDateTime = '$datePart $timePart';

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
              child: Text(
                senderNickname,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 102, 102, 102),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (isMine)
                Flexible(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        formattedDateTime,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 102, 102, 102),
                        ),
                      ),
                    ),
                  ),
                ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: isMine
                      ? Colors.grey[300]
                      : Color.fromARGB(255, 140, 135, 130),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    color: isMine ? Colors.black : Colors.white,
                  ),
                ),
              ),
              if (!isMine) ...[
                Flexible(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        formattedDateTime,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 102, 102, 102),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
