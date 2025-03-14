import "package:flutter/material.dart";
import "package:flutter_learning/components/form/date_time_widget.dart";
import "../../model/index.dart";
import "../form/index.dart";

class FormManager {
  QuestionObj questionObj;

  FormManager({required this.questionObj});

  Widget getWidget() {
    switch (questionObj.fieldType) {
      case FieldType.heading:
        return HeadingWidget(questionObj: questionObj);
      case FieldType.text:
        return TextWidget(questionObj: questionObj);
      case FieldType.textarea:
        return TextareaWidget(questionObj: questionObj);
      case FieldType.checkbox:
        return CheckboxWidget(questionObj: questionObj);
      case FieldType.radio:
        return RadioWidget(questionObj: questionObj);
      case FieldType.single_selection:
        return SingleSelectionWidget(questionObj: questionObj);
      case FieldType.multi_selection:
        return MultiSelectionWidget(questionObj: questionObj);
      case FieldType.signture:
        return SignatureWidget(questionObj: questionObj);
      case FieldType.photo:
        return PhotoWidget(questionObj: questionObj);
      case FieldType.datetime:
        return DateTimeWidget(questionObj: questionObj, isDate: true, isTime: true);
      case FieldType.time:
        return DateTimeWidget(questionObj: questionObj, isDate: false, isTime: true);
      case FieldType.date:
        return DateTimeWidget(questionObj: questionObj, isDate: true, isTime: false);
    }
  }
}
