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

  FieldType fieldType;
  FieldDirection fieldDirection;
  List<OptionObj> options;

  QuestionObj(
      {this.isVisible = true,
      this.isReadOnly = false,
      required this.title,
      this.titleFontSize = 20,
      this.titleAlignment = TextAlignment.left,
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
  left,
  right,
  center,
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
