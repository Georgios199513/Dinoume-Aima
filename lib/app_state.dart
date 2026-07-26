import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _initialValueForHomePage =
          await secureStorage.getString('ff_initialValueForHomePage') ??
              _initialValueForHomePage;
    });
    await _safeInitAsync(() async {
      _appVersion =
          await secureStorage.getString('ff_appVersion') ?? _appVersion;
    });
    await _safeInitAsync(() async {
      _NumbersOfAppointments =
          await secureStorage.getInt('ff_NumbersOfAppointments') ??
              _NumbersOfAppointments;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _CurrentRegion = 'Αττική';
  String get CurrentRegion => _CurrentRegion;
  set CurrentRegion(String value) {
    _CurrentRegion = value;
  }

  DateTime? _DefaultBirthday =
      DateTime.fromMillisecondsSinceEpoch(815049180000);
  DateTime? get DefaultBirthday => _DefaultBirthday;
  set DefaultBirthday(DateTime? value) {
    _DefaultBirthday = value;
  }

  DocumentReference? _DefaultGender =
      FirebaseFirestore.instance.doc('/Gender/kO9Zr5qye68AZ4b8bOgq');
  DocumentReference? get DefaultGender => _DefaultGender;
  set DefaultGender(DocumentReference? value) {
    _DefaultGender = value;
  }

  DocumentReference? _selectedEvent;
  DocumentReference? get selectedEvent => _selectedEvent;
  set selectedEvent(DocumentReference? value) {
    _selectedEvent = value;
  }

  String _ChooseGender = 'Δεν θέλω να δηλώσω';
  String get ChooseGender => _ChooseGender;
  set ChooseGender(String value) {
    _ChooseGender = value;
  }

  bool _IsEventsInRegion = false;
  bool get IsEventsInRegion => _IsEventsInRegion;
  set IsEventsInRegion(bool value) {
    _IsEventsInRegion = value;
  }

  bool _isAppointmentCreated = false;
  bool get isAppointmentCreated => _isAppointmentCreated;
  set isAppointmentCreated(bool value) {
    _isAppointmentCreated = value;
  }

  String _initialValueForHomePage = 'Λίστα';
  String get initialValueForHomePage => _initialValueForHomePage;
  set initialValueForHomePage(String value) {
    _initialValueForHomePage = value;
    secureStorage.setString('ff_initialValueForHomePage', value);
  }

  void deleteInitialValueForHomePage() {
    secureStorage.delete(key: 'ff_initialValueForHomePage');
  }

  String _selectedTimeForAppointment = '';
  String get selectedTimeForAppointment => _selectedTimeForAppointment;
  set selectedTimeForAppointment(String value) {
    _selectedTimeForAppointment = value;
  }

  String _appVersion = '';
  String get appVersion => _appVersion;
  set appVersion(String value) {
    _appVersion = value;
    secureStorage.setString('ff_appVersion', value);
  }

  void deleteAppVersion() {
    secureStorage.delete(key: 'ff_appVersion');
  }

  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? value) {
    _startDate = value;
  }

  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? value) {
    _endDate = value;
  }

  int _VerifyingTimes = 0;
  int get VerifyingTimes => _VerifyingTimes;
  set VerifyingTimes(int value) {
    _VerifyingTimes = value;
  }

  DocumentReference? _inCreationBloodAppointment;
  DocumentReference? get inCreationBloodAppointment =>
      _inCreationBloodAppointment;
  set inCreationBloodAppointment(DocumentReference? value) {
    _inCreationBloodAppointment = value;
  }

  DocumentReference? _selectedTimeChunk;
  DocumentReference? get selectedTimeChunk => _selectedTimeChunk;
  set selectedTimeChunk(DocumentReference? value) {
    _selectedTimeChunk = value;
  }

  LatLng? _defaultLocationCenter = LatLng(37.965411, 23.724663);
  LatLng? get defaultLocationCenter => _defaultLocationCenter;
  set defaultLocationCenter(LatLng? value) {
    _defaultLocationCenter = value;
  }

  bool _pendingAppointment = false;
  bool get pendingAppointment => _pendingAppointment;
  set pendingAppointment(bool value) {
    _pendingAppointment = value;
  }

  int _indexProfile = 0;
  int get indexProfile => _indexProfile;
  set indexProfile(int value) {
    _indexProfile = value;
  }

  DateTime? _LastEventDate;
  DateTime? get LastEventDate => _LastEventDate;
  set LastEventDate(DateTime? value) {
    _LastEventDate = value;
  }

  String _LastAppointmentState = '';
  String get LastAppointmentState => _LastAppointmentState;
  set LastAppointmentState(String value) {
    _LastAppointmentState = value;
  }

  DocumentReference? _LastAppointmentRef;
  DocumentReference? get LastAppointmentRef => _LastAppointmentRef;
  set LastAppointmentRef(DocumentReference? value) {
    _LastAppointmentRef = value;
  }

  DateTime? _lastEventAppStateUpdate =
      DateTime.fromMillisecondsSinceEpoch(1690888500000);
  DateTime? get lastEventAppStateUpdate => _lastEventAppStateUpdate;
  set lastEventAppStateUpdate(DateTime? value) {
    _lastEventAppStateUpdate = value;
  }

  List<DocumentReference> _oldPendingAppointment = [];
  List<DocumentReference> get oldPendingAppointment => _oldPendingAppointment;
  set oldPendingAppointment(List<DocumentReference> value) {
    _oldPendingAppointment = value;
  }

  void addToOldPendingAppointment(DocumentReference value) {
    oldPendingAppointment.add(value);
  }

  void removeFromOldPendingAppointment(DocumentReference value) {
    oldPendingAppointment.remove(value);
  }

  void removeAtIndexFromOldPendingAppointment(int index) {
    oldPendingAppointment.removeAt(index);
  }

  void updateOldPendingAppointmentAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    oldPendingAppointment[index] = updateFn(_oldPendingAppointment[index]);
  }

  void insertAtIndexInOldPendingAppointment(
      int index, DocumentReference value) {
    oldPendingAppointment.insert(index, value);
  }

  DateTime? _oldPendingAppointmentUpdateTime =
      DateTime.fromMillisecondsSinceEpoch(1659352260000);
  DateTime? get oldPendingAppointmentUpdateTime =>
      _oldPendingAppointmentUpdateTime;
  set oldPendingAppointmentUpdateTime(DateTime? value) {
    _oldPendingAppointmentUpdateTime = value;
  }

  DocumentReference? _lastEventRef;
  DocumentReference? get lastEventRef => _lastEventRef;
  set lastEventRef(DocumentReference? value) {
    _lastEventRef = value;
  }

  String _SearchStateMyAppointment = 'searching';
  String get SearchStateMyAppointment => _SearchStateMyAppointment;
  set SearchStateMyAppointment(String value) {
    _SearchStateMyAppointment = value;
  }

  List<DocumentReference> _NumbersOfAppointmentsToBloodAppointments = [];
  List<DocumentReference> get NumbersOfAppointmentsToBloodAppointments =>
      _NumbersOfAppointmentsToBloodAppointments;
  set NumbersOfAppointmentsToBloodAppointments(List<DocumentReference> value) {
    _NumbersOfAppointmentsToBloodAppointments = value;
  }

  void addToNumbersOfAppointmentsToBloodAppointments(DocumentReference value) {
    NumbersOfAppointmentsToBloodAppointments.add(value);
  }

  void removeFromNumbersOfAppointmentsToBloodAppointments(
      DocumentReference value) {
    NumbersOfAppointmentsToBloodAppointments.remove(value);
  }

  void removeAtIndexFromNumbersOfAppointmentsToBloodAppointments(int index) {
    NumbersOfAppointmentsToBloodAppointments.removeAt(index);
  }

  void updateNumbersOfAppointmentsToBloodAppointmentsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    NumbersOfAppointmentsToBloodAppointments[index] =
        updateFn(_NumbersOfAppointmentsToBloodAppointments[index]);
  }

  void insertAtIndexInNumbersOfAppointmentsToBloodAppointments(
      int index, DocumentReference value) {
    NumbersOfAppointmentsToBloodAppointments.insert(index, value);
  }

  int _NumbersOfAppointments = 0;
  int get NumbersOfAppointments => _NumbersOfAppointments;
  set NumbersOfAppointments(int value) {
    _NumbersOfAppointments = value;
    secureStorage.setInt('ff_NumbersOfAppointments', value);
  }

  void deleteNumbersOfAppointments() {
    secureStorage.delete(key: 'ff_NumbersOfAppointments');
  }

  List<DocumentReference> _NewBloodAppointmentsToAdd = [];
  List<DocumentReference> get NewBloodAppointmentsToAdd =>
      _NewBloodAppointmentsToAdd;
  set NewBloodAppointmentsToAdd(List<DocumentReference> value) {
    _NewBloodAppointmentsToAdd = value;
  }

  void addToNewBloodAppointmentsToAdd(DocumentReference value) {
    NewBloodAppointmentsToAdd.add(value);
  }

  void removeFromNewBloodAppointmentsToAdd(DocumentReference value) {
    NewBloodAppointmentsToAdd.remove(value);
  }

  void removeAtIndexFromNewBloodAppointmentsToAdd(int index) {
    NewBloodAppointmentsToAdd.removeAt(index);
  }

  void updateNewBloodAppointmentsToAddAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    NewBloodAppointmentsToAdd[index] =
        updateFn(_NewBloodAppointmentsToAdd[index]);
  }

  void insertAtIndexInNewBloodAppointmentsToAdd(
      int index, DocumentReference value) {
    NewBloodAppointmentsToAdd.insert(index, value);
  }

  int _totalToUpdate = 0;
  int get totalToUpdate => _totalToUpdate;
  set totalToUpdate(int value) {
    _totalToUpdate = value;
  }

  bool _updateLater = false;
  bool get updateLater => _updateLater;
  set updateLater(bool value) {
    _updateLater = value;
  }

  int _progressBarValue = 0;
  int get progressBarValue => _progressBarValue;
  set progressBarValue(int value) {
    _progressBarValue = value;
  }

  String _progressBarDescription = 'Ξεκινάμε...';
  String get progressBarDescription => _progressBarDescription;
  set progressBarDescription(String value) {
    _progressBarDescription = value;
  }

  int _Timer = 0;
  int get Timer => _Timer;
  set Timer(int value) {
    _Timer = value;
  }

  bool _PopUpMessageOutput = false;
  bool get PopUpMessageOutput => _PopUpMessageOutput;
  set PopUpMessageOutput(bool value) {
    _PopUpMessageOutput = value;
  }

  bool _internetConnection = false;
  bool get internetConnection => _internetConnection;
  set internetConnection(bool value) {
    _internetConnection = value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
