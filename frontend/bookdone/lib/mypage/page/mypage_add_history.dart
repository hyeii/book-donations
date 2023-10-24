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
        // backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          "히스토리 작성",
          style: TextStyle(
            fontSize: 20,
            // fontWeight: FontWeight.bold,
            // color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 40.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text("보유중인 책"),
              ),
            ),
            SizedBox(
              width: 370,
              height: 110,
              child: AddHitoryCard(),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text("나를 거쳐간 책"),
              ),
            ),
            SizedBox(
              width: 370,
              height: 110,
              child: AddHitoryCard(),
            ),
          ],
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
    return Scaffold(
        body: Container(
      width: 370,
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
              child: Image(
                image: AssetImage("assets/images/samplebookcover.jpg"),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "바다가 들리는 편의점",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          "작성하기",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
