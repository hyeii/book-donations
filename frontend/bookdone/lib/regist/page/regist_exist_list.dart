import 'package:bookdone/mypage/model/my_book.dart';
import 'package:bookdone/mypage/widgets/my_keeping_list.dart';
import 'package:bookdone/regist/service/scan_barcode.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class RegistExistList extends HookConsumerWidget {
  const RegistExistList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String isbn = ref.watch(getIsbnProvider);

    final restClient = ref.read(restApiClientProvider);

    var keepingList = useState<ExistList>(ExistList(info: []));

    useEffect(() {
      void fetchData() async {
        try {
          var checkData = await restClient.getMyBook();
          for (var book in checkData.data) {
            print(book.donationStatus);
          }
          print(
              ' ----------------------------- ${checkData.data.length} -------------------------------');
          List<BookInfo> keeping = [];
          await restClient.getMyBook().then((bookData) {
            for (var book in bookData.data) {
              if (book.donationStatus == 'KEEPING') {
                keeping.add(book);
              } else {
                if (book.historyResponseList.isNotEmpty) {
                  keeping.add(book);
                }
              }
            }
            keepingList.value = ExistList(info: keeping);
          });
        } catch (error) {
          print(error);
        }
      }

      fetchData();

      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("보유 리스트"),
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text("책을 선택해 등록을 진행해주세요"),
              ),
              SizedBox(
                height: 10,
              ),
              keepingList.value,
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 3 / 7,
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
              width: MediaQuery.of(context).size.width * 3 / 7,
              child: ElevatedButton(
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
                          isbn: isbn,
                          donationId: ref.read(setDonationIdProvider))
                      .push(context);
                  ref.watch(setDonationIdProvider.notifier).setId(-1);
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    fixedSize: Size(20, 100),
                    textStyle: const TextStyle(fontSize: 15),
                    backgroundColor: Colors.brown.shade300,
                    foregroundColor: Colors.white),
                child: Text("등록하기", style: TextStyle(fontFamily: "SCDream4")),
              ),
            ),
          ],
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
    return Expanded(
      child: ListView.builder(
        itemCount: info.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              curId.value = info[index].id;
              ref.watch(setDonationIdProvider.notifier).setId(info[index].id);
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
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    info[index].title,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text("마치다 소노코 지음"),
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
                                                titleUrl: info[index].titleUrl,
                                                donationId: info[index].id)
                                            .push(context);
                                      },
                                      style: TextButton.styleFrom(
                                        minimumSize: Size.zero,
                                        padding: EdgeInsets.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        foregroundColor: Colors.brown.shade600,
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
