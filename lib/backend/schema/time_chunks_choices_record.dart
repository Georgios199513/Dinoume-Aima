import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TimeChunksChoicesRecord extends FirestoreRecord {
  TimeChunksChoicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "TimeChunks" field.
  TimeChunkStruct? _timeChunks;
  TimeChunkStruct get timeChunks => _timeChunks ?? TimeChunkStruct();
  bool hasTimeChunks() => _timeChunks != null;

  // "Order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "Appointments" field.
  List<DocumentReference>? _appointments;
  List<DocumentReference> get appointments => _appointments ?? const [];
  bool hasAppointments() => _appointments != null;

  void _initializeFields() {
    _timeChunks = snapshotData['TimeChunks'] is TimeChunkStruct
        ? snapshotData['TimeChunks']
        : TimeChunkStruct.maybeFromMap(snapshotData['TimeChunks']);
    _order = castToType<int>(snapshotData['Order']);
    _appointments = getDataList(snapshotData['Appointments']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TimeChunksChoices');

  static Stream<TimeChunksChoicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TimeChunksChoicesRecord.fromSnapshot(s));

  static Future<TimeChunksChoicesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TimeChunksChoicesRecord.fromSnapshot(s));

  static TimeChunksChoicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TimeChunksChoicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TimeChunksChoicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TimeChunksChoicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TimeChunksChoicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TimeChunksChoicesRecord &&
      reference.path == other.reference.path;
}

Map<String, dynamic> createTimeChunksChoicesRecordData({
  TimeChunkStruct? timeChunks,
  int? order,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'TimeChunks': TimeChunkStruct().toMap(),
      'Order': order,
    }.withoutNulls,
  );

  // Handle nested data for "TimeChunks" field.
  addTimeChunkStructData(firestoreData, timeChunks, 'TimeChunks');

  return firestoreData;
}

class TimeChunksChoicesRecordDocumentEquality
    implements Equality<TimeChunksChoicesRecord> {
  const TimeChunksChoicesRecordDocumentEquality();

  @override
  bool equals(TimeChunksChoicesRecord? e1, TimeChunksChoicesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timeChunks == e2?.timeChunks &&
        e1?.order == e2?.order &&
        listEquality.equals(e1?.appointments, e2?.appointments);
  }

  @override
  int hash(TimeChunksChoicesRecord? e) => const ListEquality().hash(
      [e?.timeChunks, e?.order, const ListEquality().hash(e?.appointments)]);

  @override
  bool isValidKey(Object? o) => o is TimeChunksChoicesRecord;
}
