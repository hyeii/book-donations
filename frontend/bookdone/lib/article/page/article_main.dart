import 'package:bookdone/article/model/article_data.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:bookdone/search/model/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
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
      appBar: AppBar(),
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
                                  print(id);
                                  HistoryRoute(
                                    donationId: id,
                                    title: bookData.value != null
                                        ? bookData.value!.title
                                        : '',
                                    titleUrl: bookData.value != null
                                        ? bookData.value!.titleUrl
                                        : '',
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
                      articleData.value != null
                          ? Container(
                              // margin: EdgeInsets.all(10),
                              child: GridView.builder(
                                padding: EdgeInsets.all(0),
                                shrinkWrap: true,
                                itemCount:
                                    articleData.value!.imageUrlList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, //1 개의 행에 보여줄 사진 개수
                                  childAspectRatio: 1 / 1, //사진 의 가로 세로의 비율
                                  mainAxisSpacing: 10, //수평 Padding
                                  crossAxisSpacing: 10, //수직 Padding
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  // print(
                                  //     '${articleData.value!.imageUrlList[index]}');
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        fit:
                                            BoxFit.cover, //사진을 크기를 상자 크기에 맞게 조절
                                        image: NetworkImage(articleData
                                            .value!.imageUrlList[index]),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Text(' '),
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
                        height: 50,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.brown.shade200,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 17),
                backgroundColor: Colors.brown.shade200,
                foregroundColor: Colors.white,
                shape: BeveledRectangleBorder()),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text(
                    '나눔 신청',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  content: const Text('나눔을 신청할까요?\n기부자와의 채팅이 시작됩니다'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text('취소'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text('확인'),
                    ),
                  ],
                ),
              );
            },
            child: Text(
              '나눔 요청하기',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
