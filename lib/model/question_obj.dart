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

// factory QuestionObj.fromJson(Map<String, dynamic> json) {
//   return QuestionObj(
//     question: json['question'],
//     fieldType: FieldType.values.firstWhere((e) => e.toString() == 'FieldType.' + json["fieldType"]),
//     //fieldDirection: FieldDirection.values.firstWhere((e) => e.toString() == 'FieldDirection.' + json["fieldDirection"]),
//     // answer: json['answer'],
//     // option1: json['option1'],
//     // option2: json['option2'],
//     // option3: json['option3'],
//     // option4: json['option4']
//   );
// }
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
  single_select,
  multi_select,
  signture,
}
