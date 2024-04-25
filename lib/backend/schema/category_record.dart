import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryRecord extends FirestoreRecord {
  CategoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "categoryId" field.
  String? _categoryId;
  String get categoryId => _categoryId ?? '';
  bool hasCategoryId() => _categoryId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "heading" field.
  String? _heading;
  String get heading => _heading ?? '';
  bool hasHeading() => _heading != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "duration" field.
  double? _duration;
  double get duration => _duration ?? 0.0;
  bool hasDuration() => _duration != null;

  // "video1" field.
  String? _video1;
  String get video1 => _video1 ?? '';
  bool hasVideo1() => _video1 != null;

  // "video2" field.
  String? _video2;
  String get video2 => _video2 ?? '';
  bool hasVideo2() => _video2 != null;

  // "image1" field.
  String? _image1;
  String get image1 => _image1 ?? '';
  bool hasImage1() => _image1 != null;

  // "image2" field.
  String? _image2;
  String get image2 => _image2 ?? '';
  bool hasImage2() => _image2 != null;

  // "sizeMap" field.
  List<SizeMapStruct>? _sizeMap;
  List<SizeMapStruct> get sizeMap => _sizeMap ?? const [];
  bool hasSizeMap() => _sizeMap != null;

  // "qty" field.
  String? _qty;
  String get qty => _qty ?? '';
  bool hasQty() => _qty != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  void _initializeFields() {
    _categoryId = snapshotData['categoryId'] as String?;
    _title = snapshotData['title'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _heading = snapshotData['heading'] as String?;
    _description = snapshotData['description'] as String?;
    _duration = castToType<double>(snapshotData['duration']);
    _video1 = snapshotData['video1'] as String?;
    _video2 = snapshotData['video2'] as String?;
    _image1 = snapshotData['image1'] as String?;
    _image2 = snapshotData['image2'] as String?;
    _sizeMap = getStructList(
      snapshotData['sizeMap'],
      SizeMapStruct.fromMap,
    );
    _qty = snapshotData['qty'] as String?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CATEGORY');

  static Stream<CategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryRecord.fromSnapshot(s));

  static Future<CategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryRecord.fromSnapshot(s));

  static CategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryRecordData({
  String? categoryId,
  String? title,
  String? imageUrl,
  int? code,
  String? heading,
  String? description,
  double? duration,
  String? video1,
  String? video2,
  String? image1,
  String? image2,
  String? qty,
  bool? isDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'categoryId': categoryId,
      'title': title,
      'imageUrl': imageUrl,
      'code': code,
      'heading': heading,
      'description': description,
      'duration': duration,
      'video1': video1,
      'video2': video2,
      'image1': image1,
      'image2': image2,
      'qty': qty,
      'isDeleted': isDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryRecordDocumentEquality implements Equality<CategoryRecord> {
  const CategoryRecordDocumentEquality();

  @override
  bool equals(CategoryRecord? e1, CategoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.categoryId == e2?.categoryId &&
        e1?.title == e2?.title &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.code == e2?.code &&
        e1?.heading == e2?.heading &&
        e1?.description == e2?.description &&
        e1?.duration == e2?.duration &&
        e1?.video1 == e2?.video1 &&
        e1?.video2 == e2?.video2 &&
        e1?.image1 == e2?.image1 &&
        e1?.image2 == e2?.image2 &&
        listEquality.equals(e1?.sizeMap, e2?.sizeMap) &&
        e1?.qty == e2?.qty &&
        e1?.isDeleted == e2?.isDeleted;
  }

  @override
  int hash(CategoryRecord? e) => const ListEquality().hash([
        e?.categoryId,
        e?.title,
        e?.imageUrl,
        e?.code,
        e?.heading,
        e?.description,
        e?.duration,
        e?.video1,
        e?.video2,
        e?.image1,
        e?.image2,
        e?.sizeMap,
        e?.qty,
        e?.isDeleted
      ]);

  @override
  bool isValidKey(Object? o) => o is CategoryRecord;
}
