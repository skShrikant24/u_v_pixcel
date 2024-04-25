import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CatalogueRecord extends FirestoreRecord {
  CatalogueRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

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

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "mrp" field.
  double? _mrp;
  double get mrp => _mrp ?? 0.0;
  bool hasMrp() => _mrp != null;

  // "size" field.
  String? _size;
  String get size => _size ?? '';
  bool hasSize() => _size != null;

  // "thickness" field.
  String? _thickness;
  String get thickness => _thickness ?? '';
  bool hasThickness() => _thickness != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _id = snapshotData['id'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _imageUrl = snapshotData['image_url'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _mrp = castToType<double>(snapshotData['mrp']);
    _size = snapshotData['size'] as String?;
    _thickness = snapshotData['thickness'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CATALOGUE');

  static Stream<CatalogueRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CatalogueRecord.fromSnapshot(s));

  static Future<CatalogueRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CatalogueRecord.fromSnapshot(s));

  static CatalogueRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CatalogueRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CatalogueRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CatalogueRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CatalogueRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CatalogueRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCatalogueRecordData({
  String? title,
  String? id,
  int? code,
  String? imageUrl,
  double? price,
  double? mrp,
  String? size,
  String? thickness,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'id': id,
      'code': code,
      'image_url': imageUrl,
      'price': price,
      'mrp': mrp,
      'size': size,
      'thickness': thickness,
    }.withoutNulls,
  );

  return firestoreData;
}

class CatalogueRecordDocumentEquality implements Equality<CatalogueRecord> {
  const CatalogueRecordDocumentEquality();

  @override
  bool equals(CatalogueRecord? e1, CatalogueRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.id == e2?.id &&
        e1?.code == e2?.code &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.price == e2?.price &&
        e1?.mrp == e2?.mrp &&
        e1?.size == e2?.size &&
        e1?.thickness == e2?.thickness;
  }

  @override
  int hash(CatalogueRecord? e) => const ListEquality().hash([
        e?.title,
        e?.id,
        e?.code,
        e?.imageUrl,
        e?.price,
        e?.mrp,
        e?.size,
        e?.thickness
      ]);

  @override
  bool isValidKey(Object? o) => o is CatalogueRecord;
}
