import "package:flutter/material.dart";
import "package:flutter_learning/components/form/date_time_widget.dart";
import "../../model/index.dart";
import "../form/index.dart";

class FormManager {
  //QuestionObj questionObj;

  //FormManager({required this.questionObj});

  Widget getWidget({required QuestionObj questionObj}) {
    switch (questionObj.fieldType) {
      case FieldType.heading:
        return HeadingWidget(questionObj: questionObj, key: questionObj.answerKey);
      case FieldType.text:
        return TextWidget(questionObj: questionObj, key: questionObj.answerKey);
      case FieldType.textarea:
        return TextareaWidget(questionObj: questionObj, key: questionObj.answerKey);
      case FieldType.checkbox:
        return CheckboxWidget(questionObj: questionObj, key: questionObj.answerKey);
      case FieldType.radio:
        return RadioWidget(questionObj: questionObj, key: questionObj.answerKey);
      case FieldType.single_selection:
        return SingleSelectionWidget(questionObj: questionObj, key: questionObj.answerKey);
      case FieldType.multi_selection:
        return MultiSelectionWidget(questionObj: questionObj, key: questionObj.answerKey);
      case FieldType.signture:
        return SignatureWidget(questionObj: questionObj, key: questionObj.answerKey);
      case FieldType.photo:
        return PhotoWidget(questionObj: questionObj, key: questionObj.answerKey);
      case FieldType.datetime:
        return DateTimeWidget(questionObj: questionObj, isDate: true, isTime: true, key: questionObj.answerKey);
      case FieldType.time:
        return DateTimeWidget(questionObj: questionObj, isDate: false, isTime: true, key: questionObj.answerKey);
      case FieldType.date:
        return DateTimeWidget(questionObj: questionObj, isDate: true, isTime: false, key: questionObj.answerKey);
    }
  }

  void getValue_all({required List<QuestionObj> list}) {
    list.forEach((element) {
      if (element.fieldType != FieldType.heading) {
        print(element.answerKey.currentState?.getValue());
      }
    });
  }
}
