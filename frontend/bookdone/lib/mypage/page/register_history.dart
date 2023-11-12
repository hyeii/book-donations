import 'package:bookdone/rest_api/rest_client.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterHistory extends HookConsumerWidget {
  const RegisterHistory(
      {super.key,
      required this.donationId,
      required this.title,
      required this.titleUrl});
  final int donationId;
  final String title;
  final String titleUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentController = useTextEditingController();
    final restClient = ref.read(restApiClientProvider);
    var content = useState('');
    var validate = useState(false);

    Future<bool> tryPostHistory() async {
      var resp = await restClient.postHistory(
        donationId,
        {'content': content.value, 'status': " WRITTEN"},
      );
      if (resp.success == true) {
        return true;
      } else {
        return false;
      }
    }

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
                SizedBox(
                  height: 15,
                ),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(
                  height: 15,
                ),
                Text('이 책은 어떠셨나요?'),
                Text('책의 후기, 책의 상태\n어떤 형태로든 책에 대한 히스토리를 남겨주세요'),
                SizedBox(
                  height: 15,
                ),
                Form(
                  // key: _formKey,
                  child: TextField(
                    style: TextStyle(fontSize: 12),
                    controller: contentController,

                    // onTapOutside: (event) =>
                    //     FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: '히스토리를 남겨주세요',
                      filled: true,
                      fillColor: Color.fromARGB(255, 240, 240, 240),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 240, 240, 240),
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 240, 240, 240),
                        ),
                      ),
                    ),
                    maxLength: 300,
                    maxLines: 13,
                    onChanged: (text) {
                      content.value = contentController.text;
                      if (contentController.text != '') {
                        validate.value = true;
                      } else {
                        validate.value = false;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: SafeArea(
          child: Container(
            width: double.infinity,
            color: Colors.brown.shade200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 17),
                  backgroundColor: Colors.brown.shade200,
                  foregroundColor: Colors.white,
                  shape: BeveledRectangleBorder()),
              onPressed: () async {
                if (!validate.value) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('히스토리를 입력해주세요'),
                          ),
                        ),
                      );
                    },
                  );
                  return;
                } else {
                  if (await tryPostHistory()) {
                    // TODO: dialog 생성
                    MyPageRoute().go(context);
                  }
                }
              },
              child: Text(
                '등록하기',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ),
        ));
  }
}
