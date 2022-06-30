import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String buttonTitle;
  final TextStyle textStyle;
  final BoxDecoration boxDecoration;
  final VoidCallback? onPressed;
  final double? width;

  AppButton({
    required this.buttonTitle,
    required this.textStyle,
    required this.boxDecoration,
    this.width,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(16),
        decoration: boxDecoration,
        child: Center(
            child: Text(
          buttonTitle,
          style: textStyle,
        )),
      ),
    );
  }
}
