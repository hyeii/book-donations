import 'dart:convert';

import 'package:bookdone/bookinfo/model/region.dart';
import 'package:bookdone/onboard/model/user_res.dart';
import 'package:bookdone/onboard/page/add_complete.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddAdditionalInfo extends HookConsumerWidget {
  const AddAdditionalInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nickNameController = useTextEditingController();
    // final restClient = useMemoized(() => RestClient(Dio()));
    final restClient = ref.read(restApiClientProvider);
    var nickName = useState('');
    var regionCode = useState('');
    var regionName = useState('지역을 선택해주세요');
    var validate = useState(0);
    // 0 : 확인 전, 1 : 확인 후 사용 가능, 2 : 확인 후 사용 불가능, 3 : 입력안함
    var regionList = useState<List<Region>>([]);
    var secondRegionList = useState<List<SecondList>>([]);
    var selectedRegionIndex = useState(0);
    var firstRegionIndex = useState(0);
    var selectedRegionCode = useState('');
    // XFile? _pickedFile; // XFile
    final imageSize = MediaQuery.of(context).size.width / 5;

    // _getCameraImage() async {
    //   final pickedFile =
    //       await ImagePicker().pickImage(source: ImageSource.camera);
    //   if (pickedFile != null) {
    //     // setState(() {
    //       _pickedFile = pickedFile;
    //     // });
    //   } else {
    //     if (kDebugMode) {
    //       print('이미지 선택안함');
    //     }
    //   }
    // }

    // _getPhotoLibraryImage() async {
    //   final pickedFile =
    //       await ImagePicker().pickImage(source: ImageSource.gallery);
    //   if (pickedFile != null) {
    //     setState(() {
    //       _pickedFile = _pickedFile;
    //     });
    //   } else {
    //     if (kDebugMode) {
    //       print('이미지 선택안함');
    //     }
    //   }
    // }

    // _showBottomSheet() {
    //   return showModalBottomSheet(
    //     context: context,
    //     shape: const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.vertical(
    //         top: Radius.circular(25),
    //       ),
    //     ),
    //     builder: (context) {
    //       return Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           ElevatedButton(
    //             onPressed: () => _getCameraImage(),
    //             child: const Text('사진찍기'),
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           const Divider(
    //             thickness: 1,
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           ElevatedButton(
    //             onPressed: () => _getPhotoLibraryImage(),
    //             child: const Text('라이브러리에서 불러오기'),
    //           ),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }
    Future<void> readJson() async {
      // final regionData =
      //     await rootBundle.loadString('assets/json/localcode.json');
      // _regionList = RegionList.fromJson(regionData).regions ?? <Region>[];
      // notifyListeners();
      final res = await rootBundle.loadString("assets/json/localcode.json");
      final data = await json.decode(res);
      regionList.value = List<Region>.from(data['region']);
    }

    void selectAddress(context) {
      showDialog(
        context: context,
        builder: (context) {
          // readJson();
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        "지역을 선택해주세요",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: regionList.value.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // secondRegionList.value =
                                      //     regionList.value[index].secondList;
                                      // // _secondRegionListIndex = index;
                                      // selectedRegionIndex.value = 0;
                                      // firstRegionIndex.value = index;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        decoration: firstRegionIndex.value ==
                                                index
                                            ? BoxDecoration(
                                                color: Colors.brown.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(10))
                                            : BoxDecoration(
                                                color: Colors.white),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4.0, bottom: 4.0),
                                          child: Center(
                                            child: Text(
                                                // regionList.value[index].first,
                                                ""
                                                // style: TextStyle(
                                                //     color:
                                                //         firstRegionIndex.value ==
                                                //                 index
                                                //             ? Colors.white
                                                //             : Colors.black,
                                                //     fontWeight:
                                                //         firstRegionIndex.value ==
                                                //                 index
                                                //             ? FontWeight.bold
                                                //             : FontWeight.normal),
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            // if (_secondRegionList.isNotEmpty)
                            Expanded(
                              child: ListView.builder(
                                itemCount: secondRegionList.value.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      selectedRegionCode.value =
                                          secondRegionList.value[index].code;
                                      selectedRegionIndex.value = index;
                                      // _selectedRegion = _secondRegionList[
                                      //     _selectedRegionIndex]["name"];
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        decoration: selectedRegionIndex.value ==
                                                index
                                            ? BoxDecoration(
                                                color: Colors.brown.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(10))
                                            : BoxDecoration(
                                                color: Colors.white),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4.0, bottom: 4.0),
                                          child: Center(
                                            child: Text(
                                              secondRegionList
                                                  .value[index].second,
                                              style: TextStyle(
                                                  color: selectedRegionIndex
                                                              .value ==
                                                          index
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontWeight:
                                                      selectedRegionIndex
                                                                  .value ==
                                                              index
                                                          ? FontWeight.bold
                                                          : FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            // if (_secondRegionList.isEmpty) Text("선택 ㄱㄱ")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: 지역코드 서버로 보내기

                            regionName.value = secondRegionList
                                .value[selectedRegionIndex.value].name;
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: Colors.brown.shade200,
                            foregroundColor: Colors.white,
                          ),
                          child: Text(
                            "완료",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        },
      );
    }

    Future<void> _checkValidAlert() async {
      return showDialog<void>(
        //다이얼로그 위젯 소환
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '닉네임 중복확인이 필요해요',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('확인')),
                ],
              ),
            ),
          );
        },
      );
    }

    Future<void> _checkAlert() async {
      return showDialog<void>(
        //다이얼로그 위젯 소환
        context: context,
        barrierDismissible: false, // 다이얼로그 이외의 바탕 눌러도 안꺼지도록 설정
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${nickName.value}님 입력한 정보로 회원가입을 진행할까요?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                        },
                        child: Text('취소'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await restClient.postAdditionalInfo(
                              {'nickname': nickName.value, 'address': '1122'});
                        },
                        child: Text('확인'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
          // title: Text('정보 입력'),
          ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 10),
          child: Center(
            child: Column(
              // TODO: 닉네임 프로필사진 주소선택
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  '추가 정보를 입력해주세요',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 15,
                ),
                // if (_pickedFile == null)
                Container(
                  width: imageSize,
                  height: imageSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/defaultimage.png')),
                  ),
                  // child: GestureDetector(
                  //   onTap: () {
                  //     _showBottomSheet();
                  //   },
                  // ),
                ),
                // else
                //   Container(
                //     width: imageSize,
                //     height: imageSize,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       image: DecorationImage(
                //           image: FileImage(File(_pickedFile!.path)),
                //           fit: BoxFit.cover),
                //     ),
                //   ),
                SizedBox(
                  height: 15,
                ),
                Text('닉네임을 입력해주세요'),
                SizedBox(
                  height: 15,
                ),
                Form(
                  // key: _formKey,
                  child: TextField(
                    controller: nickNameController,
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.brown,
                        ),
                      ),
                    ),
                    onChanged: (text) {
                      nickName.value = nickNameController.text;
                      print(nickNameController.text);
                      validate.value = 0;
                    },
                    maxLength: 8,
                    maxLines: 1,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (nickName.value == '') {
                      validate.value = 3;
                      return;
                    }
                    final result =
                        await restClient.checkNickname(nickName.value);
                    print(result.toString());
                    if (result.data.available) {
                      validate.value = 1;
                    } else {
                      validate.value = 2;
                    }
                    // validate.value = 1;
                  },
                  child: Text('중복확인'),
                ),
                if (validate.value == 1) Text('사용할 수 있는 닉네임입니다'),
                if (validate.value == 2) Text('이미 사용중인 닉네임입니다'),
                if (validate.value == 3) Text('닉네임을 입력해주세요'),
                SizedBox(
                  height: 10,
                ),
                Text('지역을 설정해주세요'),
                ElevatedButton(
                  onPressed: () {
                    readJson();
                    selectAddress(context);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      textStyle:
                          const TextStyle(fontSize: 13, fontFamily: "SCDream4"),
                      backgroundColor: Colors.brown.shade100,
                      foregroundColor: Colors.black87),
                  child: Wrap(
                    children: [
                      Icon(Icons.location_on, size: 17),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(regionName.value),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown.shade400,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            // TODO: 로그인 구현
            if (validate.value != 1) {
              _checkValidAlert();
              return;
            }

            _checkAlert();

            // context.goNamed('home');
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => AddComplete()));
          },
          child: Text('완료'),
        ),
      ),
    );
  }
}
