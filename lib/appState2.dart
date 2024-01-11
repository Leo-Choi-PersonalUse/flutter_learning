// import 'package:flutter/material.dart';
// import '/backend/backend.dart';
// import '/backend/schema/structs/Content.dart';
// import 'backend/api_requests/api_manager.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:csv/csv.dart';
// import 'package:synchronized/synchronized.dart';
// import 'flutter_flow/flutter_flow_util.dart';

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
//     await _safeInitAsync(() async {
//       _siteLocationRefID =
//           (await secureStorage.getString('ff_siteLocationRefID'))?.ref ?? _siteLocationRefID;
//     });
//     await _safeInitAsync(() async {
//       _suppilerRefID = (await secureStorage.getString('ff_suppilerRefID'))?.ref ?? _suppilerRefID;
//     });
//     await _safeInitAsync(() async {
//       _siteLocationName = await secureStorage.getString('ff_siteLocationName') ?? _siteLocationName;
//     });
//     await _safeInitAsync(() async {
//       _suppilerName = await secureStorage.getString('ff_suppilerName') ?? _suppilerName;
//     });
//     await _safeInitAsync(() async {
//       _invalidUserID = (await secureStorage.getString('ff_invalidUserID'))?.ref ?? _invalidUserID;
//     });
//     await _safeInitAsync(() async {
//       _department = await secureStorage.getString('ff_department') ?? _department;
//     });
//   }

//   void update(VoidCallback callback) {
//     callback();
//     notifyListeners();
//   }

//   late FlutterSecureStorage secureStorage;

//   String _defaultAvatar =
//       'https://firebasestorage.googleapis.com/v0/b/safety-app-b60b8.appspot.com/o/avatar_placeholder.jpeg?alt=media&token=9445d9b6-be4e-40c4-8b5a-f7851028dd5a';
//   String get defaultAvatar => _defaultAvatar;
//   set defaultAvatar(String _value) {
//     _defaultAvatar = _value;
//   }

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

//   List<AddworkerDataStruct> _workerList = [
//     AddworkerDataStruct.fromSerializableMap(jsonDecode(
//         '{\"workerName\":\"Peter\",\"location\":\"location 1\",\"description\":\"Wiring\",\"created_on\":\"1687968000000\",\"supervisor\":\"Supervisor A\"}')),
//     AddworkerDataStruct.fromSerializableMap(jsonDecode(
//         '{\"workerName\":\"Tim\",\"location\":\"location 1\",\"description\":\"Cable containment\",\"created_on\":\"1688004616294\",\"supervisor\":\"Supervisor A\"}')),
//     AddworkerDataStruct.fromSerializableMap(jsonDecode(
//         '{\"workerName\":\"Ming\",\"location\":\"location a\",\"description\":\"Testing and commissioning\",\"created_on\":\"1688108974898\",\"supervisor\":\"Supervisor A\"}')),
//     AddworkerDataStruct.fromSerializableMap(jsonDecode(
//         '{\"workerName\":\"Benjamin\",\"location\":\"location b\",\"description\":\"Testing and commissioning\",\"created_on\":\"1688109054678\",\"supervisor\":\"Supervisor A\"}')),
//     AddworkerDataStruct.fromSerializableMap(jsonDecode(
//         '{\"workerName\":\"Michael\",\"location\":\"location c\",\"description\":\"Wiring\",\"created_on\":\"1688109099584\",\"supervisor\":\"Supervisor A\"}'))
//   ];
//   List<AddworkerDataStruct> get workerList => _workerList;
//   set workerList(List<AddworkerDataStruct> _value) {
//     _workerList = _value;
//   }

//   void addToWorkerList(AddworkerDataStruct _value) {
//     _workerList.add(_value);
//   }

//   void removeFromWorkerList(AddworkerDataStruct _value) {
//     _workerList.remove(_value);
//   }

//   void removeAtIndexFromWorkerList(int _index) {
//     _workerList.removeAt(_index);
//   }

//   void updateWorkerListAtIndex(
//     int _index,
//     AddworkerDataStruct Function(AddworkerDataStruct) updateFn,
//   ) {
//     _workerList[_index] = updateFn(_workerList[_index]);
//   }

//   void insertAtIndexInWorkerList(int _index, AddworkerDataStruct _value) {
//     _workerList.insert(_index, _value);
//   }

//   String _cr = '';
//   String get cr => _cr;
//   set cr(String _value) {
//     _cr = _value;
//   }

//   List<SiteDailyReportStruct> _SiteDailyReport = [
//     SiteDailyReportStruct.fromSerializableMap(
//         jsonDecode('{\"subContractor\":\"A Limited\",\"headCount\":\"10\"}')),
//     SiteDailyReportStruct.fromSerializableMap(
//         jsonDecode('{\"subContractor\":\"B Limited\",\"headCount\":\"15\"}')),
//     SiteDailyReportStruct.fromSerializableMap(
//         jsonDecode('{\"subContractor\":\"C Limited\",\"headCount\":\"23\"}'))
//   ];
//   List<SiteDailyReportStruct> get SiteDailyReport => _SiteDailyReport;
//   set SiteDailyReport(List<SiteDailyReportStruct> _value) {
//     _SiteDailyReport = _value;
//   }

//   void addToSiteDailyReport(SiteDailyReportStruct _value) {
//     _SiteDailyReport.add(_value);
//   }

//   void removeFromSiteDailyReport(SiteDailyReportStruct _value) {
//     _SiteDailyReport.remove(_value);
//   }

//   void removeAtIndexFromSiteDailyReport(int _index) {
//     _SiteDailyReport.removeAt(_index);
//   }

//   void updateSiteDailyReportAtIndex(
//     int _index,
//     SiteDailyReportStruct Function(SiteDailyReportStruct) updateFn,
//   ) {
//     _SiteDailyReport[_index] = updateFn(_SiteDailyReport[_index]);
//   }

//   void insertAtIndexInSiteDailyReport(int _index, SiteDailyReportStruct _value) {
//     _SiteDailyReport.insert(_index, _value);
//   }

//   List<WorkerDataStruct> _theworkerList = [
//     WorkerDataStruct.fromSerializableMap(jsonDecode(
//         '{\"name\":\"高廣龍\",\"phone\":\"51246235\",\"workID\":\"CWR06004534\",\"skill\":\"水喉\",\"location\":\"1/F 平台\",\"jobType\":\"電制安裝\",\"nameEng\":\"Ko Gwong Lung\",\"isPPE\":\"true\",\"isWage\":\"true\"}')),
//     WorkerDataStruct.fromSerializableMap(jsonDecode(
//         '{\"name\":\"黃少康\",\"phone\":\"96542678\",\"workID\":\"CWR07035197\",\"skill\":\"電工\",\"location\":\"2/F 平台\",\"jobType\":\"拉線\",\"nameEng\":\"Wong Siu Hong\",\"isTrain\":\"true\",\"isWage\":\"true\"}')),
//     WorkerDataStruct.fromSerializableMap(jsonDecode(
//         '{\"name\":\"項少龍\",\"phone\":\"51264157\",\"workID\":\"CWR05126983\",\"skill\":\"電工\",\"isAttend\":\"true\",\"location\":\"1/F 平台\",\"jobType\":\"電制安裝\",\"nameEng\":\"Heung Siu Lung\",\"isTrain\":\"true\"}')),
//     WorkerDataStruct.fromSerializableMap(jsonDecode(
//         '{\"name\":\"陳小明\",\"phone\":\"51261478\",\"workID\":\"CRW65125870\",\"skill\":\"電工\",\"isAttend\":\"true\",\"location\":\"2/F 平台\",\"jobType\":\"電制安裝\",\"nameEng\":\"Chan Siu Ming\",\"isPPE\":\"true\",\"isTrain\":\"false\",\"isWage\":\"true\"}')),
//     WorkerDataStruct.fromSerializableMap(jsonDecode(
//         '{\"name\":\"陳館長\",\"phone\":\"54128762\",\"workID\":\"CRW65125871\",\"skill\":\"電工\",\"isAttend\":\"true\",\"location\":\"2/F 平台\",\"jobType\":\"拉線\",\"nameEng\":\"Chan Kwan Cheung\",\"isPPE\":\"true\",\"isTrain\":\"true\",\"isWage\":\"true\"}')),
//     WorkerDataStruct.fromSerializableMap(jsonDecode(
//         '{\"name\":\"劉偉健\",\"phone\":\"57416521\",\"workID\":\"CRW65125872\",\"skill\":\"電工\",\"isAttend\":\"true\",\"location\":\"1/F 平台\",\"jobType\":\"拉線\",\"nameEng\":\"Lau Wai Kin\",\"isTrain\":\"true\",\"isWage\":\"true\"}'))
//   ];
//   List<WorkerDataStruct> get theworkerList => _theworkerList;
//   set theworkerList(List<WorkerDataStruct> _value) {
//     _theworkerList = _value;
//   }

//   void addToTheworkerList(WorkerDataStruct _value) {
//     _theworkerList.add(_value);
//   }

//   void removeFromTheworkerList(WorkerDataStruct _value) {
//     _theworkerList.remove(_value);
//   }

//   void removeAtIndexFromTheworkerList(int _index) {
//     _theworkerList.removeAt(_index);
//   }

//   void updateTheworkerListAtIndex(
//     int _index,
//     WorkerDataStruct Function(WorkerDataStruct) updateFn,
//   ) {
//     _theworkerList[_index] = updateFn(_theworkerList[_index]);
//   }

//   void insertAtIndexInTheworkerList(int _index, WorkerDataStruct _value) {
//     _theworkerList.insert(_index, _value);
//   }

//   int _formBnWidth = 120;
//   int get formBnWidth => _formBnWidth;
//   set formBnWidth(int _value) {
//     _formBnWidth = _value;
//   }

//   int _tableheaderHeight = 45;
//   int get tableheaderHeight => _tableheaderHeight;
//   set tableheaderHeight(int _value) {
//     _tableheaderHeight = _value;
//   }

//   List<ReportDataStruct> _reportList = [];
//   List<ReportDataStruct> get reportList => _reportList;
//   set reportList(List<ReportDataStruct> _value) {
//     _reportList = _value;
//   }

//   void addToReportList(ReportDataStruct _value) {
//     _reportList.add(_value);
//   }

//   void removeFromReportList(ReportDataStruct _value) {
//     _reportList.remove(_value);
//   }

//   void removeAtIndexFromReportList(int _index) {
//     _reportList.removeAt(_index);
//   }

//   void updateReportListAtIndex(
//     int _index,
//     ReportDataStruct Function(ReportDataStruct) updateFn,
//   ) {
//     _reportList[_index] = updateFn(_reportList[_index]);
//   }

//   void insertAtIndexInReportList(int _index, ReportDataStruct _value) {
//     _reportList.insert(_index, _value);
//   }

//   List<ForemanDataStruct> _theforemanList = [
//     ForemanDataStruct.fromSerializableMap(jsonDecode(
//         '{\"sitelocation\":\"IMH\",\"suppiler\":\"賓記工程\",\"name\":\"陳一心\",\"phone\":\"65128745\",\"workerID\":\"CWR17504321\",\"skill\":\"電工\"}')),
//     ForemanDataStruct.fromSerializableMap(jsonDecode(
//         '{\"sitelocation\":\"IMH\",\"suppiler\":\"賓記工程\",\"name\":\"李志明\",\"phone\":\"98742136\",\"workerID\":\"CWR04512365\",\"skill\":\"水喉\"}'))
//   ];
//   List<ForemanDataStruct> get theforemanList => _theforemanList;
//   set theforemanList(List<ForemanDataStruct> _value) {
//     _theforemanList = _value;
//   }

//   void addToTheforemanList(ForemanDataStruct _value) {
//     _theforemanList.add(_value);
//   }

//   void removeFromTheforemanList(ForemanDataStruct _value) {
//     _theforemanList.remove(_value);
//   }

//   void removeAtIndexFromTheforemanList(int _index) {
//     _theforemanList.removeAt(_index);
//   }

//   void updateTheforemanListAtIndex(
//     int _index,
//     ForemanDataStruct Function(ForemanDataStruct) updateFn,
//   ) {
//     _theforemanList[_index] = updateFn(_theforemanList[_index]);
//   }

//   void insertAtIndexInTheforemanList(int _index, ForemanDataStruct _value) {
//     _theforemanList.insert(_index, _value);
//   }

//   ForemanDataStruct _theForman = ForemanDataStruct.fromSerializableMap(jsonDecode(
//       '{\"sitelocation\":\"IMH\",\"suppiler\":\"苗福記\",\"name\":\"關卓明\",\"phone\":\"91567178\",\"workerID\":\"CWR17043124\",\"skill\":\"電工\",\"nameEng\":\"Kwan Cheuk Ming\"}'));
//   ForemanDataStruct get theForman => _theForman;
//   set theForman(ForemanDataStruct _value) {
//     _theForman = _value;
//   }

//   void updateTheFormanStruct(Function(ForemanDataStruct) updateFn) {
//     updateFn(_theForman);
//   }

//   List<TableTempStruct> _workerNotiList = [
//     TableTempStruct.fromSerializableMap(jsonDecode('{\"name\":\"7/7 - 注意事項\"}')),
//     TableTempStruct.fromSerializableMap(jsonDecode('{\"name\":\"6/7 - 工地安全\"}'))
//   ];
//   List<TableTempStruct> get workerNotiList => _workerNotiList;
//   set workerNotiList(List<TableTempStruct> _value) {
//     _workerNotiList = _value;
//   }

//   void addToWorkerNotiList(TableTempStruct _value) {
//     _workerNotiList.add(_value);
//   }

//   void removeFromWorkerNotiList(TableTempStruct _value) {
//     _workerNotiList.remove(_value);
//   }

//   void removeAtIndexFromWorkerNotiList(int _index) {
//     _workerNotiList.removeAt(_index);
//   }

//   void updateWorkerNotiListAtIndex(
//     int _index,
//     TableTempStruct Function(TableTempStruct) updateFn,
//   ) {
//     _workerNotiList[_index] = updateFn(_workerNotiList[_index]);
//   }

//   void insertAtIndexInWorkerNotiList(int _index, TableTempStruct _value) {
//     _workerNotiList.insert(_index, _value);
//   }

//   List<TableTempStruct> _workerTaskList = [
//     TableTempStruct.fromSerializableMap(jsonDecode('{\"name\":\"起重工作培訓\"}')),
//     TableTempStruct.fromSerializableMap(jsonDecode('{\"name\":\"2023-06 無欠薪聲明\"}'))
//   ];
//   List<TableTempStruct> get workerTaskList => _workerTaskList;
//   set workerTaskList(List<TableTempStruct> _value) {
//     _workerTaskList = _value;
//   }

//   void addToWorkerTaskList(TableTempStruct _value) {
//     _workerTaskList.add(_value);
//   }

//   void removeFromWorkerTaskList(TableTempStruct _value) {
//     _workerTaskList.remove(_value);
//   }

//   void removeAtIndexFromWorkerTaskList(int _index) {
//     _workerTaskList.removeAt(_index);
//   }

//   void updateWorkerTaskListAtIndex(
//     int _index,
//     TableTempStruct Function(TableTempStruct) updateFn,
//   ) {
//     _workerTaskList[_index] = updateFn(_workerTaskList[_index]);
//   }

//   void insertAtIndexInWorkerTaskList(int _index, TableTempStruct _value) {
//     _workerTaskList.insert(_index, _value);
//   }

//   List<TableTempStruct> _foremanNotiList = [
//     TableTempStruct.fromSerializableMap(jsonDecode('{\"name\":\"7/7 - 注意事項\"}')),
//     TableTempStruct.fromSerializableMap(jsonDecode('{\"name\":\"6/7 - 工地安全\"}')),
//     TableTempStruct.fromSerializableMap(jsonDecode('{\"name\":\"1/7 - 無欠薪聲明\"}'))
//   ];
//   List<TableTempStruct> get foremanNotiList => _foremanNotiList;
//   set foremanNotiList(List<TableTempStruct> _value) {
//     _foremanNotiList = _value;
//   }

//   void addToForemanNotiList(TableTempStruct _value) {
//     _foremanNotiList.add(_value);
//   }

//   void removeFromForemanNotiList(TableTempStruct _value) {
//     _foremanNotiList.remove(_value);
//   }

//   void removeAtIndexFromForemanNotiList(int _index) {
//     _foremanNotiList.removeAt(_index);
//   }

//   void updateForemanNotiListAtIndex(
//     int _index,
//     TableTempStruct Function(TableTempStruct) updateFn,
//   ) {
//     _foremanNotiList[_index] = updateFn(_foremanNotiList[_index]);
//   }

//   void insertAtIndexInForemanNotiList(int _index, TableTempStruct _value) {
//     _foremanNotiList.insert(_index, _value);
//   }

//   List<TableTempStruct> _foremanTaskList = [
//     TableTempStruct.fromSerializableMap(jsonDecode('{\"name\":\"7/7 - 開工記錄\"}')),
//     TableTempStruct.fromSerializableMap(jsonDecode('{\"name\":\"起重工作培訓監督\"}')),
//     TableTempStruct.fromSerializableMap(jsonDecode('{\"name\":\"2023-06 無欠薪聲明\"}'))
//   ];
//   List<TableTempStruct> get foremanTaskList => _foremanTaskList;
//   set foremanTaskList(List<TableTempStruct> _value) {
//     _foremanTaskList = _value;
//   }

//   void addToForemanTaskList(TableTempStruct _value) {
//     _foremanTaskList.add(_value);
//   }

//   void removeFromForemanTaskList(TableTempStruct _value) {
//     _foremanTaskList.remove(_value);
//   }

//   void removeAtIndexFromForemanTaskList(int _index) {
//     _foremanTaskList.removeAt(_index);
//   }

//   void updateForemanTaskListAtIndex(
//     int _index,
//     TableTempStruct Function(TableTempStruct) updateFn,
//   ) {
//     _foremanTaskList[_index] = updateFn(_foremanTaskList[_index]);
//   }

//   void insertAtIndexInForemanTaskList(int _index, TableTempStruct _value) {
//     _foremanTaskList.insert(_index, _value);
//   }

//   List<TableTempStruct> _safetyNotiList = [
//     TableTempStruct.fromSerializableMap(jsonDecode('{\"name\":\"7/7 - 安全培訓排程\"}')),
//     TableTempStruct.fromSerializableMap(jsonDecode('{\"name\":\"6/7 - 工地安全講座\"}')),
//     TableTempStruct.fromSerializableMap(jsonDecode('{\"name\":\"1/7 - 無欠薪聲明收集進度\"}'))
//   ];
//   List<TableTempStruct> get safetyNotiList => _safetyNotiList;
//   set safetyNotiList(List<TableTempStruct> _value) {
//     _safetyNotiList = _value;
//   }

//   void addToSafetyNotiList(TableTempStruct _value) {
//     _safetyNotiList.add(_value);
//   }

//   void removeFromSafetyNotiList(TableTempStruct _value) {
//     _safetyNotiList.remove(_value);
//   }

//   void removeAtIndexFromSafetyNotiList(int _index) {
//     _safetyNotiList.removeAt(_index);
//   }

//   void updateSafetyNotiListAtIndex(
//     int _index,
//     TableTempStruct Function(TableTempStruct) updateFn,
//   ) {
//     _safetyNotiList[_index] = updateFn(_safetyNotiList[_index]);
//   }

//   void insertAtIndexInSafetyNotiList(int _index, TableTempStruct _value) {
//     _safetyNotiList.insert(_index, _value);
//   }

//   List<TableTempStruct> _safetyTaskList = [
//     TableTempStruct.fromSerializableMap(jsonDecode('{\"name\":\"7/7 - 開工記錄批核\"}')),
//     TableTempStruct.fromSerializableMap(jsonDecode('{\"name\":\"起重工作培訓監督\"}')),
//     TableTempStruct.fromSerializableMap(jsonDecode('{\"name\":\"2023-06 無欠薪聲明收集\"}'))
//   ];
//   List<TableTempStruct> get safetyTaskList => _safetyTaskList;
//   set safetyTaskList(List<TableTempStruct> _value) {
//     _safetyTaskList = _value;
//   }

//   void addToSafetyTaskList(TableTempStruct _value) {
//     _safetyTaskList.add(_value);
//   }

//   void removeFromSafetyTaskList(TableTempStruct _value) {
//     _safetyTaskList.remove(_value);
//   }

//   void removeAtIndexFromSafetyTaskList(int _index) {
//     _safetyTaskList.removeAt(_index);
//   }

//   void updateSafetyTaskListAtIndex(
//     int _index,
//     TableTempStruct Function(TableTempStruct) updateFn,
//   ) {
//     _safetyTaskList[_index] = updateFn(_safetyTaskList[_index]);
//   }

//   void insertAtIndexInSafetyTaskList(int _index, TableTempStruct _value) {
//     _safetyTaskList.insert(_index, _value);
//   }

//   ForemanDataStruct _theSafety = ForemanDataStruct.fromSerializableMap(jsonDecode(
//       '{\"sitelocation\":\"IMH\",\"name\":\"盧建基\",\"phone\":\"90269523\",\"workerID\":\"N0445\",\"skill\":\"不適用\",\"nameEng\":\"Ko Kin Kei\"}'));
//   ForemanDataStruct get theSafety => _theSafety;
//   set theSafety(ForemanDataStruct _value) {
//     _theSafety = _value;
//   }

//   void updateTheSafetyStruct(Function(ForemanDataStruct) updateFn) {
//     updateFn(_theSafety);
//   }

//   List<SignTableStruct> _signTable = [
//     SignTableStruct.fromSerializableMap(jsonDecode(
//         '{\"name\":\"PPE 簽收\",\"form\":\"[\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"高廣龍\\\\\\\",\\\\\\\"isCheck\\\\\\\":\\\\\\\"true\\\\\\\",\\\\\\\"workID\\\\\\\":\\\\\\\"CWR06004534\\\\\\\"}\\\",\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"黃少康\\\\\\\",\\\\\\\"isCheck\\\\\\\":\\\\\\\"true\\\\\\\",\\\\\\\"workID\\\\\\\":\\\\\\\"CWR07035197\\\\\\\"}\\\",\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"項少龍\\\\\\\",\\\\\\\"isCheck\\\\\\\":\\\\\\\"true\\\\\\\",\\\\\\\"workID\\\\\\\":\\\\\\\"CWR05126983\\\\\\\"}\\\",\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"陳小明\\\\\\\",\\\\\\\"isCheck\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"workID\\\\\\\":\\\\\\\"CRW65125870\\\\\\\"}\\\",\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"陳館長\\\\\\\",\\\\\\\"isCheck\\\\\\\":\\\\\\\"true\\\\\\\",\\\\\\\"workID\\\\\\\":\\\\\\\"CRW65125871\\\\\\\"}\\\",\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"劉偉健\\\\\\\",\\\\\\\"isCheck\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"workID\\\\\\\":\\\\\\\"CRW65125872\\\\\\\"}\\\"]\"}')),
//     SignTableStruct.fromSerializableMap(jsonDecode(
//         '{\"name\":\"培訓簽到\",\"form\":\"[\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"高廣龍\\\\\\\",\\\\\\\"isCheck\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"workID\\\\\\\":\\\\\\\"CWR06004534\\\\\\\"}\\\",\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"黃少康\\\\\\\",\\\\\\\"isCheck\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"workID\\\\\\\":\\\\\\\"CWR07035197\\\\\\\"}\\\",\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"項少龍\\\\\\\",\\\\\\\"isCheck\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"workID\\\\\\\":\\\\\\\"CWR05126983\\\\\\\"}\\\",\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"陳小明\\\\\\\",\\\\\\\"isCheck\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"workID\\\\\\\":\\\\\\\"CRW65125870\\\\\\\"}\\\",\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"陳館長\\\\\\\",\\\\\\\"isCheck\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"workID\\\\\\\":\\\\\\\"CRW65125871\\\\\\\"}\\\",\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"劉偉健\\\\\\\",\\\\\\\"isCheck\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"workID\\\\\\\":\\\\\\\"CRW65125872\\\\\\\"}\\\"]\"}')),
//     SignTableStruct.fromSerializableMap(jsonDecode(
//         '{\"name\":\"無欠薪聲明簽署\",\"form\":\"[\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"高廣龍\\\\\\\",\\\\\\\"isCheck\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"workID\\\\\\\":\\\\\\\"CWR06004534\\\\\\\"}\\\",\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"黃少康\\\\\\\",\\\\\\\"isCheck\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"workID\\\\\\\":\\\\\\\"CWR07035197\\\\\\\"}\\\",\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"項少龍\\\\\\\",\\\\\\\"isCheck\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"workID\\\\\\\":\\\\\\\"CWR05126983\\\\\\\"}\\\",\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"陳小明\\\\\\\",\\\\\\\"isCheck\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"workID\\\\\\\":\\\\\\\"CRW65125870\\\\\\\"}\\\",\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"陳館長\\\\\\\",\\\\\\\"isCheck\\\\\\\":\\\\\\\"true\\\\\\\",\\\\\\\"workID\\\\\\\":\\\\\\\"CRW65125871\\\\\\\"}\\\",\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"劉偉健\\\\\\\",\\\\\\\"isCheck\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"workID\\\\\\\":\\\\\\\"CRW65125872\\\\\\\"}\\\"]\"}'))
//   ];
//   List<SignTableStruct> get signTable => _signTable;
//   set signTable(List<SignTableStruct> _value) {
//     _signTable = _value;
//   }

//   void addToSignTable(SignTableStruct _value) {
//     _signTable.add(_value);
//   }

//   void removeFromSignTable(SignTableStruct _value) {
//     _signTable.remove(_value);
//   }

//   void removeAtIndexFromSignTable(int _index) {
//     _signTable.removeAt(_index);
//   }

//   void updateSignTableAtIndex(
//     int _index,
//     SignTableStruct Function(SignTableStruct) updateFn,
//   ) {
//     _signTable[_index] = updateFn(_signTable[_index]);
//   }

//   void insertAtIndexInSignTable(int _index, SignTableStruct _value) {
//     _signTable.insert(_index, _value);
//   }

//   bool _isInside = false;
//   bool get isInside => _isInside;
//   set isInside(bool _value) {
//     _isInside = _value;
//   }

//   LatLng? _circleLocation = LatLng(22.321405388108683, 114.21129406486878);
//   LatLng? get circleLocation => _circleLocation;
//   set circleLocation(LatLng? _value) {
//     _circleLocation = _value;
//   }

//   String _qrcode = '';
//   String get qrcode => _qrcode;
//   set qrcode(String _value) {
//     _qrcode = _value;
//   }

//   DocumentReference? _siteLocationRefID;
//   DocumentReference? get siteLocationRefID => _siteLocationRefID;
//   set siteLocationRefID(DocumentReference? _value) {
//     _siteLocationRefID = _value;
//     _value != null
//         ? secureStorage.setString('ff_siteLocationRefID', _value.path)
//         : secureStorage.remove('ff_siteLocationRefID');
//   }

//   void deleteSiteLocationRefID() {
//     secureStorage.delete(key: 'ff_siteLocationRefID');
//   }

//   DocumentReference? _suppilerRefID;
//   DocumentReference? get suppilerRefID => _suppilerRefID;
//   set suppilerRefID(DocumentReference? _value) {
//     _suppilerRefID = _value;
//     _value != null
//         ? secureStorage.setString('ff_suppilerRefID', _value.path)
//         : secureStorage.remove('ff_suppilerRefID');
//   }

//   void deleteSuppilerRefID() {
//     secureStorage.delete(key: 'ff_suppilerRefID');
//   }

//   String _siteLocationName = '';
//   String get siteLocationName => _siteLocationName;
//   set siteLocationName(String _value) {
//     _siteLocationName = _value;
//     secureStorage.setString('ff_siteLocationName', _value);
//   }

//   void deleteSiteLocationName() {
//     secureStorage.delete(key: 'ff_siteLocationName');
//   }

//   String _suppilerName = '';
//   String get suppilerName => _suppilerName;
//   set suppilerName(String _value) {
//     _suppilerName = _value;
//     secureStorage.setString('ff_suppilerName', _value);
//   }

//   void deleteSuppilerName() {
//     secureStorage.delete(key: 'ff_suppilerName');
//   }

//   DocumentReference? _siteLocationSuppilerRefID;
//   DocumentReference? get siteLocationSuppilerRefID => _siteLocationSuppilerRefID;
//   set siteLocationSuppilerRefID(DocumentReference? _value) {
//     _siteLocationSuppilerRefID = _value;
//   }

//   DocumentReference? _invalidUserID = FirebaseFirestore.instance.doc('/staff/JS6Nvw0gyepchDbuyQYg');
//   DocumentReference? get invalidUserID => _invalidUserID;
//   set invalidUserID(DocumentReference? _value) {
//     _invalidUserID = _value;
//     _value != null
//         ? secureStorage.setString('ff_invalidUserID', _value.path)
//         : secureStorage.remove('ff_invalidUserID');
//   }

//   void deleteInvalidUserID() {
//     secureStorage.delete(key: 'ff_invalidUserID');
//   }

//   String _department = '';
//   String get department => _department;
//   set department(String _value) {
//     _department = _value;
//     secureStorage.setString('ff_department', _value);
//   }

//   void deleteDepartment() {
//     secureStorage.delete(key: 'ff_department');
//   }
// }

// LatLng? _latLngFromString(String? val) {
//   if (val == null) {
//     return null;
//   }
//   final split = val.split(',');
//   final lat = double.parse(split.first);
//   final lng = double.parse(split.last);
//   return LatLng(lat, lng);
// }

// void _safeInit(Function() initializeField) {
//   try {
//     initializeField();
//   } catch (_) {}
// }

// Future _safeInitAsync(Function() initializeField) async {
//   try {
//     await initializeField();
//   } catch (_) {}
// }

// extension FlutterSecureStorageExtensions on FlutterSecureStorage {
//   static final _lock = Lock();

//   Future<void> writeSync({required String key, String? value}) async =>
//       await _lock.synchronized(() async {
//         await write(key: key, value: value);
//       });

//   void remove(String key) => delete(key: key);

//   Future<String?> getString(String key) async => await read(key: key);
//   Future<void> setString(String key, String value) async => await writeSync(key: key, value: value);

//   Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
//   Future<void> setBool(String key, bool value) async =>
//       await writeSync(key: key, value: value.toString());

//   Future<int?> getInt(String key) async => int.tryParse(await read(key: key) ?? '');
//   Future<void> setInt(String key, int value) async =>
//       await writeSync(key: key, value: value.toString());

//   Future<double?> getDouble(String key) async => double.tryParse(await read(key: key) ?? '');
//   Future<void> setDouble(String key, double value) async =>
//       await writeSync(key: key, value: value.toString());

//   Future<List<String>?> getStringList(String key) async => await read(key: key).then((result) {
//         if (result == null || result.isEmpty) {
//           return null;
//         }
//         return CsvToListConverter().convert(result).first.map((e) => e.toString()).toList();
//       });
//   Future<void> setStringList(String key, List<String> value) async =>
//       await writeSync(key: key, value: ListToCsvConverter().convert([value]));
// }
