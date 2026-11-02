import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TextsRecord extends FirestoreRecord {
  TextsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "Tags" field.
  String? _tags;
  String get tags => _tags ?? '';
  bool hasTags() => _tags != null;

  // "Note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "Image_Notes" field.
  String? _imageNotes;
  String get imageNotes => _imageNotes ?? '';
  bool hasImageNotes() => _imageNotes != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _text = snapshotData['Text'] as String?;
    _tags = snapshotData['Tags'] as String?;
    _note = snapshotData['Note'] as String?;
    _imageNotes = snapshotData['Image_Notes'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Texts');

  static Stream<TextsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TextsRecord.fromSnapshot(s));

  static Future<TextsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TextsRecord.fromSnapshot(s));

  static TextsRecord fromSnapshot(DocumentSnapshot snapshot) => TextsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TextsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TextsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TextsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TextsRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createTextsRecordData({
  String? title,
  String? text,
  String? tags,
  String? note,
  String? imageNotes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'Text': text,
      'Tags': tags,
      'Note': note,
      'Image_Notes': imageNotes,
    }.withoutNulls,
  );

  return firestoreData;
}

class TextsRecordDocumentEquality implements Equality<TextsRecord> {
  const TextsRecordDocumentEquality();

  @override
  bool equals(TextsRecord? e1, TextsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.text == e2?.text &&
        e1?.tags == e2?.tags &&
        e1?.note == e2?.note &&
        e1?.imageNotes == e2?.imageNotes;
  }

  @override
  int hash(TextsRecord? e) => const ListEquality()
      .hash([e?.title, e?.text, e?.tags, e?.note, e?.imageNotes]);

  @override
  bool isValidKey(Object? o) => o is TextsRecord;
}
