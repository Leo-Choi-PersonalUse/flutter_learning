import 'package:flutter/material.dart';
import 'option_obj.dart';

class QuestionObj {
  bool isVisible;
  bool isReadOnly = false;

  // Question
  String title;
  double titleFontSize;
  TextAlignment titleAlignment;
  bool titleBold;

  //Answer
  double answerFontSize;
  bool answerBold;

  //User Input
  var value;

  FieldType fieldType;
  FieldDirection fieldDirection;
  List<OptionObj> options;

  //errorStyle
  double errorTextFontSize = 12;

  QuestionObj(
      {this.isVisible = true,
      this.isReadOnly = false,
      required this.title,
      this.titleFontSize = 20,
      this.titleAlignment = TextAlignment.centerLeft,
      this.titleBold = false,
      required this.fieldType,
      this.answerFontSize = 20,
      this.answerBold = false,
      this.fieldDirection = FieldDirection.vertical,
      this.options = const []});
}

enum FieldDirection {
  vertical,
  horizontal,
}

enum TextAlignment {
  center,
  centerLeft,
  centerRight,
  bottomCenter,
  bottomLeft,
  bottomRight,
  topCenter,
  topLeft,
  topRight,
}

enum FieldType {
  heading,
  text,
  textarea,
  checkbox,
  radio,
  single_selection,
  multi_selection,
  signture,
  photo,
  datetime,
  date,
  time,
}
