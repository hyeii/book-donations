import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegistData extends StatefulWidget {
  const RegistData({super.key});

  @override
  State<RegistData> createState() => _RegistDataState();
}

class _RegistDataState extends State<RegistData> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  List<XFile> _pickedImgs = [];

  Future<void> _pickImg() async {
    final List<XFile> images = await _picker.pickMultiImage();
    setState(() {
      _pickedImgs = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> boxContents = [
      IconButton(
        onPressed: () {
          _pickImg();
        },
        icon: Container(
          alignment: Alignment.center,
          child: Icon(Icons.camera_alt_rounded),
        ),
      ),
      Container(),
      Container(),
      Container(),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "등록하기",
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      width: 120,
                      imageUrl:
                          "https://image.aladin.co.kr/product/32129/40/cover500/8954695051_1.jpg",
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
                          Text("책 제목 냠냠"),
                          Text("출판사 정보 냠냠"),
                          Text("2099-99-99"),
                          Text("ISBN")
                          // TODO: 길이 조정
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text("기부자"),
                        ),
                        Flexible(child: Text("냠냠")),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text("지역"),
                        ),
                        Flexible(child: Text("서울시 구로구")),
                        SizedBox(
                          width: 15,
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO: 주소 변경 모달. 기존 bookinfo detail 페이지와 동일
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.brown.shade200,
                            minimumSize: Size.zero,
                            padding: EdgeInsets.symmetric(
                                horizontal: 7, vertical: 3),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            "변경",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("내용"),
                    SizedBox(
                      height: 10,
                    ),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          fillColor: Colors.brown,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.brown,
                            ),
                          ),
                        ),
                        maxLength: 300,
                        maxLines: 3,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("사진 업로드"),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 100,
                      child: GridView.count(
                        crossAxisCount: 4,
                        crossAxisSpacing: 5,
                        children: List.generate(
                          4,
                          (index) => DottedBorder(
                            color: Colors.grey,
                            dashPattern: [4, 3],
                            strokeWidth: 2,
                            borderType: BorderType.RRect,
                            radius: Radius.circular(10),
                            child: Container(
                              decoration: index <= _pickedImgs.length - 1
                                  ? BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(
                                          File(_pickedImgs[index].path),
                                        ),
                                      ),
                                    )
                                  : null,
                              child: Center(
                                child: boxContents[index],
                              ),
                            ),
                          ),
                        ).toList(),
                      ),
                    ),
                    Text("확인용")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
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
        ),
      ),
    );
  }
}
