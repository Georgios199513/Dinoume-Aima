import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BloodAppointmentRecord extends FirestoreRecord {
  BloodAppointmentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "RelatedEvent" field.
  DocumentReference? _relatedEvent;
  DocumentReference? get relatedEvent => _relatedEvent;
  bool hasRelatedEvent() => _relatedEvent != null;

  // "TimeOfAppointment" field.
  DocumentReference? _timeOfAppointment;
  DocumentReference? get timeOfAppointment => _timeOfAppointment;
  bool hasTimeOfAppointment() => _timeOfAppointment != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "appointmentState" field.
  String? _appointmentState;
  String get appointmentState => _appointmentState ?? '';
  bool hasAppointmentState() => _appointmentState != null;

  // "abracadalo_scheduled_email_id" field.
  String? _abracadaloScheduledEmailId;
  String get abracadaloScheduledEmailId => _abracadaloScheduledEmailId ?? '';
  bool hasAbracadaloScheduledEmailId() => _abracadaloScheduledEmailId != null;

  // "appointmentModifications" field.
  String? _appointmentModifications;
  String get appointmentModifications => _appointmentModifications ?? '';
  bool hasAppointmentModifications() => _appointmentModifications != null;

  // "appointmentCode" field.
  int? _appointmentCode;
  int get appointmentCode => _appointmentCode ?? 0;
  bool hasAppointmentCode() => _appointmentCode != null;

  // "counterTime" field.
  int? _counterTime;
  int get counterTime => _counterTime ?? 0;
  bool hasCounterTime() => _counterTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _relatedEvent = snapshotData['RelatedEvent'] as DocumentReference?;
    _timeOfAppointment =
        snapshotData['TimeOfAppointment'] as DocumentReference?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _appointmentState = snapshotData['appointmentState'] as String?;
    _abracadaloScheduledEmailId =
        snapshotData['abracadalo_scheduled_email_id'] as String?;
    _appointmentModifications =
        snapshotData['appointmentModifications'] as String?;
    _appointmentCode = castToType<int>(snapshotData['appointmentCode']);
    _counterTime = castToType<int>(snapshotData['counterTime']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('blood_appointment')
          : FirebaseFirestore.instance.collectionGroup('blood_appointment');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('blood_appointment').doc(id);

  static Stream<BloodAppointmentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BloodAppointmentRecord.fromSnapshot(s));

  static Future<BloodAppointmentRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BloodAppointmentRecord.fromSnapshot(s));

  static BloodAppointmentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BloodAppointmentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BloodAppointmentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BloodAppointmentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BloodAppointmentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BloodAppointmentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBloodAppointmentRecordData({
  DocumentReference? relatedEvent,
  DocumentReference? timeOfAppointment,
  DateTime? createdTime,
  String? appointmentState,
  String? abracadaloScheduledEmailId,
  String? appointmentModifications,
  int? appointmentCode,
  int? counterTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'RelatedEvent': relatedEvent,
      'TimeOfAppointment': timeOfAppointment,
      'createdTime': createdTime,
      'appointmentState': appointmentState,
      'abracadalo_scheduled_email_id': abracadaloScheduledEmailId,
      'appointmentModifications': appointmentModifications,
      'appointmentCode': appointmentCode,
      'counterTime': counterTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class BloodAppointmentRecordDocumentEquality
    implements Equality<BloodAppointmentRecord> {
  const BloodAppointmentRecordDocumentEquality();

  @override
  bool equals(BloodAppointmentRecord? e1, BloodAppointmentRecord? e2) {
    return e1?.relatedEvent == e2?.relatedEvent &&
        e1?.timeOfAppointment == e2?.timeOfAppointment &&
        e1?.createdTime == e2?.createdTime &&
        e1?.appointmentState == e2?.appointmentState &&
        e1?.abracadaloScheduledEmailId == e2?.abracadaloScheduledEmailId &&
        e1?.appointmentModifications == e2?.appointmentModifications &&
        e1?.appointmentCode == e2?.appointmentCode &&
        e1?.counterTime == e2?.counterTime;
  }

  @override
  int hash(BloodAppointmentRecord? e) => const ListEquality().hash([
        e?.relatedEvent,
        e?.timeOfAppointment,
        e?.createdTime,
        e?.appointmentState,
        e?.abracadaloScheduledEmailId,
        e?.appointmentModifications,
        e?.appointmentCode,
        e?.counterTime
      ]);

  @override
  bool isValidKey(Object? o) => o is BloodAppointmentRecord;
}
