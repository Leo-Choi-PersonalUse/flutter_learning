import 'package:flutter/material.dart';
import '/theme/AppTheme.dart';
import '../components/drawer/AppDrawer.dart';

class MyHomePage extends StatelessWidget {
  @override
  const MyHomePage({super.key, required this.title});

  final String title;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).appBar,
        title: Text(title),
      ),
      drawer: AppDrawer(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is the HomePage(Stateless Widget)',
            ),
          ],
        ),
      ),
    );
  }
}
