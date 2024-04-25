import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThicknessRecord extends FirestoreRecord {
  ThicknessRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  void _initializeFields() {
    _value = castToType<double>(snapshotData['value']);
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _isDeleted = snapshotData['isDeleted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('THICKNESS');

  static Stream<ThicknessRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ThicknessRecord.fromSnapshot(s));

  static Future<ThicknessRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ThicknessRecord.fromSnapshot(s));

  static ThicknessRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ThicknessRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ThicknessRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ThicknessRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ThicknessRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ThicknessRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createThicknessRecordData({
  double? value,
  String? id,
  String? name,
  int? code,
  bool? isDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'value': value,
      'id': id,
      'name': name,
      'code': code,
      'isDeleted': isDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class ThicknessRecordDocumentEquality implements Equality<ThicknessRecord> {
  const ThicknessRecordDocumentEquality();

  @override
  bool equals(ThicknessRecord? e1, ThicknessRecord? e2) {
    return e1?.value == e2?.value &&
        e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.code == e2?.code &&
        e1?.isDeleted == e2?.isDeleted;
  }

  @override
  int hash(ThicknessRecord? e) => const ListEquality()
      .hash([e?.value, e?.id, e?.name, e?.code, e?.isDeleted]);

  @override
  bool isValidKey(Object? o) => o is ThicknessRecord;
}
