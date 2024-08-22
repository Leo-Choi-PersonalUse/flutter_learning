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
    fontSize = widget.questionObj.answer_fontSize;
    isVisible = widget.questionObj.isVisible;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
