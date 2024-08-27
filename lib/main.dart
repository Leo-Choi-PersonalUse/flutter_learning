import 'package:flutter/material.dart';
import 'pages/landing_page.dart';
import 'HomePage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'CounterModel.dart';
import 'appState.dart';
import "theme_model.dart";
import 'theme/AppTheme.dart';
import 'package:package_info_plus/package_info_plus.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appState = AppState(); // Initialize
  await appState.initializePersistedState();
  await AppTheme.initialize();

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  print(packageInfo.appName);
  print(packageInfo.packageName);
  print(packageInfo.version);
  print(packageInfo.buildNumber);
  appState.appVerion = "${packageInfo.version}+${packageInfo.buildNumber}";

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: App(),
  ));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();

  static _AppState of(BuildContext context) => context.findAncestorStateOfType<_AppState>()!;
}

class _AppState extends State<App> {
  //App State
  //AppState appState = AppState.instance;
  ThemeMode _themeMode = AppTheme.themeMode;

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        AppTheme.saveThemeMode(mode);
      });

  void setThemeMode_invert() => setState(() {
        _themeMode = (_themeMode == ThemeMode.dark) ? ThemeMode.light : ThemeMode.dark;
        print(_themeMode);
        AppTheme.saveThemeMode(_themeMode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //theme: appState.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      themeMode: _themeMode,
      home: const HomePage(),
    );
  }
}
