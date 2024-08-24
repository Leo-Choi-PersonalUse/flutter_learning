import "package:flutter/material.dart";
import './constant.dart';
import "../../model/index.dart";

class TextWidget extends StatefulWidget {
  QuestionObj questionObj;

  TextWidget({Key? key, required this.questionObj}) : super(key: key);

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  late String title;
  late double fontSize;
  late bool isVisible;
  late bool isReadOnly;
  late FieldDirection fieldDirection = FieldDirection.vertical;

  String value = '';

  @override
  void initState() {
    super.initState();
    title = widget.questionObj.title;
    fontSize = widget.questionObj.answer_fontSize;
    isVisible = widget.questionObj.isVisible;
    isReadOnly = widget.questionObj.isReadOnly;
    fieldDirection = widget.questionObj.fieldDirection;
  }

  String getValue() {
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: fieldDirection == FieldDirection.vertical ? TextWidget_Vertical() : TextWidget_Horizontal(),
    );
  }

  Widget TextWidget_Vertical() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: fontSize),
        ),
        SizedBox(height: 8.0), // Add some spacing between the title and the TextFormField
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          enabled: !isReadOnly,
          controller: TextEditingController(text: value),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget TextWidget_Horizontal() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: TextStyle(fontSize: fontSize),
          ),
        ),
        Expanded(
          flex: 3,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            enabled: !isReadOnly,
            controller: TextEditingController(text: value),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
