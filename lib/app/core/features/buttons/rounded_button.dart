import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Common [ElevatedButton]
class RoundedButton extends StatelessWidget {
  const RoundedButton({

    this.text,
    this.onPressed,
    this.color,
    this.textColor,
    this.child,
    this.height = 56,
    this.margin,
    this.width,
    this.shape,
  });

  final String? text;
  final Widget? child;
  final Function()? onPressed;
  final Color? color, textColor;
  final double height;
  final EdgeInsets? margin;
  final double? width;
  final MaterialStateProperty<OutlinedBorder?>? shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width ?? double.infinity,
      margin: margin,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
            color == null ? null : MaterialStateProperty.all<Color>(color!),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ))),
        onPressed: onPressed,
        child: child == null && text != null
            ? AutoSizeText(
          text ?? '',
          style: Theme.of(context).textTheme.headline4?.copyWith(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.w500,
          ),
          minFontSize: 16.sp,
          maxLines: 1,
        )
            : child ?? const SizedBox(),
      ),
    );
  }
}