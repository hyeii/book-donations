import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleMain extends StatefulWidget {
  const ArticleMain({super.key});

  @override
  State<ArticleMain> createState() => _ArticleMainState();
}

class _ArticleMainState extends State<ArticleMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // TODO: 뒤로가기 처리
          },
        ),
      ),
      body: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  "바다가 들리는 편의점",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(
                    children: [
                      Divider(thickness: 1, height: 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: SizedBox(
                          width: 350,
                          child: Text(
                            "히스토리 개수",
                            style: TextStyle(),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      Divider(thickness: 1, height: 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 350,
                              child: Text(
                                "기부자의 글",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(
                              width: 350,
                              child: Text(
                                "책 깨끗깨끗 완전 재밌음",
                                style: TextStyle(),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 1, height: 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 350,
                              child: Text(
                                "책 정보",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(
                              width: 350,
                              child: Text(
                                "저자정보",
                                style: TextStyle(),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(
                              width: 350,
                              child: Text(
                                "출판사정보",
                                style: TextStyle(),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(
                              width: 350,
                              child: Text(
                                "발행일",
                                style: TextStyle(),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(
                              width: 350,
                              child: Text(
                                "기타 설명",
                                style: TextStyle(),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                // TODO: alert 확인창
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      //모서리를 둥글게
                      borderRadius: BorderRadius.circular(15)),
                  fixedSize: Size(20, 100),
                  textStyle: const TextStyle(fontSize: 18),
                  backgroundColor: Colors.black12,
                  foregroundColor: Colors.white),
              child: Text("나눔 요청하기"),
            ),
          ),
        ),
      ),
    );
  }
}
