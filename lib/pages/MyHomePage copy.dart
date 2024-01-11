import 'package:flutter/material.dart';
import 'package:flutter_learning/CounterModel.dart';
import 'package:provider/provider.dart';
import '../appState.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late AppState appState;
  int currentCounter = 0;
  //int currentCounter = appState.counter;

  get storage => null;

  // Future<void> _incrementCounter() async {
  //   print(await storage.read(key: 'key'));
  //   await storage.write(key: 'key', value: 'hello');
  //   setState(() {
  //     _counter++;
  //   });
  // }

  void _toggleTheme() {
    print(appState.counter);
    setState(() {
      _counter++;
      appState.counter += 1;
      appState.isDarkTheme = !appState.isDarkTheme;
      print(appState.isDarkTheme);
    });
  }

  @override
  void initState() {
    super.initState();
    appState = AppState.instance;
    currentCounter = appState.counter;
    _counter = appState.counter;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${appState.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleTheme,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
