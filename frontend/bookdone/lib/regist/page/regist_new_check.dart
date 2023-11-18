import 'package:bookdone/regist/service/scan_barcode.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:bookdone/search/model/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistNewCheck extends HookConsumerWidget {
  const RegistNewCheck({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String isbn = ref.watch(getIsbnProvider);
    final restClient = ref.read(restApiClientProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            StartPageRoute().go(context);
            ref.invalidate(getIsbnProvider);
          },
        ),
      ),
      body: SafeArea(
        child: Center(
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
                          errorWidget: (context, url, error) => Image(
                              image: AssetImage(
                                  'assets/images/sample-bookdone.png')),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bookDetail.title,
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(bookDetail.author),
                              SizedBox(
                                height: 5,
                              ),
                              Text(bookDetail.publisher),
                              SizedBox(
                                height: 5,
                              ),
                              Text('ISBN $isbn')
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
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    SvgPicture.asset(
                      'assets/images/undraw_check.svg',
                      height: 150,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text('위의 책 정보가 맞는지 확인해주세요', style: TextStyle(fontSize: 13)),
                  ],
                ),
                SizedBox(
                  height: 10,
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
              RegisterRoute(isbn: isbn, donationId: -1).push(context);
            },
            child: Text(
              '계속하기',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
