// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ChunkOrderRangeStruct extends FFFirebaseStruct {
  ChunkOrderRangeStruct({
    int? from,
    int? to,
    String? fromTime,
    String? separator,
    String? toTime,
    DocumentReference? fromRef,
    DocumentReference? toRef,
    bool? toChange,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _from = from,
        _to = to,
        _fromTime = fromTime,
        _separator = separator,
        _toTime = toTime,
        _fromRef = fromRef,
        _toRef = toRef,
        _toChange = toChange,
        super(firestoreUtilData);

  // "From" field.
  int? _from;
  int get from => _from ?? 0;
  set from(int? val) => _from = val;

  void incrementFrom(int amount) => from = from + amount;

  bool hasFrom() => _from != null;

  // "To" field.
  int? _to;
  int get to => _to ?? 0;
  set to(int? val) => _to = val;

  void incrementTo(int amount) => to = to + amount;

  bool hasTo() => _to != null;

  // "FromTime" field.
  String? _fromTime;
  String get fromTime => _fromTime ?? '';
  set fromTime(String? val) => _fromTime = val;

  bool hasFromTime() => _fromTime != null;

  // "Separator" field.
  String? _separator;
  String get separator => _separator ?? '';
  set separator(String? val) => _separator = val;

  bool hasSeparator() => _separator != null;

  // "ToTime" field.
  String? _toTime;
  String get toTime => _toTime ?? '';
  set toTime(String? val) => _toTime = val;

  bool hasToTime() => _toTime != null;

  // "fromRef" field.
  DocumentReference? _fromRef;
  DocumentReference? get fromRef => _fromRef;
  set fromRef(DocumentReference? val) => _fromRef = val;

  bool hasFromRef() => _fromRef != null;

  // "toRef" field.
  DocumentReference? _toRef;
  DocumentReference? get toRef => _toRef;
  set toRef(DocumentReference? val) => _toRef = val;

  bool hasToRef() => _toRef != null;

  // "toChange" field.
  bool? _toChange;
  bool get toChange => _toChange ?? false;
  set toChange(bool? val) => _toChange = val;

  bool hasToChange() => _toChange != null;

  static ChunkOrderRangeStruct fromMap(Map<String, dynamic> data) =>
      ChunkOrderRangeStruct(
        from: castToType<int>(data['From']),
        to: castToType<int>(data['To']),
        fromTime: data['FromTime'] as String?,
        separator: data['Separator'] as String?,
        toTime: data['ToTime'] as String?,
        fromRef: data['fromRef'] as DocumentReference?,
        toRef: data['toRef'] as DocumentReference?,
        toChange: data['toChange'] as bool?,
      );

  static ChunkOrderRangeStruct? maybeFromMap(dynamic data) => data is Map
      ? ChunkOrderRangeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'From': _from,
        'To': _to,
        'FromTime': _fromTime,
        'Separator': _separator,
        'ToTime': _toTime,
        'fromRef': _fromRef,
        'toRef': _toRef,
        'toChange': _toChange,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
  static ChunkOrderRangeStruct fromSerializableMap(Map<String, dynamic> data) =>
      fromMap(data);

  @override
  String toString() => 'ChunkOrderRangeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChunkOrderRangeStruct &&
        from == other.from &&
        to == other.to &&
        fromTime == other.fromTime &&
        separator == other.separator &&
        toTime == other.toTime &&
        fromRef == other.fromRef &&
        toRef == other.toRef &&
        toChange == other.toChange;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([from, to, fromTime, separator, toTime, fromRef, toRef, toChange]);
}

ChunkOrderRangeStruct createChunkOrderRangeStruct({
  int? from,
  int? to,
  String? fromTime,
  String? separator,
  String? toTime,
  DocumentReference? fromRef,
  DocumentReference? toRef,
  bool? toChange,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChunkOrderRangeStruct(
      from: from,
      to: to,
      fromTime: fromTime,
      separator: separator,
      toTime: toTime,
      fromRef: fromRef,
      toRef: toRef,
      toChange: toChange,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChunkOrderRangeStruct? updateChunkOrderRangeStruct(
  ChunkOrderRangeStruct? chunkOrderRange, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chunkOrderRange
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChunkOrderRangeStructData(
  Map<String, dynamic> firestoreData,
  ChunkOrderRangeStruct? chunkOrderRange,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chunkOrderRange == null) {
    return;
  }
  if (chunkOrderRange.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chunkOrderRange.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chunkOrderRangeData =
      getChunkOrderRangeFirestoreData(chunkOrderRange, forFieldValue);
  final nestedData =
      chunkOrderRangeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chunkOrderRange.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChunkOrderRangeFirestoreData(
  ChunkOrderRangeStruct? chunkOrderRange, [
  bool forFieldValue = false,
]) {
  if (chunkOrderRange == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chunkOrderRange.toMap());

  // Add any Firestore field values
  mapToFirestore(chunkOrderRange.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChunkOrderRangeListFirestoreData(
  List<ChunkOrderRangeStruct>? chunkOrderRanges,
) =>
    chunkOrderRanges
        ?.map((e) => getChunkOrderRangeFirestoreData(e, true))
        .toList() ??
    [];
