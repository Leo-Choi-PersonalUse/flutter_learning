import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiSelectWidget extends StatefulWidget {
  final List<dynamic> options;
  final List<dynamic>? selectedOptions;

  const MultiSelectWidget({Key? key, required this.options, this.selectedOptions})
      : super(key: key);

  @override
  State<MultiSelectWidget> createState() => _MultiSelectWidgetState();
}

class _MultiSelectWidgetState extends State<MultiSelectWidget> {
  List<dynamic> _options = [];
  List<dynamic> _selectedOptions = [];

  List<MultiSelectItem<dynamic>> _items = [];

  @override
  void initState() {
    _options = widget.options;
    _items = _options.map((animal) => MultiSelectItem<dynamic>(animal, animal.name)).toList();
    _selectedOptions = widget.selectedOptions ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MultiSelectDialogField(
        onConfirm: (val) {
          setState(() => _selectedOptions = val);
        },
        dialogWidth: MediaQuery.of(context).size.width * 0.7,
        searchable: true,
        items: _items,
        initialValue: _selectedOptions,
        // setting the value of this in initState() to pre-select values.
      ),
    );
  }
}
