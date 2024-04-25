import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class PincodesRecord extends FirestoreRecord {
  PincodesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "pincode" field.
  String? _pincode;
  String get pincode => _pincode ?? '';
  bool hasPincode() => _pincode != null;

  // "tat" field.
  String? _tat;
  String get tat => _tat ?? '';
  bool hasTat() => _tat != null;

  void _initializeFields() {
    _pincode = snapshotData['pincode'] as String?;
    _tat = snapshotData['tat'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PINCODES');

  static Stream<PincodesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PincodesRecord.fromSnapshot(s));

  static Future<PincodesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PincodesRecord.fromSnapshot(s));

  static PincodesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PincodesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PincodesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PincodesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PincodesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PincodesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPincodesRecordData({
  String? pincode,
  String? tat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pincode': pincode,
      'tat': tat,
    }.withoutNulls,
  );

  return firestoreData;
}

class PincodesRecordDocumentEquality implements Equality<PincodesRecord> {
  const PincodesRecordDocumentEquality();

  @override
  bool equals(PincodesRecord? e1, PincodesRecord? e2) {
    return e1?.pincode == e2?.pincode && e1?.tat == e2?.tat;
  }

  @override
  int hash(PincodesRecord? e) =>
      const ListEquality().hash([e?.pincode, e?.tat]);

  @override
  bool isValidKey(Object? o) => o is PincodesRecord;
}
