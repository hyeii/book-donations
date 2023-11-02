import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RegistExistList extends StatefulWidget {
  const RegistExistList({super.key});

  @override
  State<RegistExistList> createState() => _RegistExistListState();
}

class _RegistExistListState extends State<RegistExistList> {
  @override
  Widget build(BuildContext context) {
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
              ExistCard(),
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
                    backgroundColor: Colors.brown.shade300,
                    foregroundColor: Colors.white),
                child: Text("등록하기"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExistCard extends StatefulWidget {
  const ExistCard({super.key});

  @override
  State<ExistCard> createState() => _ExistCardState();
}

class _ExistCardState extends State<ExistCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          width: double.infinity,
          height: 110,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    imageUrl:
                        "https://image.aladin.co.kr/product/31399/67/cover500/k452832203_1.jpg",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
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
                              "바다가 들리는 편의점",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("마치다 소노코 지음"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("2개의 히스토리"),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                onPressed: () {},
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
  }
}
