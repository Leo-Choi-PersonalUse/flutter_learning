import 'package:flutter/material.dart';
import "../../model/index.dart";

class RadioWidget extends StatefulWidget {
  QuestionObj questionObj;

  RadioWidget({Key? key, required this.questionObj}) : super(key: key);

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  late List<OptionObj> options = [];
  late int rowItems = 3; // Number of items in a row
  late bool isReadOnly;
  late String title;
  late double fontSize;
  late bool isVisible;
  late FieldDirection fieldDirection = FieldDirection.vertical;

  String selectedOption = "";

  @override
  void initState() {
    super.initState();
    title = widget.questionObj.title;
    fontSize = widget.questionObj.answer_fontSize;
    isVisible = widget.questionObj.isVisible;
    isReadOnly = widget.questionObj.isReadOnly;
    fieldDirection = widget.questionObj.fieldDirection;
    options = widget.questionObj.options;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> rendering = [];
    int rows = (options.length / rowItems).ceil();
    for (int i = 0; i < rows; i++) {
      List<OptionObj> temp = [];
      for (int j = 0; j < rowItems && (i * rowItems + j) < options.length; j++) {
        temp.add(options[i * rowItems + j]);
      }
      rendering.add(oneRow(rowItems, temp));
    }

    return Visibility(
      visible: isVisible,
      child: fieldDirection == FieldDirection.vertical ? RadioWidget_Vertical(rendering: rendering) : RadioWidget_Horizontal(rendering: rendering),
    );
  }

  Widget RadioWidget_Vertical({required List<Widget> rendering}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: fontSize),
        ),
        SizedBox(height: 8.0), // Add some spacing between the title and the TextFormField
        Column(
          children: rendering,
        ),
      ],
    );
  }

  Widget RadioWidget_Horizontal({required List<Widget> rendering}) {
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
          child: Column(
            children: rendering,
          ),
        ),
      ],
    );
  }

  Widget oneRow(int rowItems, List<OptionObj> items) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ...items.map((e) {
            return Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Transform.scale(
                      scale: 1.1,
                      child: Radio(
                        value: e.value as String,
                        groupValue: selectedOption,
                        //activeColor: Color(0xFFFFD754),
                        onChanged: isReadOnly
                            ? null
                            : (String? value) {
                                setState(() {
                                  selectedOption = value!;
                                  //if (checkBoxInputCallback != null) checkBoxInputCallback!();
                                });
                              },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: isReadOnly
                        ? null
                        : () {
                            setState(() {
                              selectedOption = e.value;
                              //if (checkBoxInputCallback != null) checkBoxInputCallback!();
                            });
                          },
                    child: Text(
                      e.label,
                      style: TextStyle(
                        fontSize: fontSize,
                        //color: GlobalFunctions.hexToColor(taskObj.attributes?["option_color"]),
                        //fontWeight: GlobalFunctions?.getFontWeight(taskObj.attributes?["option_weight"]) ?? FontWeight.normal,
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}