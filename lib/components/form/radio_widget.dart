import 'package:flutter/material.dart';
import 'package:flutter_learning/theme/AppTheme.dart';
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
    fontSize = widget.questionObj.answerFontSize;
    isVisible = widget.questionObj.isVisible;
    isReadOnly = widget.questionObj.isReadOnly;
    fieldDirection = widget.questionObj.fieldDirection;
    options = widget.questionObj.options;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: radioWidget(),
    );
  }

  Widget radioWidget() {
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
        if (selectedOption.isEmpty) {
          return 'Please select an option';
        }
        return null;
      },
      builder: (FormFieldState state) {
        return Column(
          children: [
            fieldDirection == FieldDirection.vertical
                ? RadioWidget_Vertical(rendering: rendering, state: state)
                : RadioWidget_Horizontal(rendering: rendering, state: state),
          ],
        );
      },
    );
  }

  Widget RadioWidget_Vertical({required List<Widget> rendering, required FormFieldState state}) {
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: state.hasError != null && state.hasError ? AppTheme.of(context).error : Colors.transparent,
                  width: 1,
                ),
              ),
              child: Column(children: [
                ...rendering,
              ]),
            ),
            if (state.hasError != null && state.hasError) errorText(state),
          ],
        ),
      ],
    );
  }

  Widget RadioWidget_Horizontal({required List<Widget> rendering, required FormFieldState state}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 9, 0, 0),
            child: Text(
              title,
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: state.hasError != null && state.hasError ? AppTheme.of(context).error : Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(children: [
                  ...rendering,
                ]),
              ),
              if (state.hasError != null && state.hasError) errorText(state),
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
            Flexible(
              child: Transform.scale(
                scale: 1.1,
                child: Radio(
                  value: e.value as String,
                  groupValue: selectedOption,
                  onChanged: isReadOnly
                      ? null
                      : (String? value) {
                          setState(() {
                            selectedOption = value!;
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
                child: Flexible(
                  child: Transform.scale(
                    scale: 1.1,
                    child: Radio(
                      value: '',
                      groupValue: selectedOption,
                      onChanged: null, // Dummy radio button is not selectable
                    ),
                  ),
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

  Widget errorText(FormFieldState state) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(13, 10, 0, 0),
          child: Text(
            state.errorText!,
            style: TextStyle(
              color: AppTheme.of(context).error,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
