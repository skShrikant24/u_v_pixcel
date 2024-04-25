import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShapesRecord extends FirestoreRecord {
  ShapesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  void _initializeFields() {
    _icon = snapshotData['icon'] as String?;
    _id = snapshotData['id'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _name = snapshotData['name'] as String?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SHAPES');

  static Stream<ShapesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShapesRecord.fromSnapshot(s));

  static Future<ShapesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShapesRecord.fromSnapshot(s));

  static ShapesRecord fromSnapshot(DocumentSnapshot snapshot) => ShapesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShapesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShapesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShapesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShapesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShapesRecordData({
  String? icon,
  String? id,
  int? code,
  String? name,
  bool? isDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'icon': icon,
      'id': id,
      'code': code,
      'name': name,
      'isDeleted': isDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShapesRecordDocumentEquality implements Equality<ShapesRecord> {
  const ShapesRecordDocumentEquality();

  @override
  bool equals(ShapesRecord? e1, ShapesRecord? e2) {
    return e1?.icon == e2?.icon &&
        e1?.id == e2?.id &&
        e1?.code == e2?.code &&
        e1?.name == e2?.name &&
        e1?.isDeleted == e2?.isDeleted;
  }

  @override
  int hash(ShapesRecord? e) => const ListEquality()
      .hash([e?.icon, e?.id, e?.code, e?.name, e?.isDeleted]);

  @override
  bool isValidKey(Object? o) => o is ShapesRecord;
}
