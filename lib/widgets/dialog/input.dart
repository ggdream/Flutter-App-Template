import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<String?> showInputDialog([String text = '请输入内容？']) async {
  return await showDialog(
    context: Get.context!,
    builder: (ctx) => _InputView(text: text),
  );
}

class _InputView extends StatelessWidget {
  _InputView({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(text),
      content: TextField(controller: _controller),
      actions: [
        TextButton(
          onPressed: () => Get.back(result: _controller.text),
          child: const Text('确定'),
        ),
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('取消'),
        ),
      ],
    );
  }
}
