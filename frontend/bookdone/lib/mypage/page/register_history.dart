import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterHistory extends HookConsumerWidget {
  const RegisterHistory({super.key, required this.donationId});
  final int donationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentController = useTextEditingController();
    var content = useState('');
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
              horizontal: MediaQuery.of(context).size.width / 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('이 책은 어떠셨나요?'),
              Text('책의 후기, 책의 상태\n어떤 형태로든 책에 대한 히스토리를 남겨주세요'),
              Divider(),
              Form(
                // key: _formKey,
                child: TextField(
                  controller: contentController,
                  // onTapOutside: (event) =>
                  //     FocusManager.instance.primaryFocus?.unfocus(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  maxLength: 100,
                  maxLines: 2,
                  onChanged: (text) {
                    content.value = contentController.text;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
