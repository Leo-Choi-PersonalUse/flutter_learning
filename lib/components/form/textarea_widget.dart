import "package:flutter/material.dart";
import './constant.dart';
import "../../model/index.dart";

class TextareaWidget extends StatefulWidget {
  QuestionObj questionObj;

  TextareaWidget({Key? key, required this.questionObj}) : super(key: key);

  @override
  State<TextareaWidget> createState() => _TextareaWidgetWidgetState();
}

class _TextareaWidgetWidgetState extends State<TextareaWidget> {
  late String title;
  late double titleFontSize;
  late bool titleBold;
  late double answerFontSize;
  late bool answerBold;
  late bool isVisible;
  late bool isReadOnly;
  late FieldDirection fieldDirection = FieldDirection.vertical;

  String value = '';

  @override
  void initState() {
    super.initState();
    title = widget.questionObj.title;
    titleFontSize = widget.questionObj.titleFontSize;
    titleBold = widget.questionObj.titleBold;
    answerFontSize = widget.questionObj.answerFontSize;
    answerBold = widget.questionObj.answerBold;
    isVisible = widget.questionObj.isVisible;
    isReadOnly = widget.questionObj.isReadOnly;
  }

  String getValue() {
    return value;
  }

  CrossAxisAlignment getAlignment() {
    switch (widget.questionObj.titleAlignment) {
      case TextAlignment.left:
        return CrossAxisAlignment.start;
      case TextAlignment.right:
        return CrossAxisAlignment.end;
      default:
        return CrossAxisAlignment.center;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(visible: isVisible, child: fieldDirection == FieldDirection.vertical ? TextareaWidget_Vertical() : TextareaWidget_Horizontal());
  }

  Widget TextareaWidget_Vertical() {
    return Column(
      crossAxisAlignment: getAlignment(),
      children: [
        Text(
          title,
          style: TextStyle(fontSize: titleFontSize, fontWeight: titleBold ? FontWeight.bold : FontWeight.normal),
        ),
        SizedBox(height: 8.0), // Add some spacing between the title and the TextFormField
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          minLines: 5,
          maxLines: null,
          enabled: !isReadOnly,
          style: TextStyle(fontSize: answerFontSize, fontWeight: answerBold ? FontWeight.bold : FontWeight.normal),
          controller: TextEditingController(text: value),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            //labelText: title,
          ),
        ),
      ],
    );
  }

  Widget TextareaWidget_Horizontal() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: TextStyle(fontSize: titleFontSize, fontWeight: titleBold ? FontWeight.bold : FontWeight.normal),
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
            style: TextStyle(fontSize: answerFontSize, fontWeight: answerBold ? FontWeight.bold : FontWeight.normal),
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
