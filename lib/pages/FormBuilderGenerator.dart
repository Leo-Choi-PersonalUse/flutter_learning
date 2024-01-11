import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormBuilderGenerator {
  // Properties
  late String FormCat;
  List<Widget> rendering = [];

  List<dynamic> data = [
    {
      "FieldType": "RadioGroup",
      "option": ["是", "否", "不適用"],
      "name": "Q1",
      'label': "Q1"
    },
    {
      "FieldType": "SingleDropdown",
      "option": ['Male', 'Female', 'Other'],
      "name": "Q2",
      'label': "Q2"
    },
    {
      "FieldType": "TextField",
      "name": "Q3",
      'label': "Q3"
    },
    {
      "FieldType": "DateTimePicker",
      "name": "Q4",
      'label': "Q4"
    },
  ];

  void initFormBuilder() {
    data.forEach((element) {
      // Accessing properties of each element
      rendering.add(const SizedBox(height: 5));

      switch (element["FieldType"]) {
        case "RadioGroup":
          List<FormBuilderFieldOption<dynamic>> options = List<FormBuilderFieldOption<dynamic>>.from(
            element["option"].map((lang) => FormBuilderFieldOption(value: lang)),
          );

          rendering.add(
            FormBuilderRadioGroup<dynamic>(
              name: element["name"],
              decoration: InputDecoration(
                labelText: element["label"],
                //border: InputBorder.none,
              ),
              options: options,
              wrapAlignment: WrapAlignment.spaceEvenly,
            ),
          );
          break;
        case "SingleDropdown":
          List<DropdownMenuItem<String>> options =
          element["option"]
              .map<DropdownMenuItem<String>>((e) =>
              DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ))
              .toList();

          rendering.add(
            FormBuilderDropdown<String>(
              name: element["name"],
              decoration: InputDecoration(labelText: element["label"]),
              items: options,
            ),
          );
          break;
        case "TextField":
          rendering.add(
            FormBuilderTextField(
              name: element["name"],
              decoration: InputDecoration(labelText: element["label"]),
              // validator: FormBuilderValidators.compose([
              //   FormBuilderValidators.required(),
              //   FormBuilderValidators.email(),
              // ]),
            ),
          );
          break;
        case "DateTimePicker":
          rendering.add(
            FormBuilderDateTimePicker(
              name: element["name"],
              decoration: InputDecoration(labelText: element["label"]),
            ),
          );
          break;

      }
    });
  }

  // Constructor
  FormBuilderGenerator(String FormCat) {
    this.FormCat = FormCat;
    initFormBuilder();
  }

  // Methods
  // void sayHello() {
  //   print("Hello, my name is $name and I am $age years old.");
  // }
}