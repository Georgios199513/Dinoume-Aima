import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GenderRecord extends FirestoreRecord {
  GenderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "ImageProfile" field.
  String? _imageProfile;
  String get imageProfile => _imageProfile ?? '';
  bool hasImageProfile() => _imageProfile != null;

  // "GenderSelection" field.
  String? _genderSelection;
  String get genderSelection => _genderSelection ?? '';
  bool hasGenderSelection() => _genderSelection != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _imageProfile = snapshotData['ImageProfile'] as String?;
    _genderSelection = snapshotData['GenderSelection'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Gender');

  static Stream<GenderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GenderRecord.fromSnapshot(s));

  static Future<GenderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GenderRecord.fromSnapshot(s));

  static GenderRecord fromSnapshot(DocumentSnapshot snapshot) => GenderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GenderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GenderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GenderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GenderRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createGenderRecordData({
  String? name,
  String? imageProfile,
  String? genderSelection,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'ImageProfile': imageProfile,
      'GenderSelection': genderSelection,
    }.withoutNulls,
  );

  return firestoreData;
}

class GenderRecordDocumentEquality implements Equality<GenderRecord> {
  const GenderRecordDocumentEquality();

  @override
  bool equals(GenderRecord? e1, GenderRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.imageProfile == e2?.imageProfile &&
        e1?.genderSelection == e2?.genderSelection;
  }

  @override
  int hash(GenderRecord? e) =>
      const ListEquality().hash([e?.name, e?.imageProfile, e?.genderSelection]);

  @override
  bool isValidKey(Object? o) => o is GenderRecord;
}
