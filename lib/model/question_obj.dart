import 'option_obj.dart';

class QuestionObj {
  bool isVisible;
  bool isReadOnly = false;

  String title;
  double title_fontSize;
  FieldType fieldType;
  FieldDirection fieldDirection;
  double answer_fontSize;
  List<OptionObj> options;

  QuestionObj(
      {this.isVisible = true,
      this.isReadOnly = false,
      required this.title,
      this.title_fontSize = 20,
      required this.fieldType,
      this.answer_fontSize = 20,
      this.fieldDirection = FieldDirection.vertical,
      this.options = const []});
}

enum FieldDirection {
  vertical,
  horizontal,
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
}
