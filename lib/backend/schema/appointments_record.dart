import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentsRecord extends FirestoreRecord {
  AppointmentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "RelatedEvent" field.
  DocumentReference? _relatedEvent;
  DocumentReference? get relatedEvent => _relatedEvent;
  bool hasRelatedEvent() => _relatedEvent != null;

  // "RelatedUser" field.
  DocumentReference? _relatedUser;
  DocumentReference? get relatedUser => _relatedUser;
  bool hasRelatedUser() => _relatedUser != null;

  // "ProcessCompleted" field.
  bool? _processCompleted;
  bool get processCompleted => _processCompleted ?? false;
  bool hasProcessCompleted() => _processCompleted != null;

  // "TimeOfAppointment" field.
  DocumentReference? _timeOfAppointment;
  DocumentReference? get timeOfAppointment => _timeOfAppointment;
  bool hasTimeOfAppointment() => _timeOfAppointment != null;

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  // "isCanceled" field.
  bool? _isCanceled;
  bool get isCanceled => _isCanceled ?? false;
  bool hasIsCanceled() => _isCanceled != null;

  // "apointmentReminderEmailid" field.
  String? _apointmentReminderEmailid;
  String get apointmentReminderEmailid => _apointmentReminderEmailid ?? '';
  bool hasApointmentReminderEmailid() => _apointmentReminderEmailid != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "notCome" field.
  bool? _notCome;
  bool get notCome => _notCome ?? false;
  bool hasNotCome() => _notCome != null;

  void _initializeFields() {
    _relatedEvent = snapshotData['RelatedEvent'] as DocumentReference?;
    _relatedUser = snapshotData['RelatedUser'] as DocumentReference?;
    _processCompleted = snapshotData['ProcessCompleted'] as bool?;
    _timeOfAppointment =
        snapshotData['TimeOfAppointment'] as DocumentReference?;
    _isCompleted = snapshotData['isCompleted'] as bool?;
    _isCanceled = snapshotData['isCanceled'] as bool?;
    _apointmentReminderEmailid =
        snapshotData['apointmentReminderEmailid'] as String?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _notCome = snapshotData['notCome'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Appointments');

  static Stream<AppointmentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentsRecord.fromSnapshot(s));

  static Future<AppointmentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentsRecord.fromSnapshot(s));

  static AppointmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentsRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createAppointmentsRecordData({
  DocumentReference? relatedEvent,
  DocumentReference? relatedUser,
  bool? processCompleted,
  DocumentReference? timeOfAppointment,
  bool? isCompleted,
  bool? isCanceled,
  String? apointmentReminderEmailid,
  DateTime? createdTime,
  bool? notCome,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'RelatedEvent': relatedEvent,
      'RelatedUser': relatedUser,
      'ProcessCompleted': processCompleted,
      'TimeOfAppointment': timeOfAppointment,
      'isCompleted': isCompleted,
      'isCanceled': isCanceled,
      'apointmentReminderEmailid': apointmentReminderEmailid,
      'createdTime': createdTime,
      'notCome': notCome,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentsRecordDocumentEquality
    implements Equality<AppointmentsRecord> {
  const AppointmentsRecordDocumentEquality();

  @override
  bool equals(AppointmentsRecord? e1, AppointmentsRecord? e2) {
    return e1?.relatedEvent == e2?.relatedEvent &&
        e1?.relatedUser == e2?.relatedUser &&
        e1?.processCompleted == e2?.processCompleted &&
        e1?.timeOfAppointment == e2?.timeOfAppointment &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.isCanceled == e2?.isCanceled &&
        e1?.apointmentReminderEmailid == e2?.apointmentReminderEmailid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.notCome == e2?.notCome;
  }

  @override
  int hash(AppointmentsRecord? e) => const ListEquality().hash([
        e?.relatedEvent,
        e?.relatedUser,
        e?.processCompleted,
        e?.timeOfAppointment,
        e?.isCompleted,
        e?.isCanceled,
        e?.apointmentReminderEmailid,
        e?.createdTime,
        e?.notCome
      ]);

  @override
  bool isValidKey(Object? o) => o is AppointmentsRecord;
}
