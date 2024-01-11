import 'package:flutter/foundation.dart';

class AppState with ChangeNotifier {
  // 假设您的应用程序状态是一个整数计数器
  int counter = 0;
  bool isDark = false;
  String appVerion = '';


  factory AppState() {
    return _instance;
  }

  // 创建一个私有构造函数以确保只有一个实例
  AppState._();

  // 创建一个单例实例
  static final AppState _instance = AppState._();

  // 提供一个访问单例实例的静态方法
  static AppState get instance => _instance;
}
