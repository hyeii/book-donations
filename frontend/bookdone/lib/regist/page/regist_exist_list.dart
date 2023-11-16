import 'package:bookdone/mypage/model/my_book.dart';
import 'package:bookdone/regist/service/scan_barcode.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class RegistExistList extends HookConsumerWidget {
  const RegistExistList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String isbn = ref.watch(getIsbnProvider);

    final restClient = ref.read(restApiClientProvider);

    var infoText = useState('');

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("책을 선택해주세요"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 12),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(infoText.value),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: restClient.getMyBook(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data == null) {
                    // return SizedBox.shrink();
                    return SizedBox(
                      height: 10,
                    );
                  }
                  final booklist = snapshot.data!.data;
                  List<BookInfo> equalList = [];
                  for (var book in booklist) {
                    if (book.isbn == isbn) {
                      equalList.add(book);
                    }
                  }

                  return ExistList(info: equalList);
                },
              )
            ],
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
              if (ref.read(setDonationIdProvider) == -1) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('책을 선택해주세요'))),
                    );
                  },
                );
                return;
              }
              RegisterRoute(
                      isbn: isbn, donationId: ref.read(setDonationIdProvider))
                  .push(context);
              ref.watch(setDonationIdProvider.notifier).setId(-1);
            },
            child: Text(
              '등록하기',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}

class ExistList extends HookConsumerWidget {
  const ExistList({super.key, required this.info});
  final List<BookInfo> info;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var curId = useState(-1);
    return info.isEmpty
        ? Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                SvgPicture.asset(
                  'assets/images/undraw_notify.svg',
                  height: 150,
                ),
                SizedBox(
                  height: 50,
                ),
                Text('해당하는 책을 보유하고 있지 않습니다', style: TextStyle(fontSize: 13)),
              ],
            ),
          )
        : Expanded(
            child: ListView.builder(
              itemCount: info.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    curId.value = info[index].id;
                    ref
                        .watch(setDonationIdProvider.notifier)
                        .setId(info[index].id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      width: double.infinity,
                      height: 110,
                      decoration: BoxDecoration(
                        color: curId.value == info[index].id
                            ? Color.fromARGB(255, 211, 205, 199)
                            : Colors.white,
                        border: Border.all(
                          color: curId.value == info[index].id
                              ? Color.fromARGB(255, 211, 205, 199)
                              : Colors.black12,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: CachedNetworkImage(
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                                imageUrl: info[index].titleUrl,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          info[index].title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(info[index].isbn),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            '${info[index].historyResponseList.length}개의 히스토리'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          alignment: Alignment.bottomRight,
                                          child: TextButton(
                                            onPressed: () {
                                              HistoryRoute(
                                                      title: info[index].title,
                                                      titleUrl:
                                                          info[index].titleUrl,
                                                      donationId:
                                                          info[index].id)
                                                  .push(context);
                                            },
                                            style: TextButton.styleFrom(
                                              minimumSize: Size.zero,
                                              padding: EdgeInsets.zero,
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              foregroundColor:
                                                  Colors.brown.shade600,
                                            ),
                                            child: Text(
                                              "히스토리 보기",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}

@riverpod
class SetDonationId extends Notifier<int> {
  @override
  int build() {
    return -1;
  }

  Future<void> setId(int id) async {
    state = id;
  }
}

final setDonationIdProvider =
    NotifierProvider<SetDonationId, int>(SetDonationId.new);
