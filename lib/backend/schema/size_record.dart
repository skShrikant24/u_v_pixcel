import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SizeRecord extends FirestoreRecord {
  SizeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "width" field.
  double? _width;
  double get width => _width ?? 0.0;
  bool hasWidth() => _width != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  bool hasHeight() => _height != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  void _initializeFields() {
    _width = castToType<double>(snapshotData['width']);
    _height = castToType<double>(snapshotData['height']);
    _title = snapshotData['title'] as String?;
    _id = snapshotData['id'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _isDeleted = snapshotData['isDeleted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SIZE');

  static Stream<SizeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SizeRecord.fromSnapshot(s));

  static Future<SizeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SizeRecord.fromSnapshot(s));

  static SizeRecord fromSnapshot(DocumentSnapshot snapshot) => SizeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SizeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SizeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SizeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SizeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSizeRecordData({
  double? width,
  double? height,
  String? title,
  String? id,
  int? code,
  bool? isDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'width': width,
      'height': height,
      'title': title,
      'id': id,
      'code': code,
      'isDeleted': isDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class SizeRecordDocumentEquality implements Equality<SizeRecord> {
  const SizeRecordDocumentEquality();

  @override
  bool equals(SizeRecord? e1, SizeRecord? e2) {
    return e1?.width == e2?.width &&
        e1?.height == e2?.height &&
        e1?.title == e2?.title &&
        e1?.id == e2?.id &&
        e1?.code == e2?.code &&
        e1?.isDeleted == e2?.isDeleted;
  }

  @override
  int hash(SizeRecord? e) => const ListEquality()
      .hash([e?.width, e?.height, e?.title, e?.id, e?.code, e?.isDeleted]);

  @override
  bool isValidKey(Object? o) => o is SizeRecord;
}
