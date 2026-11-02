import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegionsRecord extends FirestoreRecord {
  RegionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "region_name" field.
  String? _regionName;
  String get regionName => _regionName ?? '';
  bool hasRegionName() => _regionName != null;

  // "activeEvents" field.
  int? _activeEvents;
  int get activeEvents => _activeEvents ?? 0;
  bool hasActiveEvents() => _activeEvents != null;

  // "events" field.
  List<DocumentReference>? _events;
  List<DocumentReference> get events => _events ?? const [];
  bool hasEvents() => _events != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  void _initializeFields() {
    _regionName = snapshotData['region_name'] as String?;
    _activeEvents = castToType<int>(snapshotData['activeEvents']);
    _events = getDataList(snapshotData['events']);
    _order = castToType<int>(snapshotData['order']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('regions');

  static Stream<RegionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RegionsRecord.fromSnapshot(s));

  static Future<RegionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RegionsRecord.fromSnapshot(s));

  static RegionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RegionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RegionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RegionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RegionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RegionsRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createRegionsRecordData({
  String? regionName,
  int? activeEvents,
  int? order,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'region_name': regionName,
      'activeEvents': activeEvents,
      'order': order,
    }.withoutNulls,
  );

  return firestoreData;
}

class RegionsRecordDocumentEquality implements Equality<RegionsRecord> {
  const RegionsRecordDocumentEquality();

  @override
  bool equals(RegionsRecord? e1, RegionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.regionName == e2?.regionName &&
        e1?.activeEvents == e2?.activeEvents &&
        listEquality.equals(e1?.events, e2?.events) &&
        e1?.order == e2?.order;
  }

  @override
  int hash(RegionsRecord? e) => const ListEquality().hash([
        e?.regionName,
        e?.activeEvents,
        const ListEquality().hash(e?.events),
        e?.order
      ]);

  @override
  bool isValidKey(Object? o) => o is RegionsRecord;
}
