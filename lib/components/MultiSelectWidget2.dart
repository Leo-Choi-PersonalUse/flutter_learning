import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

class MultiSelectWidget2 extends StatefulWidget {
  final List<String> options;
  final List<String>? selectedOptions;

  const MultiSelectWidget2({Key? key, required this.options, this.selectedOptions})
      : super(key: key);

  // const MultiSelectWidget2({Key? key}) : super(key: key);

  @override
  State<MultiSelectWidget2> createState() => _MultiSelectWidget2State();
}

class _MultiSelectWidget2State extends State<MultiSelectWidget2> {
  @override
  List<String> _options = [];
  List<String> _selectedOptions = [];

  @override
  void initState() {
    _options = widget.options;
    _selectedOptions = widget.selectedOptions ?? [];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      child: DropDownMultiSelect(
        onChanged: (List<String> x) {
          setState(() {
            _selectedOptions = x;
          });
        },
        options: _options,
        selectedValues: _selectedOptions,
        whenEmpty: 'Select Something',
      ),
    );
  }
}
