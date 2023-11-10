import 'package:bookdone/article/model/article_data.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:bookdone/search/model/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticleMain extends HookConsumerWidget {
  const ArticleMain({super.key, required this.isbn, required this.id});
  final String isbn;
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pubDate = useState('2028년 13월 32일');
    final discription = useState('기타 책 관련 설명');
    final restClient = ref.read(restApiClientProvider);
    final articleData = useState<ArticleData?>(null);
    final bookData = useState<BookData?>(null);

    Future<ArticleData> getArticleInfo() async {
      ArticleRespByid data = await restClient.getArticleById(id);
      ArticleData articleInfo = data.data;
      print('아티클인포여기얌여기############ ${articleInfo}');
      return articleInfo;
    }

    Future<BookData> getBookInfo() async {
      BookDetail data = await restClient.getDetailBook(isbn);
      BookData bookInfo = data.data;
      print('북인포여기얌여기############ ${bookInfo}');
      return bookInfo;
    }

    useEffect(() {
      getArticleInfo().then((articleInfo) {
        articleData.value = articleInfo;
      }).catchError((error) {
        print(error);
      });
      getBookInfo().then((bookInfo) {
        bookData.value = bookInfo;
      }).catchError((error) {
        print(error);
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.transparent,
          // elevation: 0,
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     // TODO: 뒤로가기 처리
          //   },
          // ),
          ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 10),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CachedNetworkImage(
                  width: 200,
                  imageUrl:
                      bookData.value != null ? bookData.value!.titleUrl : '',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  bookData.value != null ? bookData.value!.title : '',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(thickness: 1, height: 1),
                      SizedBox(
                        height: 20,
                      ),
                      if (articleData.value != null)
                        articleData.value!.historyResponseList.isNotEmpty
                            ? GestureDetector(
                                onTap: () {
                                  HistoryRoute(
                                    donationId: id,
                                  ).push(context);
                                },
                                child: Text(
                                  '${articleData.value!.historyResponseList.length}개의 히스토리',
                                ),
                              )
                            : Text('히스토리가 없습니다'),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(thickness: 1, height: 1),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "기부자의 글",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (articleData.value != null)
                        Text(
                          articleData.value!.content,
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(thickness: 1, height: 1),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "책 정보",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (bookData.value != null)
                        Text(
                          bookData.value!.author,
                        ),
                      Text(
                        bookData.value != null ? bookData.value!.publisher : '',
                      ),
                      Text(
                        bookData.value != null ? bookData.value!.isbn : '',
                      ),
                      Text(
                        discription.value,
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                // TODO: alert 확인창x
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      //모서리를 둥글게
                      borderRadius: BorderRadius.circular(15)),
                  fixedSize: Size(20, 100),
                  textStyle: const TextStyle(fontSize: 18),
                  backgroundColor: Colors.brown[300],
                  foregroundColor: Colors.white),
              child: Text(
                "나눔 요청하기",
                style: TextStyle(fontFamily: "SCDream4"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
