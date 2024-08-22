import 'package:flutter/material.dart';
import 'pages/landing_page.dart';
import 'pages/menu_page.dart';
import 'package:provider/provider.dart';
import 'theme_model.dart';
import 'main.dart';
import 'pages/SettingPage.dart';

import './components/navigationBar/AppNavigationBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    LandingPage(title: 'Home Page'),
    MenuPage(title: "Menu Page"),
    SettingPage(title: "Setting Page"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Bottom Navigation Demo'),
        // ),
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: AppNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //themeNotifier.isDark ? themeNotifier.isDark = false : themeNotifier.isDark = true;
            App.of(context).setThemeMode_invert();
            //print(Navigator().pages.length);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
