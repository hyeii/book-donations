import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterInputNotifier extends StateNotifier<String> {
  RegisterInputNotifier(this.ref) : super('');
  final Ref ref;

  Future<void> setContent(String input) async {
    state = input;
  }
}

final registerInputProvider =
    StateNotifierProvider<RegisterInputNotifier, String>(
        (ref) => RegisterInputNotifier(ref));

class RegisterInputContent extends HookConsumerWidget {
  const RegisterInputContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentController = useTextEditingController();
    var content = useState('');
    return Form(
      child: TextFormField(
        scrollPadding: EdgeInsets.only(bottom: 120),
        controller: contentController,
        decoration: const InputDecoration(
          fillColor: Colors.brown,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.brown,
            ),
          ),
        ),
        onChanged: (text) {
          ref
              .watch(registerInputProvider.notifier)
              .setContent(contentController.text);
          // content.value = contentController.text;
        },
        maxLength: 300,
        maxLines: 3,
      ),
    );
  }
}
