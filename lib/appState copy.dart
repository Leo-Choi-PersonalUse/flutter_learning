// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class FFAppState extends ChangeNotifier {
//   static FFAppState _instance = FFAppState._internal();

//   factory FFAppState() {
//     return _instance;
//   }

//   FFAppState._internal();

//   static void reset() {
//     _instance = FFAppState._internal();
//   }

//   Future initializePersistedState() async {
//     secureStorage = FlutterSecureStorage();
//     await _safeInitAsync(() async {
//       _userType = await secureStorage.getString('ff_userType') ?? _userType;
//     });
//     // await _safeInitAsync(() async {
//     //   _siteLocationRefID =
//     //       (await secureStorage.getString('ff_siteLocationRefID'))?.ref ?? _siteLocationRefID;
//     // });
//     // await _safeInitAsync(() async {
//     //   _suppilerRefID = (await secureStorage.getString('ff_suppilerRefID'))?.ref ?? _suppilerRefID;
//     // });
//     // await _safeInitAsync(() async {
//     //   _siteLocationName = await secureStorage.getString('ff_siteLocationName') ?? _siteLocationName;
//     // });
//     // await _safeInitAsync(() async {
//     //   _suppilerName = await secureStorage.getString('ff_suppilerName') ?? _suppilerName;
//     // });
//     // await _safeInitAsync(() async {
//     //   _invalidUserID = (await secureStorage.getString('ff_invalidUserID'))?.ref ?? _invalidUserID;
//     // });
//     // await _safeInitAsync(() async {
//     //   _department = await secureStorage.getString('ff_department') ?? _department;
//     // });
//   }

//   void update(VoidCallback callback) {
//     callback();
//     notifyListeners();
//   }

//   late FlutterSecureStorage secureStorage;

//   // String _defaultAvatar =
//   //     'https://firebasestorage.googleapis.com/v0/b/safety-app-b60b8.appspot.com/o/avatar_placeholder.jpeg?alt=media&token=9445d9b6-be4e-40c4-8b5a-f7851028dd5a';
//   // String get defaultAvatar => _defaultAvatar;
//   // set defaultAvatar(String _value) {
//   //   _defaultAvatar = _value;
//   // }

//   String _userType = 'worker';
//   String get userType => _userType;
//   set userType(String _value) {
//     _userType = _value;
//     secureStorage.setString('ff_userType', _value);
//   }

//   void deleteUserType() {
//     secureStorage.delete(key: 'ff_userType');
//   }

//   String _currentPage = 'home';
//   String get currentPage => _currentPage;
//   set currentPage(String _value) {
//     _currentPage = _value;
//   }

//   // List<AddworkerDataStruct> _workerList = [
//   //   AddworkerDataStruct.fromSerializableMap(jsonDecode(
//   //       '{\"workerName\":\"Peter\",\"location\":\"location 1\",\"description\":\"Wiring\",\"created_on\":\"1687968000000\",\"supervisor\":\"Supervisor A\"}')),
//   //   AddworkerDataStruct.fromSerializableMap(jsonDecode(
//   //       '{\"workerName\":\"Tim\",\"location\":\"location 1\",\"description\":\"Cable containment\",\"created_on\":\"1688004616294\",\"supervisor\":\"Supervisor A\"}')),
//   //   AddworkerDataStruct.fromSerializableMap(jsonDecode(
//   //       '{\"workerName\":\"Ming\",\"location\":\"location a\",\"description\":\"Testing and commissioning\",\"created_on\":\"1688108974898\",\"supervisor\":\"Supervisor A\"}')),
//   //   AddworkerDataStruct.fromSerializableMap(jsonDecode(
//   //       '{\"workerName\":\"Benjamin\",\"location\":\"location b\",\"description\":\"Testing and commissioning\",\"created_on\":\"1688109054678\",\"supervisor\":\"Supervisor A\"}')),
//   //   AddworkerDataStruct.fromSerializableMap(jsonDecode(
//   //       '{\"workerName\":\"Michael\",\"location\":\"location c\",\"description\":\"Wiring\",\"created_on\":\"1688109099584\",\"supervisor\":\"Supervisor A\"}'))
//   // ];
//   // List<AddworkerDataStruct> get workerList => _workerList;
//   // set workerList(List<AddworkerDataStruct> _value) {
//   //   _workerList = _value;
//   // }

//   // void addToWorkerList(AddworkerDataStruct _value) {
//   //   _workerList.add(_value);
//   // }

//   // void removeFromWorkerList(AddworkerDataStruct _value) {
//   //   _workerList.remove(_value);
//   // }

//   // void removeAtIndexFromWorkerList(int _index) {
//   //   _workerList.removeAt(_index);
//   // }

//   // void updateWorkerListAtIndex(
//   //   int _index,
//   //   AddworkerDataStruct Function(AddworkerDataStruct) updateFn,
//   // ) {
//   //   _workerList[_index] = updateFn(_workerList[_index]);
//   // }

//   // void insertAtIndexInWorkerList(int _index, AddworkerDataStruct _value) {
//   //   _workerList.insert(_index, _value);
//   // }

//   void _safeInit(Function() initializeField) {
//     try {
//       initializeField();
//     } catch (_) {}
//   }

//   Future _safeInitAsync(Function() initializeField) async {
//     try {
//       await initializeField();
//     } catch (_) {}
//   }

// // extension FlutterSecureStorageExtensions on FlutterSecureStorage {
// //   static final _lock = Lock();

// //   Future<void> writeSync({required String key, String? value}) async =>
// //       await _lock.synchronized(() async {
// //         await write(key: key, value: value);
// //       });

// //   void remove(String key) => delete(key: key);

// //   Future<String?> getString(String key) async => await read(key: key);
// //   Future<void> setString(String key, String value) async => await writeSync(key: key, value: value);

// //   Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
// //   Future<void> setBool(String key, bool value) async =>
// //       await writeSync(key: key, value: value.toString());

// //   Future<int?> getInt(String key) async => int.tryParse(await read(key: key) ?? '');
// //   Future<void> setInt(String key, int value) async =>
// //       await writeSync(key: key, value: value.toString());

// //   Future<double?> getDouble(String key) async => double.tryParse(await read(key: key) ?? '');
// //   Future<void> setDouble(String key, double value) async =>
// //       await writeSync(key: key, value: value.toString());

// //   Future<List<String>?> getStringList(String key) async => await read(key: key).then((result) {
// //         if (result == null || result.isEmpty) {
// //           return null;
// //         }
// //         return CsvToListConverter().convert(result).first.map((e) => e.toString()).toList();
// //       });
// //   Future<void> setStringList(String key, List<String> value) async =>
// //       await writeSync(key: key, value: ListToCsvConverter().convert([value]));
// }
