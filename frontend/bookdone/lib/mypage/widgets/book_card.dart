import 'package:bookdone/bookinfo/model/donation.dart';
import 'package:bookdone/mypage/model/my_book.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookCard extends HookConsumerWidget {
  const BookCard({super.key, required this.book, required this.isLike});
  final BookInfo book;
  final bool isLike;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restClient = ref.read(restApiClientProvider);

    Future<void> setLikesNotification() async {
      BooksLikeResp bookslikes = await restClient.setBooksLikes({
        'localCode': '9999',
        'isbn': book.isbn,
      });
      print(bookslikes.data);
    }

    void likeAlert(context) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            '관심도서 해제',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          content: Text('관심도서에서 해제되었습니다.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('확인'),
            ),
          ],
        ),
      );
    }

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
                      isLike == false
                          ? Container(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                onPressed: () {
                                  HistoryRoute(
                                    donationId: book.id,
                                    title: book.title,
                                    titleUrl: book.titleUrl,
                                  ).push(context);
                                },
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text("히스토리"),
                              ),
                            )
                          : Container(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                onPressed: () {
                                  setLikesNotification();
                                  likeAlert(context);
                                },
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text("관심도서 해제"),
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
