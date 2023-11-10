import 'package:bookdone/mypage/model/my_book.dart';
import 'package:bookdone/mypage/widgets/my_donating_list.dart';
import 'package:bookdone/mypage/widgets/my_keeping_list.dart';
import 'package:bookdone/onboard/repository/user_repository.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:bookdone/top/page/top_navigation_bar.dart';
import 'package:bookdone/widgets/floating_register_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPageMain extends HookConsumerWidget {
  MyPageMain({Key? key}) : super(key: key);

  final List<Tab> tabs = <Tab>[
    Tab(
      text: '기부 중',
    ),
    Tab(
      text: "보유 중",
    ),
    Tab(
      text: "관심도서",
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _tabController =
        useTabController(initialLength: tabs.length, initialIndex: 0);
    final restClient = ref.read(restApiClientProvider);
    var nickname = useState('');
    var point = useState(0);
    var donatingBook = useState<List<BookInfo>>([]);
    var keepingBook = useState<List<BookInfo>>([]);
    // ref.read(userDataRepositoryProvider).restoreNickname().then((value) => {nickname=value});

    // Future<String> getUser() async {
    //   SharedPreferences pref = await SharedPreferences.getInstance();
    //   String name = pref.getString('nickname') ?? '';
    //   return name;
    // }
    var repository = ref.read(userDataRepositoryProvider);
    useEffect(() {
      void fetchData() async {
        try {
          repository.restoreNickname().then((name) {
            nickname.value = name;
          }).catchError((error) {
            print(error);
          });
          repository.restorePoint().then((value) {
            point.value = value;
          }).catchError((error) {
            print(error);
          });
          restClient.getMyBook().then((bookData) {
            for (var book in bookData.data) {
              if (book.donationStatus == 'keeping') {
                keepingBook.value.add(book);
              } else {
                if (book.historyResponseList.isNotEmpty) {
                  keepingBook.value.add(book);
                }
                donatingBook.value.add(book);
              }
            }
          });
        } catch (error) {
          print(error);
        }
      }

      fetchData();

      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 8),
            child: Column(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image(
                              image: AssetImage(
                                  "assets/images/samplebookcover.jpg"),
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${nickname.value}님의 서재"),
                              Text("책갈피 ${point.value}개"),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () {
                          NotificationRoute().push(context);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      onPressed: () {
                        AddHistoryRoute().push(context);
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5.0),
                          // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                              //모서리를 둥글게
                              borderRadius: BorderRadius.circular(8)),
                          textStyle: const TextStyle(fontSize: 12),
                          backgroundColor: Colors.brown,
                          foregroundColor: Colors.white),
                      child: Text(
                        "히스토리 작성",
                        style: TextStyle(fontFamily: "SCDream4"),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TabBar(
            tabs: tabs,
            controller: _tabController,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.brown,
            indicatorSize: TabBarIndicatorSize.tab,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            labelColor: Colors.black,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 12),
                  child: MyDonatingList(
                    donatingList: donatingBook.value,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 12),
                  child: MyKeepingList(
                    keepingList: keepingBook.value,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 12),
                  child: MyKeepingList(
                    keepingList: keepingBook.value,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: TopNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingRegisterBtn(),
    );
  }
}
