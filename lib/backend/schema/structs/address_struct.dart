// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AddressStruct extends FFFirebaseStruct {
  AddressStruct({
    String? city,
    String? postalCode,
    String? streetAndNumber,
    String? region,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _city = city,
        _postalCode = postalCode,
        _streetAndNumber = streetAndNumber,
        _region = region,
        super(firestoreUtilData);

  // "City" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "PostalCode" field.
  String? _postalCode;
  String get postalCode => _postalCode ?? '';
  set postalCode(String? val) => _postalCode = val;

  bool hasPostalCode() => _postalCode != null;

  // "StreetAndNumber" field.
  String? _streetAndNumber;
  String get streetAndNumber => _streetAndNumber ?? '';
  set streetAndNumber(String? val) => _streetAndNumber = val;

  bool hasStreetAndNumber() => _streetAndNumber != null;

  // "Region" field.
  String? _region;
  String get region => _region ?? '';
  set region(String? val) => _region = val;

  bool hasRegion() => _region != null;

  static AddressStruct fromMap(Map<String, dynamic> data) => AddressStruct(
        city: data['City'] as String?,
        postalCode: data['PostalCode'] as String?,
        streetAndNumber: data['StreetAndNumber'] as String?,
        region: data['Region'] as String?,
      );

  static AddressStruct? maybeFromMap(dynamic data) =>
      data is Map ? AddressStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'City': _city,
        'PostalCode': _postalCode,
        'StreetAndNumber': _streetAndNumber,
        'Region': _region,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
  static AddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      fromMap(data);

  @override
  String toString() => 'AddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressStruct &&
        city == other.city &&
        postalCode == other.postalCode &&
        streetAndNumber == other.streetAndNumber &&
        region == other.region;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([city, postalCode, streetAndNumber, region]);
}

AddressStruct createAddressStruct({
  String? city,
  String? postalCode,
  String? streetAndNumber,
  String? region,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressStruct(
      city: city,
      postalCode: postalCode,
      streetAndNumber: streetAndNumber,
      region: region,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressStruct? updateAddressStruct(
  AddressStruct? address, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    address
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressStructData(
  Map<String, dynamic> firestoreData,
  AddressStruct? address,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (address == null) {
    return;
  }
  if (address.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && address.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressData = getAddressFirestoreData(address, forFieldValue);
  final nestedData = addressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = address.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressFirestoreData(
  AddressStruct? address, [
  bool forFieldValue = false,
]) {
  if (address == null) {
    return {};
  }
  final firestoreData = mapToFirestore(address.toMap());

  // Add any Firestore field values
  mapToFirestore(address.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressListFirestoreData(
  List<AddressStruct>? addresss,
) =>
    addresss?.map((e) => getAddressFirestoreData(e, true)).toList() ?? [];
