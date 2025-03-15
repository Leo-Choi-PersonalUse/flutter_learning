import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_learning/components/form/text_widget.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../components/MultiSelectWidget.dart';
import '../components/MultiSelectWidget2.dart';

import 'package:sticky_headers/sticky_headers.dart';
import 'package:awesome_select/awesome_select.dart';
import './../components/form/index.dart';
import "../model/index.dart";
import "../components/form/FormManager.dart";

class ApplicationFormPage extends StatefulWidget {
  const ApplicationFormPage({super.key});

  @override
  State<ApplicationFormPage> createState() => _ApplicationFormPageState();
}

class _ApplicationFormPageState extends State<ApplicationFormPage> {
  //For scroll to dismiss keyboard
  final FocusNode _focusNode = FocusNode();

  @override
  final _formKey = GlobalKey<FormState>();

  List<QuestionObj> question = [
    QuestionObj(title: "標目", fieldType: FieldType.heading),
    QuestionObj(title: "文字", fieldType: FieldType.text),
    QuestionObj(title: "文字", fieldType: FieldType.text, fieldDirection: FieldDirection.horizontal),
    QuestionObj(title: "多行文字", fieldType: FieldType.textarea),
    QuestionObj(title: "簽名", fieldType: FieldType.signture),
    QuestionObj(title: "單選按鈕", fieldType: FieldType.radio, options: [
      OptionObj(label: "選項123456789", value: "1"),
      OptionObj(label: "選項2", value: "2"),
      OptionObj(label: "選項3", value: "3"),
      OptionObj(label: "選項4", value: "4"),
      OptionObj(label: "選項5", value: "5"),
      OptionObj(label: "選項6", value: "6"),
      OptionObj(label: "選項7", value: "7"),
      OptionObj(label: "選項8", value: "8"),
      OptionObj(label: "選項9", value: "9"),
    ]),
    QuestionObj(title: "單選按鈕", fieldType: FieldType.radio, fieldDirection: FieldDirection.horizontal, options: [
      OptionObj(label: "選項1", value: "1"),
      OptionObj(label: "選項2", value: "2"),
      OptionObj(label: "選項3", value: "3"),
      OptionObj(label: "選項4", value: "4"),
      OptionObj(label: "選項5", value: "5"),
    ]),
    QuestionObj(title: "多選按鈕", fieldType: FieldType.checkbox, options: [
      OptionObj(label: "選項123456789", value: "1"),
      OptionObj(label: "選項2", value: "2"),
      OptionObj(label: "選項3", value: "3"),
      OptionObj(label: "選項4", value: "4"),
      OptionObj(label: "選項5", value: "5"),
      OptionObj(label: "選項6", value: "6"),
      OptionObj(label: "選項7", value: "7"),
      OptionObj(label: "選項8", value: "8"),
      OptionObj(label: "選項9", value: "9"),
    ]),
    QuestionObj(title: "多選按鈕", fieldType: FieldType.checkbox, fieldDirection: FieldDirection.horizontal, options: [
      OptionObj(label: "選項1", value: "1"),
      OptionObj(label: "選項2", value: "2"),
      OptionObj(label: "選項3", value: "3"),
      OptionObj(label: "選項4", value: "4"),
      OptionObj(label: "選項5", value: "5"),
    ]),
    QuestionObj(title: "單項選擇", fieldType: FieldType.single_selection, fieldDirection: FieldDirection.horizontal, options: [
      OptionObj(label: "選項1", value: "1"),
      OptionObj(label: "選項2", value: "2"),
      OptionObj(label: "選項3", value: "3"),
      OptionObj(label: "選項4", value: "4"),
      OptionObj(label: "選項5", value: "5"),
    ]),
    QuestionObj(title: "單項選擇", fieldType: FieldType.single_selection, fieldDirection: FieldDirection.vertical, options: [
      OptionObj(label: "選項1", value: "1"),
      OptionObj(label: "選項2", value: "2"),
      OptionObj(label: "選項3", value: "3"),
      OptionObj(label: "選項4", value: "4"),
      OptionObj(label: "選項5", value: "5"),
    ]),
    QuestionObj(title: "雙項選擇", fieldType: FieldType.multi_selection, fieldDirection: FieldDirection.horizontal, options: [
      OptionObj(label: "選項1", value: "1"),
      OptionObj(label: "選項2", value: "2"),
      OptionObj(label: "選項3", value: "3"),
      OptionObj(label: "選項4", value: "4"),
      OptionObj(label: "選項5", value: "5"),
    ]),
    QuestionObj(title: "雙項選擇", fieldType: FieldType.multi_selection, fieldDirection: FieldDirection.vertical, options: [
      OptionObj(label: "選項1", value: "1"),
      OptionObj(label: "選項2", value: "2"),
      OptionObj(label: "選項3", value: "3"),
      OptionObj(label: "選項4", value: "4"),
      OptionObj(label: "選項5", value: "5"),
    ]),
    QuestionObj(title: "標目", fieldType: FieldType.photo),
    QuestionObj(title: "標目", fieldType: FieldType.photo, fieldDirection: FieldDirection.horizontal),
    QuestionObj(title: "日期和日子", fieldType: FieldType.datetime, fieldDirection: FieldDirection.vertical),
    QuestionObj(title: "日期和日子", fieldType: FieldType.datetime, fieldDirection: FieldDirection.horizontal),
  ];


  @override
  void initState() {
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFD754),
        title: Text("Application Form"),
      ),
      body: GestureDetector(
        onPanDown: (_) {
          FocusScope.of(context).requestFocus(_focusNode);
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                    children: question
                        .map((q) => Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20), // each item padding
                              child: FormManager(questionObj: q).getWidget(),
                            ))
                        .toList(),
                  )),
                ),
                SizedBox(height: 20.0), // Space between ListView and button
                ElevatedButton(
                  onPressed: () {
                    // Add your button press logic here
                    _formKey.currentState!.validate();
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
