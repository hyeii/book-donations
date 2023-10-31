import 'package:flutter/material.dart';

class AddAdditionalInfo extends StatefulWidget {
  const AddAdditionalInfo({super.key});

  @override
  State<AddAdditionalInfo> createState() => _AddAdditionalInfoState();
}

class _AddAdditionalInfoState extends State<AddAdditionalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('정보 입력'),
      ),
      body: Center(
        child: Column(
          // TODO: 닉네임 프로필사진 주소선택
          children: [
            Text('닉네임'),
            Text('프로필 이미지'),
            Text('주소'),
          ],
        ),
      ),
    );
  }
}
