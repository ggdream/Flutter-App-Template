import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:client/widgets/monitor/monitor.dart';

class Monitor extends StatelessWidget {
  const Monitor({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MonitorView(
      onResumed: _onResumed,
      child: child,
    );
  }

  Future<void> _onResumed() async {
    if (!await Clipboard.hasStrings()) return;

    final data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data == null || data.text == null) return;
    await _handleData(data.text!);

    await Clipboard.setData(const ClipboardData());
  }

  Future<void> _handleData(String text) async {
    log(text);
  }
}
