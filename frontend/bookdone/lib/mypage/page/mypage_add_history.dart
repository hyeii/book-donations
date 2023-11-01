import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyPageAddHistory extends StatefulWidget {
  const MyPageAddHistory({super.key});

  @override
  State<MyPageAddHistory> createState() => _MyPageAddHistoryState();
}

class _MyPageAddHistoryState extends State<MyPageAddHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("히스토리 작성"),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {},
        // ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("보유중인 책"),
              SizedBox(
                height: 10,
              ),
              AddHitoryCard(),
              AddHitoryCard(),
              SizedBox(
                height: 10,
              ),
              Text("나를 거쳐간 책"),
              SizedBox(
                height: 10,
              ),
              AddHitoryCard(),
              AddHitoryCard(),
              AddHitoryCard(),
              AddHitoryCard(),
              AddHitoryCard(),
              AddHitoryCard(),
              CompleteHistoryCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddHitoryCard extends StatefulWidget {
  const AddHitoryCard({super.key});

  @override
  State<AddHitoryCard> createState() => _AddHitoryCardState();
}

class _AddHitoryCardState extends State<AddHitoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: CachedNetworkImage(
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  imageUrl:
                      "https://image.aladin.co.kr/product/31399/67/cover500/k452832203_1.jpg",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "바다가 들리는 편의점",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text("작성하기"),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CompleteHistoryCard extends StatefulWidget {
  const CompleteHistoryCard({super.key});

  @override
  State<CompleteHistoryCard> createState() => _CompleteHistoryCardState();
}

class _CompleteHistoryCardState extends State<CompleteHistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: Colors.black12),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: CachedNetworkImage(
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  imageUrl:
                      "https://image.aladin.co.kr/product/31399/67/cover500/k452832203_1.jpg",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "바다가 들리는 편의점",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text("작성완료"),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
