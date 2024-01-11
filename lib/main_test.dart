import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modal Example'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open Modal'),
          onPressed: () {
            showMaterialModalBottomSheet(
              context: context,
              builder: (context) => _buildModalContent(context),
              expand: true,
              isDismissible: true,
            );
          },
        ),
      ),
    );
  }

  Widget _buildModalContent(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Your modal content here
            // You can add any widgets you want
            // and they will be scrollable if the content exceeds the height
            ListTile(
              title: Text('Item 1'),
            ),
            ListTile(
              title: Text('Item 2'),
            ),
            ListTile(
              title: Text('Item 3'),
            ),
            // ...
          ],
        ),
      ),
    );
  }
}