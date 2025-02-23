import 'package:flutter/material.dart';
import "../../model/index.dart";
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_learning/theme/AppTheme.dart';
import 'package:flutter_learning/components/form/error_text_widget.dart';

class MultiSelectionWidget extends StatefulWidget {
  QuestionObj questionObj;

  MultiSelectionWidget({Key? key, required this.questionObj}) : super(key: key);

  @override
  State<MultiSelectionWidget> createState() => _MultiSelectionWidgetState();
}

class _MultiSelectionWidgetState extends State<MultiSelectionWidget> {
  late List<OptionObj> options = [];
  late bool isReadOnly;
  late String title;
  late double titlefontSize;
  late bool titleBold;
  late double answerFontSize;
  late bool answerBold;
  late bool isVisible;
  late FieldDirection fieldDirection = FieldDirection.vertical;

  List<OptionObj> selectedOptions = [];

  @override
  void initState() {
    super.initState();
    title = widget.questionObj.title;
    titlefontSize = widget.questionObj.titleFontSize;
    titleBold = widget.questionObj.titleBold;
    answerFontSize = widget.questionObj.answerFontSize;
    answerBold = widget.questionObj.answerBold;
    isVisible = widget.questionObj.isVisible;
    isReadOnly = widget.questionObj.isReadOnly;
    fieldDirection = widget.questionObj.fieldDirection;
    options = widget.questionObj.options;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: multiSelectinWidget(),
    );
  }

  // Widget SelectedItemBuilder(BuildContext context, dynamic? selectedItem) {
  //   return Text(selectedOption.label ?? "",
  //       style: TextStyle(fontSize: answerFontSize, fontWeight: answerBold ? FontWeight.bold : FontWeight.normal));
  // }

  Widget multiSelectinWidget() {
    return FormField(
      validator: (value) {
        if (selectedOptions.isEmpty) {
          return 'Please select an option';
        }
        return null;
      },
      builder: (FormFieldState state) {
        return Column(
          children: [
            fieldDirection == FieldDirection.vertical ? MultiSelectionWidget_Vertical(state: state) : MultiSelectionWidget_Horizontal(state: state),
          ],
        );
      },
    );
  }

  Widget MultiSelectionWidget_Vertical({required FormFieldState state}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: titlefontSize, fontWeight: titleBold ? FontWeight.bold : FontWeight.normal),
        ),
        SizedBox(height: 8.0), // Add some spacing between the title and the TextFormField
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: state.hasError ? AppTheme.of(context).error : Colors.grey),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: DropdownSearch<OptionObj>.multiSelection(
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
              ),
            ),
            popupProps: PopupPropsMultiSelection.menu(
              showSelectedItems: true,
              menuProps: MenuProps(
                barrierColor: Colors.black.withOpacity(0.4),
              ),
              scrollbarProps: ScrollbarProps(
                thumbVisibility: true,
              ),
            ),
            enabled: !isReadOnly,
            items: options,
            itemAsString: (OptionObj u) => u.label,
            compareFn: (OptionObj obj1, OptionObj obj2) {
              return obj1.value == obj2.value;
            },
            onChanged: (List<OptionObj> obj) {
              setState(() {
                selectedOptions = obj;
              });
            },
            selectedItems: selectedOptions,
            // dropdownBuilder: (context, dynamic? selectedItem) {
            //   return SelectedItemBuilder();
            // },

          ),
        ),
        if (state != null && state.hasError) ErrorTextWidget(state: state),
      ],
    );
  }

  Widget MultiSelectionWidget_Horizontal({required FormFieldState state}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(bottom: state.hasError ? 22.0 : 0),
              child: Text(
                title,
                style: TextStyle(fontSize: titlefontSize, fontWeight: titleBold ? FontWeight.bold : FontWeight.normal),
              ),
            )),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: state.hasError ? AppTheme.of(context).error : Colors.grey),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: DropdownSearch<OptionObj>.multiSelection(
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    ),
                  ),
                  enabled: !isReadOnly,
                  items: options,
                  itemAsString: (OptionObj u) => u.label,
                  compareFn: (OptionObj obj1, OptionObj obj2) {
                    return obj1.value == obj2.value;
                  },
                  onChanged: (List<OptionObj> obj) {
                    setState(() {
                      selectedOptions = obj;
                    });
                  },
                  selectedItems: selectedOptions,
                ),
              ),
              if (state != null && state.hasError) ErrorTextWidget(state: state),
            ],
          ),
        ),
      ],
    );
  }
}
