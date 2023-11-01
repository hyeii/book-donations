import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ArticleMain extends HookWidget {
  const ArticleMain({super.key});

  @override
  Widget build(BuildContext context) {
    final title = useState('바다가 들리는 편의점');
    final historyCount = useState(0);
    final donatorComment = useState('책 깨끗해용 재미써용');
    final author = useState('저자이름');
    final publisher = useState('출판사');
    final pubDate = useState('2028년 13월 32일');
    final discription = useState('기타 책 관련 설명');

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
                      "https://image.aladin.co.kr/product/32129/40/cover500/8954695051_1.jpg",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),

                // Image(
                //   image: AssetImage("assets/images/samplebookcover.jpg"),
                //   width: 200,
                // ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  title.value,
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
                      Text(
                        '${historyCount.value}개의 히스토리',
                      ),
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
                      Text(
                        donatorComment.value,
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
                      Text(
                        '${author.value} 지음',
                      ),
                      Text(
                        publisher.value,
                      ),
                      Text(
                        pubDate.value,
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
