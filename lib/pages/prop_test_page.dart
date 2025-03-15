import 'package:flutter/material.dart';

class PropTestPage extends StatefulWidget {
  const PropTestPage({super.key});

  @override
  State<PropTestPage> createState() => _PropTestPageState();
}

class _PropTestPageState extends State<PropTestPage> {
  @override
  String page_str = "hello World";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prop Test Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TestWidget(test_str: page_str, add: add),
            IconButton(
                onPressed: () {
                  add();
                },
                icon: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }

  void add() {
    setState(() {
      page_str += "d";
    });
    print(page_str);
  }
}

class TestWidget extends StatefulWidget {
  String test_str;
  Function? add;

  TestWidget({Key? key, required this.test_str, this.add}) : super(key: key);

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  late String test_str_widget_state;

  void initState() {
    // TODO: implement initState
    super.initState();
    test_str_widget_state = widget.test_str;
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Parent: " + widget.test_str),
        Text("Child: " + test_str_widget_state),
        IconButton(
            onPressed: () {
              setState(() {
                test_str_widget_state += "d";
              });
              //if (widget.add != null) widget.add!();
            },
            icon: Icon(Icons.safety_check))
      ],
    );
  }
}
