import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  FontWeight? fontWeight;
  bool isTitle;
  int maxLines;
  TextWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.textSize,
    this.isTitle = false,
    this.maxLines = 10,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: textSize,
        fontWeight: fontWeight ?? (isTitle ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
