import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../components/MultiSelectWidget.dart';

class ApplicationFormPage extends StatefulWidget {
  const ApplicationFormPage({super.key});

  @override
  State<ApplicationFormPage> createState() => _ApplicationFormPageState();
}

class _ApplicationFormPageState extends State<ApplicationFormPage> {
  @override
  List<dynamic> _animals = [
    {"id": 1, "name": "Lion"},
    {"id": 2, "name": "Flamingo"},
    {"id": 3, "name": "Hippo"},
    {"id": 4, "name": "Horse"},
    {"id": 5, "name": "Tiger"},
    {"id": 6, "name": "Penguin"},
    {"id": 7, "name": "Spider"},
  ];

  List<dynamic> _selectedAnimals5 = [
    {"id": 1, "name": "Lion"},
  ];

  @override
  void initState() {
    //_selectedAnimals5 = _animals;
    super.initState();
  }

  void _showMultiSelect(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog(
          items:
              _animals.map((animal) => MultiSelectItem<dynamic>(animal, animal['name'])).toList(),
          initialValue: _selectedAnimals5,
          onConfirm: (values) {
            setState(() {
              _selectedAnimals5 = values;
            });
          },
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Application Form"),
        ),
        body: Container(
          child: MultiSelectDialogField(
            searchable: true,
            items: _animals.map((e) => MultiSelectItem<dynamic>(e, e['name'])).toList(),
            chipDisplay: MultiSelectChipDisplay(
              items: _selectedAnimals5.map((e) => MultiSelectItem<dynamic>(e, e['name'])).toList(),
              onTap: (value) {
                setState(() {
                  _selectedAnimals5.remove(value);
                });
              },
            ),
            onConfirm: (values) {
              setState(() {
                _selectedAnimals5 = values;
              });
            },
          ),
        ));
  }
}
