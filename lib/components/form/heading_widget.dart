import 'package:flutter/material.dart';
import "../../model/index.dart";

class HeadingWidget extends StatefulWidget {
  QuestionObj questionObj;

  HeadingWidget({Key? key, required this.questionObj}) : super(key: key);

  @override
  State<HeadingWidget> createState() => _HeadingState();
}

class _HeadingState extends State<HeadingWidget> {
  late String title;
  late double fontSize;
  late bool isVisible;

  @override
  void initState() {
    super.initState();
    title = widget.questionObj.title;
    fontSize = widget.questionObj.answerFontSize;
    isVisible = widget.questionObj.isVisible;
  }

  Alignment getAlignment() {
    switch (widget.questionObj.titleAlignment) {
      case TextAlignment.centerLeft:
        return Alignment.centerLeft;
      case TextAlignment.centerRight:
        return Alignment.centerRight;
      default:
        return Alignment.center;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Align(
        alignment: getAlignment(),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: widget.questionObj.titleBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
