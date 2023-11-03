import 'package:bookdone/onboard/page/add_complete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';

class AddAdditionalInfo extends HookWidget {
  const AddAdditionalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    // final _formKey = GlobalKey<FormState>();
    final nickNameController = useTextEditingController();
    var nickName = useState('');
    var regionCode = useState(0);
    var validate = useState(false);

    // XFile? _pickedFile; // XFile
    final imageSize = MediaQuery.of(context).size.width / 4;

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
                  '안녕하세요 추후수정',
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
                Text('닉네임을 입력해주세요'),
                Form(
                  // key: _formKey,
                  child: TextField(
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    maxLength: 8,
                    maxLines: 1,
                    // onSaved: (value) {
                    //   // comment = value!;
                    // },
                    // validator: (value) {
                    //   if (value!.isEmpty) return "닉네임을 입력해주세요.";
                    //   return null;
                    // },
                  ),
                  onChanged: () {
                    nickName.value = nickNameController.text;
                    validate.value = false;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: 닉네임 중복 확인
                    // validate.value = true;
                  },
                  child: Text('중복확인'),
                ),
                if (validate.value) Text('사용할 수 있는 닉네임입니다'),
                SizedBox(
                  height: 10,
                ),
                Text('지역을 설정해주세요'),
                ElevatedButton(
                  onPressed: () {
                    // readJson();
                    // selectAddress(context);
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
                      Text('처음주소'),
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
            if (!validate.value) {
              // TODO: 닉네임 중복확인 dialog
              return;
            }

            // TODO: 입력된 정보로 책도네를 시작할까요????

            // context.goNamed('home');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddComplete()));
          },
          child: Text('완료'),
        ),
      ),
    );
  }
}
