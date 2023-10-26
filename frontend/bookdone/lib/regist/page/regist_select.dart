import 'package:flutter/material.dart';

class RegistSelect extends StatefulWidget {
  const RegistSelect({super.key});

  @override
  State<RegistSelect> createState() => _RegistSelectState();
}

class _RegistSelectState extends State<RegistSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "등록하기",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Container(),
    );
  }
}
