import 'package:bookdone/bookinfo/model/book_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CommentCard extends HookWidget {
  const CommentCard({super.key, required this.comment});

  final Comment comment;
  // var create = comment.createdAt.year;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              comment.writer,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                '${comment.createdAt.year}-${comment.createdAt.month}-${comment.createdAt.day} ${comment.createdAt.hour}:${comment.createdAt.minute}')
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              comment.review,
              style: TextStyle(fontSize: 17),
            )),
        SizedBox(
          height: 20,
        ),
        Divider(thickness: 1, height: 1),
      ],
    );
  }
}
