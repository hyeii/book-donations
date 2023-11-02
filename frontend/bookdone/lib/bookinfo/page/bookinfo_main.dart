import 'package:bookdone/bookinfo/widgets/book_comment.dart';
import 'package:bookdone/bookinfo/widgets/comment_input.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookinfoMain extends StatefulWidget {
  const BookinfoMain({super.key});

  @override
  State<BookinfoMain> createState() => _BookinfoMainState();
}

class _BookinfoMainState extends State<BookinfoMain> {
  late bool validationResult;
  @override
  void initState() {
    validationResult = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                  height: 20,
                ),
                Text(
                  "바다가 들리는 편의점",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(thickness: 1, height: 1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "책 정보",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "저자정보",
                    ),
                    Text(
                      "출판사정보",
                    ),
                    Text(
                      "발행일",
                    ),
                    Text(
                      "기타 설명",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(thickness: 1, height: 1),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed('bookinfodetail');
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          //모서리를 둥글게
                          borderRadius: BorderRadius.circular(15)),
                      fixedSize: Size(110, 40),
                      textStyle: const TextStyle(fontSize: 15),
                      backgroundColor: Colors.brown[300],
                      foregroundColor: Colors.white),
                  child: Text(
                    "찾아보기",
                    style: TextStyle(fontFamily: "SCDream4"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(thickness: 1, height: 1),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "댓글",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CommentInput(),

                BookComment(),
                BookComment(),
                BookComment(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
