import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class Toast {
  Toast._();

  static ToastFuture showText(
    String text, {
    BuildContext? context,
    Duration? duration,
    ToastPosition? position,
    TextStyle? textStyle,
    EdgeInsetsGeometry? textPadding,
    Color? backgroundColor,
    double? radius,
    VoidCallback? onDismiss,
    TextDirection? textDirection,
    bool? dismissOtherToast,
    TextAlign? textAlign,
    OKToastAnimationBuilder? animationBuilder,
    Duration? animationDuration,
    Curve? animationCurve,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin = const EdgeInsets.all(50),
  }) =>
      showToast(text);
}
