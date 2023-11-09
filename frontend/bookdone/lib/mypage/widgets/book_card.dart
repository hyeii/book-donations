import 'package:bookdone/mypage/model/my_book.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BookCard extends HookWidget {
  const BookCard({super.key, required this.book});
  final BookInfo book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: CachedNetworkImage(
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  imageUrl: book.titleUrl,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          book.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            // TODO: 히스토리 작성 팝업? 페이지?
                            HistoryRoute(donationId: book.id).push(context);
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text("히스토리"),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
