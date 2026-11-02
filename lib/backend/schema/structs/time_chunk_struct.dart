// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TimeChunkStruct extends FFFirebaseStruct {
  TimeChunkStruct({
    String? from,
    String? separator,
    String? to,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _from = from,
        _separator = separator,
        _to = to,
        super(firestoreUtilData);

  // "From" field.
  String? _from;
  String get from => _from ?? '';
  set from(String? val) => _from = val;

  bool hasFrom() => _from != null;

  // "Separator" field.
  String? _separator;
  String get separator => _separator ?? '';
  set separator(String? val) => _separator = val;

  bool hasSeparator() => _separator != null;

  // "To" field.
  String? _to;
  String get to => _to ?? '';
  set to(String? val) => _to = val;

  bool hasTo() => _to != null;

  static TimeChunkStruct fromMap(Map<String, dynamic> data) => TimeChunkStruct(
        from: data['From'] as String?,
        separator: data['Separator'] as String?,
        to: data['To'] as String?,
      );

  static TimeChunkStruct? maybeFromMap(dynamic data) => data is Map
      ? TimeChunkStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'From': _from,
        'Separator': _separator,
        'To': _to,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
  static TimeChunkStruct fromSerializableMap(Map<String, dynamic> data) =>
      fromMap(data);

  @override
  String toString() => 'TimeChunkStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TimeChunkStruct &&
        from == other.from &&
        separator == other.separator &&
        to == other.to;
  }

  @override
  int get hashCode => const ListEquality().hash([from, separator, to]);
}

TimeChunkStruct createTimeChunkStruct({
  String? from,
  String? separator,
  String? to,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TimeChunkStruct(
      from: from,
      separator: separator,
      to: to,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TimeChunkStruct? updateTimeChunkStruct(
  TimeChunkStruct? timeChunk, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    timeChunk
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTimeChunkStructData(
  Map<String, dynamic> firestoreData,
  TimeChunkStruct? timeChunk,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (timeChunk == null) {
    return;
  }
  if (timeChunk.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && timeChunk.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final timeChunkData = getTimeChunkFirestoreData(timeChunk, forFieldValue);
  final nestedData = timeChunkData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = timeChunk.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTimeChunkFirestoreData(
  TimeChunkStruct? timeChunk, [
  bool forFieldValue = false,
]) {
  if (timeChunk == null) {
    return {};
  }
  final firestoreData = mapToFirestore(timeChunk.toMap());

  // Add any Firestore field values
  mapToFirestore(timeChunk.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTimeChunkListFirestoreData(
  List<TimeChunkStruct>? timeChunks,
) =>
    timeChunks?.map((e) => getTimeChunkFirestoreData(e, true)).toList() ?? [];
