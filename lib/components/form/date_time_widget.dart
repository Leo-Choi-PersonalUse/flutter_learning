import 'package:flutter/material.dart';
import 'package:flutter_learning/theme/AppTheme.dart';
import "../../model/index.dart";

class DateTimeWidget extends StatefulWidget {
  QuestionObj questionObj;

  bool isDate;
  bool isTime;

  DateTimeWidget({
    Key? key,
    required this.questionObj,
    required this.isDate,
    required this.isTime,
  }) : super(key: key);

  @override
  State<DateTimeWidget> createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  late String title;
  late double titleFontSize;
  late bool titleBold;
  late double answerfontSize;
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
    answerfontSize = widget.questionObj.answerFontSize;
    answerBold = widget.questionObj.answerBold;
    isVisible = widget.questionObj.isVisible;
    isReadOnly = widget.questionObj.isReadOnly;
    fieldDirection = widget.questionObj.fieldDirection;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: fieldDirection == FieldDirection.vertical ? DateTimeWidget_Vertical() : DateTimeWidget_Horizontal(),
    );
  }

  Widget DateTimeWidget_Vertical() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: titleFontSize, fontWeight: titleBold ? FontWeight.bold : FontWeight.normal),
        ),
        SizedBox(height: 8.0), // Add some spacing between the title and the TextFormField
        Row(
          children: [
            Visibility(
              visible: widget.isDate,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    style: TextStyle(fontSize: answerfontSize, fontWeight: answerBold ? FontWeight.bold : FontWeight.normal),
                    enabled: !isReadOnly,
                    controller: TextEditingController(text: value),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      suffixIcon: const Icon(Icons.access_time),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: widget.isTime,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    style: TextStyle(fontSize: answerfontSize, fontWeight: answerBold ? FontWeight.bold : FontWeight.normal),
                    enabled: !isReadOnly,
                    controller: TextEditingController(text: value),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      suffixIcon: const Icon(Icons.access_time),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget DateTimeWidget_Horizontal() {
    return Container();
  }
}
