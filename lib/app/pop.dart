import 'package:flutter/material.dart';

import 'package:client/tools/toast/toast.dart';

class PopInterceptor extends StatefulWidget {
  const PopInterceptor({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<PopInterceptor> createState() => _PopInterceptorState();
}

class _PopInterceptorState extends State<PopInterceptor> {
  DateTime? _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: widget.child,
    );
  }

  Future<bool> _onWillPop() async {
    if (_lastPressedAt == null) {
      _lastPressedAt = DateTime.now();
      Toast.showText('再按一次退出App');
      return false;
    }

    final time = DateTime.now();
    if (time.difference(_lastPressedAt!) > const Duration(seconds: 1)) {
      _lastPressedAt = time;
      Toast.showText('再按一次退出App');
      return false;
    }

    return true;
  }
}
