// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LastEventStruct extends FFFirebaseStruct {
  LastEventStruct({
    DocumentReference? lastAppointmentRef,
    DocumentReference? lastEventRef,
    DateTime? lastEventDate,
    DateTime? lastUpdate,
    bool? isCompleted,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lastAppointmentRef = lastAppointmentRef,
        _lastEventRef = lastEventRef,
        _lastEventDate = lastEventDate,
        _lastUpdate = lastUpdate,
        _isCompleted = isCompleted,
        super(firestoreUtilData);

  // "lastAppointmentRef" field.
  DocumentReference? _lastAppointmentRef;
  DocumentReference? get lastAppointmentRef => _lastAppointmentRef;
  set lastAppointmentRef(DocumentReference? val) => _lastAppointmentRef = val;

  bool hasLastAppointmentRef() => _lastAppointmentRef != null;

  // "lastEventRef" field.
  DocumentReference? _lastEventRef;
  DocumentReference? get lastEventRef => _lastEventRef;
  set lastEventRef(DocumentReference? val) => _lastEventRef = val;

  bool hasLastEventRef() => _lastEventRef != null;

  // "lastEventDate" field.
  DateTime? _lastEventDate;
  DateTime? get lastEventDate => _lastEventDate;
  set lastEventDate(DateTime? val) => _lastEventDate = val;

  bool hasLastEventDate() => _lastEventDate != null;

  // "LastUpdate" field.
  DateTime? _lastUpdate;
  DateTime? get lastUpdate => _lastUpdate;
  set lastUpdate(DateTime? val) => _lastUpdate = val;

  bool hasLastUpdate() => _lastUpdate != null;

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  set isCompleted(bool? val) => _isCompleted = val;

  bool hasIsCompleted() => _isCompleted != null;

  static LastEventStruct fromMap(Map<String, dynamic> data) => LastEventStruct(
        lastAppointmentRef: data['lastAppointmentRef'] as DocumentReference?,
        lastEventRef: data['lastEventRef'] as DocumentReference?,
        lastEventDate: data['lastEventDate'] as DateTime?,
        lastUpdate: data['LastUpdate'] as DateTime?,
        isCompleted: data['isCompleted'] as bool?,
      );

  static LastEventStruct? maybeFromMap(dynamic data) => data is Map
      ? LastEventStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lastAppointmentRef': _lastAppointmentRef,
        'lastEventRef': _lastEventRef,
        'lastEventDate': _lastEventDate,
        'LastUpdate': _lastUpdate,
        'isCompleted': _isCompleted,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
  static LastEventStruct fromSerializableMap(Map<String, dynamic> data) =>
      fromMap(data);

  @override
  String toString() => 'LastEventStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LastEventStruct &&
        lastAppointmentRef == other.lastAppointmentRef &&
        lastEventRef == other.lastEventRef &&
        lastEventDate == other.lastEventDate &&
        lastUpdate == other.lastUpdate &&
        isCompleted == other.isCompleted;
  }

  @override
  int get hashCode => const ListEquality().hash([
        lastAppointmentRef,
        lastEventRef,
        lastEventDate,
        lastUpdate,
        isCompleted
      ]);
}

LastEventStruct createLastEventStruct({
  DocumentReference? lastAppointmentRef,
  DocumentReference? lastEventRef,
  DateTime? lastEventDate,
  DateTime? lastUpdate,
  bool? isCompleted,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LastEventStruct(
      lastAppointmentRef: lastAppointmentRef,
      lastEventRef: lastEventRef,
      lastEventDate: lastEventDate,
      lastUpdate: lastUpdate,
      isCompleted: isCompleted,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LastEventStruct? updateLastEventStruct(
  LastEventStruct? lastEvent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lastEvent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLastEventStructData(
  Map<String, dynamic> firestoreData,
  LastEventStruct? lastEvent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lastEvent == null) {
    return;
  }
  if (lastEvent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lastEvent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lastEventData = getLastEventFirestoreData(lastEvent, forFieldValue);
  final nestedData = lastEventData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lastEvent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLastEventFirestoreData(
  LastEventStruct? lastEvent, [
  bool forFieldValue = false,
]) {
  if (lastEvent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lastEvent.toMap());

  // Add any Firestore field values
  mapToFirestore(lastEvent.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLastEventListFirestoreData(
  List<LastEventStruct>? lastEvents,
) =>
    lastEvents?.map((e) => getLastEventFirestoreData(e, true)).toList() ?? [];
