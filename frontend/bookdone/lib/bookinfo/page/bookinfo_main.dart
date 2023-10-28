import 'package:bookdone/bookinfo/page/bookinfo_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.only(left: 50, right: 50),
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BookinfoDetail()));
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

class BookComment extends StatefulWidget {
  const BookComment({super.key});

  @override
  State<BookComment> createState() => _BookCommentState();
}

class _BookCommentState extends State<BookComment> {
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
              "작성자이름",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("2099-99-99")
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "오늘 점심 영양닭죽 나박물김치 너비아니엿장조림 샐러드 드레싱 제육비빔밥 후라이 미역국 나는 닭죽먹을래",
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

class CommentInput extends StatefulWidget {
  const CommentInput({super.key});

  @override
  State<CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends State<CommentInput> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.brown,
                ),
              ),
            ),
            maxLength: 100,
            maxLines: 2,
            onSaved: (value) {},
            validator: (value) {
              if (value != null) return "댓글을 입력해주세요.";
              return null;
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            final formKeyState = _formKey.currentState!;
            if (formKeyState.validate()) {
              formKeyState.save();
            }
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              fixedSize: Size(double.maxFinite, 40),
              textStyle: const TextStyle(fontSize: 15, fontFamily: "SCDream4"),
              backgroundColor: Colors.brown[200],
              foregroundColor: Colors.white),
          child: const Text(
            "등록",
          ),
        )
      ],
    );
  }
}
