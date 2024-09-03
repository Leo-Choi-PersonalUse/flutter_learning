import 'package:flutter/material.dart';
import "../../model/index.dart";
import 'package:flutter_learning/theme/AppTheme.dart';
import 'package:flutter_learning/components/form/error_text_widget.dart';

class CheckboxWidget extends StatefulWidget {
  QuestionObj questionObj;

  CheckboxWidget({Key? key, required this.questionObj}) : super(key: key);

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  late List<OptionObj> options = [];
  late int rowItems = 3; // Number of items in a row
  late bool isReadOnly;
  late String title;
  late double fontSize;
  late bool isVisible;
  late FieldDirection fieldDirection = FieldDirection.vertical;
  late Map<String, bool> selectedOptions = {};

  @override
  void initState() {
    super.initState();
    title = widget.questionObj.title;
    fontSize = widget.questionObj.answer_fontSize;
    isVisible = widget.questionObj.isVisible;
    isReadOnly = widget.questionObj.isReadOnly;
    fieldDirection = widget.questionObj.fieldDirection;
    options = widget.questionObj.options;

    // Initialize selectedOptions
    for (var option in options) {
      selectedOptions[option.value] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: checkboxWidget(),
    );
  }

  Widget checkboxWidget() {
    List<Widget> rendering = [];
    int rows = (options.length / rowItems).ceil();
    for (int i = 0; i < rows; i++) {
      List<OptionObj> temp = [];
      for (int j = 0; j < rowItems && (i * rowItems + j) < options.length; j++) {
        temp.add(options[i * rowItems + j]);
      }
      rendering.add(oneRow(rowItems, temp));
    }

    return FormField(
      validator: (value) {
        var temp = selectedOptions.entries.where((element) => element.value == true);
        if (temp.isEmpty) {
          return 'Please select an option';
        }
        return null;
      },
      builder: (FormFieldState state) {
        return Column(
          children: [
            fieldDirection == FieldDirection.vertical
                ? CheckboxWidget_Vertical(rendering: rendering, state: state)
                : CheckboxWidget_Horizontal(rendering: rendering, state: state),
          ],
        );
      },
    );
  }

  Widget CheckboxWidget_Vertical({required List<Widget> rendering, required FormFieldState state}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: fontSize),
        ),
        SizedBox(height: 8.0), // Add some spacing between the title and the TextFormField
        Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: state.hasError != null && state.hasError ? AppTheme.of(context).error : Colors.transparent,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        ...rendering,
                      ],
                    ),
                  ),
                  if (state.hasError != null && state.hasError) ErrorTextWidget(state: state),
                  // ...rendering
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget CheckboxWidget_Horizontal({required List<Widget> rendering, required FormFieldState state}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: Text(
                title,
                style: TextStyle(fontSize: fontSize),
              ),
            )),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: state.hasError != null && state.hasError ? AppTheme.of(context).error : Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    ...rendering,
                  ],
                ),
              ),
              if (state.hasError != null && state.hasError) ErrorTextWidget(state: state),
            ],
          ),
        ),
      ],
    );
  }

  Widget oneRow(int rowItems, List<OptionObj> items) {
    List<Widget> children = items.map((e) {
      return Expanded(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              //limit the checkbox size
              height: 35,
              width: 35,
              child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: selectedOptions[e.value],
                onChanged: isReadOnly
                    ? null
                    : (bool? value) {
                        setState(() {
                          selectedOptions[e.value] = value!;
                        });
                      },
              ),
            ),
            GestureDetector(
              onTap: isReadOnly
                  ? null
                  : () {
                      setState(() {
                        selectedOptions[e.value] = !selectedOptions[e.value]!;
                      });
                    },
              child: Text(
                e.label,
                style: TextStyle(
                  fontSize: fontSize,
                ),
                softWrap: true,
              ),
            ),
          ],
        ),
      );
    }).toList();

    // If the number of items is less than rowItems, add a dummy Radio widget
    if (items.length < rowItems) {
      children.add(
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Visibility(
                visible: false,
                child: Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: false,
                  onChanged: null,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return IntrinsicHeight(
      child: Row(
        children: children,
      ),
    );
  }
}
