import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState with ChangeNotifier {
  int counter = 0;
  String appVerion = '';

  //isDark
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  set isDarkMode(bool _value) {
    _isDarkMode = _value;
    prefs.setBool('isDarkMode', _value);
  }

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  late SharedPreferences prefs;

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();

    await _safeInitAsync(() async {
      _isDarkMode = await prefs.getBool("isDarkMode") ?? _isDarkMode;
    });
  }

  factory AppState() {
    return _instance;
  }

  // 创建一个私有构造函数以确保只有一个实例
  AppState._();

  // 创建一个单例实例
  static final AppState _instance = AppState._();

  // 提供一个访问单例实例的静态方法
  static AppState get instance => _instance;

//Update AppState
  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  Future _safeInitAsync(Function() initializeField) async {
    try {
      await initializeField();
    } catch (_) {
      print(_);
    }
  }
}
