import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../components/MultiSelectWidget.dart';
import '../components/MultiSelectWidget2.dart';

import 'package:sticky_headers/sticky_headers.dart';
import 'package:awesome_select/awesome_select.dart';

class ApplicationFormPage extends StatefulWidget {
  const ApplicationFormPage({super.key});

  @override
  State<ApplicationFormPage> createState() => _ApplicationFormPageState();
}

class _ApplicationFormPageState extends State<ApplicationFormPage> {
  @override
  static List<dynamic> _animals = [
    //Don't use {"id": 1, "name": "Lion"}
    (id: 1, name: "Lion"),
    (id: 2, name: "Flamingo"),
    (id: 3, name: "Hippo"),
    (id: 4, name: "Horse"),
    (id: 5, name: "Tiger"),
    (id: 6, name: "Penguin"),
    (id: 7, name: "Spider"),
    (id: 8, name: "Snake"),
    (id: 9, name: "Bear"),
  ];

  final _items = _animals.map((animal) => MultiSelectItem<dynamic>(animal, animal.name)).toList();

  List<dynamic> _selectedAnimals5 = [
    (id: 8, name: "Snake"),
    (id: 9, name: "Bear"),
  ];

  String value = 'flutter';
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'ion', title: 'Ionic'),
    S2Choice<String>(value: 'flu', title: 'Flutter'),
    S2Choice<String>(value: 'rea', title: 'React Native'),
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Application Form"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            MultiSelectWidget(
              options: _animals,
              selectedOptions: _selectedAnimals5,
            ),
            SizedBox(height: 20.0), // Add some spacing between the widgets
            MultiSelectWidget2(
              options: _animals.map((animal) => animal.name).toList().cast<String>(),
              selectedOptions:
                  _selectedAnimals5.map((animal) => animal.name).toList().cast<String>(),
            ),
            SmartSelect<String>.single(
              title: 'Frameworks',
              selectedValue: value,
              choiceItems: options,
              onChange: (state) => setState(() => value = state.value),
              modalHeaderStyle: S2ModalHeaderStyle(
                backgroundColor: Colors.blue,
                textStyle: TextStyle(color: Colors.white),
                iconTheme: IconThemeData(color: Colors.white),
              ),
              choiceStyle: S2ChoiceStyle(
                titleStyle: TextStyle(fontSize: 16),
                subtitleStyle: TextStyle(fontSize: 12),
              ),
              tileBuilder: (context, state) {
                return S2Tile.fromState(
                  state,
                  isTwoLine: true,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
