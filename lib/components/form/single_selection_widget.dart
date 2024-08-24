import 'package:flutter/material.dart';
import "../../model/index.dart";
import 'package:dropdown_search/dropdown_search.dart';

class SingleSelectionWidget extends StatefulWidget {
  QuestionObj questionObj;

  SingleSelectionWidget({Key? key, required this.questionObj}) : super(key: key);

  @override
  State<SingleSelectionWidget> createState() => _SingleSelectionWidgetState();
}

class _SingleSelectionWidgetState extends State<SingleSelectionWidget> {
  late List<OptionObj> options = [];
  late bool isReadOnly;
  late String title;
  late double fontSize;
  late bool isVisible;
  late FieldDirection fieldDirection = FieldDirection.vertical;

  OptionObj selectedOption = OptionObj(label: "", value: "");

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
    return Visibility(
      visible: isVisible,
      child: fieldDirection == FieldDirection.vertical ? RadioWidget_Vertical() : RadioWidget_Horizontal(),
    );
  }

  Widget RadioWidget_Vertical() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: fontSize),
        ),
        SizedBox(height: 8.0), // Add some spacing between the title and the TextFormField
        DropdownSearch<OptionObj>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
          ),
          enabled: !isReadOnly,
          items: options,
          itemAsString: (OptionObj u) => u.label,
          compareFn: (OptionObj obj1, OptionObj obj2) {
            return obj1.value == obj2.value;
          },
          onChanged: (OptionObj? obj) {
            setState(() {
              selectedOption = obj!;
            });
          },
          //selectedItem: selectedOption,
        ),
      ],
    );
  }

  Widget RadioWidget_Horizontal() {
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
          child: DropdownSearch<OptionObj>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
            ),
            enabled: !isReadOnly,
            items: options,
            itemAsString: (OptionObj u) => u.label,
            compareFn: (OptionObj obj1, OptionObj obj2) {
              return obj1.value == obj2.value;
            },
            onChanged: (OptionObj? obj) {
              setState(() {
                selectedOption = obj!;
              });
            },
            //selectedItem: selectedOption,
          ),
        ),
      ],
    );
  }
}
