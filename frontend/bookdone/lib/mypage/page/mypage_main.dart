import 'package:flutter/material.dart';

class MyPageMain extends StatefulWidget {
  const MyPageMain({super.key});

  @override
  State<MyPageMain> createState() => _MyPageMainState();
}

class _MyPageMainState extends State<MyPageMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image(
                      image: AssetImage("assets/images/samplebookcover.jpg"),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "000님의 서재",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "책갈피 3개",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      //모서리를 둥글게
                      borderRadius: BorderRadius.circular(8)),
                  textStyle: const TextStyle(fontSize: 15),
                  backgroundColor: Colors.black12,
                  foregroundColor: Colors.white),
              child: Text(
                "히스토리 작성",
                style: TextStyle(fontFamily: "SCDream4"),
              )),
          Divider(thickness: 1, height: 1),
        ],
      ),
    );
  }
}
