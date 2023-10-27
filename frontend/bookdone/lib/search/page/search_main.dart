import 'package:bookdone/search/widgets/search_result_card.dart';
import 'package:flutter/material.dart';

class SearchMain extends StatefulWidget {
  const SearchMain({super.key});

  @override
  State<SearchMain> createState() => _SearchMainState();
}

class _SearchMainState extends State<SearchMain> {
  final _searchController = TextEditingController();

  String searchText = "";

  @override
  void initState() {
    super.initState();
    // myController에 리스너 추가
    _searchController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // 텍스트에디팅컨트롤러를 제거하고, 등록된 리스너도 제거된다.
    _searchController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    // TODO: 검색ㄱ
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        // title: Text("검색"),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {},
        // ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  // height: dou,
                  width: double.infinity,
                  child: TextField(
                    controller: _searchController,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "책 제목 검색",
                      hintStyle:
                          TextStyle(fontSize: 15, decorationThickness: 6),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              searchText = _searchController.text;
                            });
                          },
                          icon: Icon(Icons.search)),
                      suffixIconColor: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("$searchText 검색 결과"),
                ),
                SizedBox(
                  height: 10,
                ),
                SearchResultCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
