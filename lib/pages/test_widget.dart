import 'package:flutter/material.dart';
import '/theme/AppTheme.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  String value = '';

  Future<void> selectDate(BuildContext context) async {
    //if (isreadOnly) return;

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024, 1),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.blue, // Set your desired background color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 18), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).appBar,
        title: Text('Test Page'),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              selectDate(context);
            },
            child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  //style: TextStyle(fontSize: answerfontSize, fontWeight: answerBold ? FontWeight.bold : FontWeight.normal),
                  //false will show grey border
                  enabled: false,
                  controller: TextEditingController(text: value),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    suffixIcon: const Icon(Icons.date_range),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
