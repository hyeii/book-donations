import 'package:bookdone/regist/service/scan_barcode.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistNewCheck extends HookConsumerWidget {
  const RegistNewCheck({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String isbn = ref.watch(getIsbnProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        // title: Text("보유 리스트"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 12),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    width: 120,
                    imageUrl:
                        "https://image.aladin.co.kr/product/32129/40/cover500/8954695051_1.jpg",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("책 제목 냠냠"),
                      Text("출판사 정보 냠냠"),
                      Text("2099-99-99"),
                      Text("ISBN")
                      // TODO: 길이 조정
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("위의 책 정보가 맞는지 확인해주세요."),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 170,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: alert 확인창x
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    fixedSize: Size(20, 100),
                    textStyle: const TextStyle(fontSize: 15),
                    backgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.grey.shade600),
                child: Text(
                  "돌아가기",
                  style: TextStyle(fontFamily: "SCDream4"),
                ),
              ),
            ),
            SizedBox(
              width: 170,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: alert 확인창x
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    fixedSize: Size(20, 100),
                    textStyle: const TextStyle(fontSize: 15),
                    backgroundColor: Colors.brown[300],
                    foregroundColor: Colors.white),
                child: Text(
                  "계속하기",
                  style: TextStyle(fontFamily: "SCDream4"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
