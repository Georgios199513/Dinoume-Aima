import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HospitalCreatedRecord extends FirestoreRecord {
  HospitalCreatedRecord._(
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

  // "Donors" field.
  List<DocumentReference>? _donors;
  List<DocumentReference> get donors => _donors ?? const [];
  bool hasDonors() => _donors != null;

  void _initializeFields() {
    _shortName = snapshotData['ShortName'] as String?;
    _longName = snapshotData['LongName'] as String?;
    _centerCode = castToType<int>(snapshotData['CenterCode']);
    _created = snapshotData['Created'] as bool?;
    _donors = getDataList(snapshotData['Donors']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hospitalCreated');

  static Stream<HospitalCreatedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HospitalCreatedRecord.fromSnapshot(s));

  static Future<HospitalCreatedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HospitalCreatedRecord.fromSnapshot(s));

  static HospitalCreatedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HospitalCreatedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HospitalCreatedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HospitalCreatedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HospitalCreatedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HospitalCreatedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHospitalCreatedRecordData({
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

class HospitalCreatedRecordDocumentEquality
    implements Equality<HospitalCreatedRecord> {
  const HospitalCreatedRecordDocumentEquality();

  @override
  bool equals(HospitalCreatedRecord? e1, HospitalCreatedRecord? e2) {
    const listEquality = ListEquality();
    return e1?.shortName == e2?.shortName &&
        e1?.longName == e2?.longName &&
        e1?.centerCode == e2?.centerCode &&
        e1?.created == e2?.created &&
        listEquality.equals(e1?.donors, e2?.donors);
  }

  @override
  int hash(HospitalCreatedRecord? e) => const ListEquality()
      .hash([e?.shortName, e?.longName, e?.centerCode, e?.created, e?.donors]);

  @override
  bool isValidKey(Object? o) => o is HospitalCreatedRecord;
}
