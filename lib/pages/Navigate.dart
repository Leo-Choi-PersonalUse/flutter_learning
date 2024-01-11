import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Navigate extends StatelessWidget {
  const Navigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Navigrate Page"),
      ),
      body: Center(
        child:
        CupertinoButton(
          onPressed: () {
           //print(Navigator().pages.length);
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
