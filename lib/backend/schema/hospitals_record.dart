import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HospitalsRecord extends FirestoreRecord {
  HospitalsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ShortName" field.
  String? _shortName;
  String get shortName => _shortName ?? '';
  bool hasShortName() => _shortName != null;

  // "LongName" field.
  String? _longName;
  String get longName => _longName ?? '';
  bool hasLongName() => _longName != null;

  // "CenterCode" field.
  int? _centerCode;
  int get centerCode => _centerCode ?? 0;
  bool hasCenterCode() => _centerCode != null;

  // "Created" field.
  bool? _created;
  bool get created => _created ?? false;
  bool hasCreated() => _created != null;

  void _initializeFields() {
    _shortName = snapshotData['ShortName'] as String?;
    _longName = snapshotData['LongName'] as String?;
    _centerCode = castToType<int>(snapshotData['CenterCode']);
    _created = snapshotData['Created'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hospitals');

  static Stream<HospitalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HospitalsRecord.fromSnapshot(s));

  static Future<HospitalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HospitalsRecord.fromSnapshot(s));

  static HospitalsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HospitalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HospitalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HospitalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HospitalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HospitalsRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createHospitalsRecordData({
  String? shortName,
  String? longName,
  int? centerCode,
  bool? created,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ShortName': shortName,
      'LongName': longName,
      'CenterCode': centerCode,
      'Created': created,
    }.withoutNulls,
  );

  return firestoreData;
}

class HospitalsRecordDocumentEquality implements Equality<HospitalsRecord> {
  const HospitalsRecordDocumentEquality();

  @override
  bool equals(HospitalsRecord? e1, HospitalsRecord? e2) {
    return e1?.shortName == e2?.shortName &&
        e1?.longName == e2?.longName &&
        e1?.centerCode == e2?.centerCode &&
        e1?.created == e2?.created;
  }

  @override
  int hash(HospitalsRecord? e) => const ListEquality()
      .hash([e?.shortName, e?.longName, e?.centerCode, e?.created]);

  @override
  bool isValidKey(Object? o) => o is HospitalsRecord;
}
