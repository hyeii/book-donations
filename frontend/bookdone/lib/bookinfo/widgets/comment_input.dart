import 'package:bookdone/rest_api/rest_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommentInput extends HookConsumerWidget {
  const CommentInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    String comment = "";

    void _tryValidation() {
      final isValid = _formKey.currentState!.validate();
      if (isValid) {
        _formKey.currentState!.save();
      }
    }

    return Column(
      children: [
        Form(
          key: _formKey,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
            onSaved: (value) {
              comment = value!;
            },
            validator: (value) {
              if (value!.isEmpty) return "댓글을 입력해주세요.";
              return null;
            },
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            _tryValidation();
            await ref.read(restApiClientProvider).postComment({
              "isbn": "9999999999",
              "writer": "현재 사용자",
              "review": comment,
            });
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              fixedSize: Size(double.maxFinite, 40),
              textStyle: const TextStyle(fontSize: 15, fontFamily: "SCDream4"),
              backgroundColor: Colors.brown[200],
              foregroundColor: Colors.white),
          child: const Text(
            "등록",
          ),
        )
      ],
    );
  }
}
