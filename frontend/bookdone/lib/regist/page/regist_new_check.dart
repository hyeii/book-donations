import 'package:bookdone/regist/service/scan_barcode.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:bookdone/search/model/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistNewCheck extends HookConsumerWidget {
  const RegistNewCheck({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String isbn = ref.watch(getIsbnProvider);
    final restClient = useMemoized(() => RestClient(Dio()));

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
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
              FutureBuilder(
                future: restClient.getDetailBook(isbn),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data == null) {
                    return SizedBox.shrink();
                  }
                  final bookDetail = snapshot.data!.data;
                  debugPrint(bookDetail.toString());

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        width: 120,
                        imageUrl: bookDetail.titleUrl,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(bookDetail.title),
                            Text(bookDetail.author),
                            Text(bookDetail.publisher),
                            Text("2099-99-99"),
                            Text(isbn)
                            // TODO: 길이 조정
                          ],
                        ),
                      )
                    ],
                  );
                },
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
