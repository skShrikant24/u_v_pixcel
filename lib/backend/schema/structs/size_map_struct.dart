// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SizeMapStruct extends FFFirebaseStruct {
  SizeMapStruct({
    String? sizeId,
    List<ThicknessAndPriceListStruct>? thickness,
    List<String>? shapes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sizeId = sizeId,
        _thickness = thickness,
        _shapes = shapes,
        super(firestoreUtilData);

  // "sizeId" field.
  String? _sizeId;
  String get sizeId => _sizeId ?? '';
  set sizeId(String? val) => _sizeId = val;
  bool hasSizeId() => _sizeId != null;

  // "thickness" field.
  List<ThicknessAndPriceListStruct>? _thickness;
  List<ThicknessAndPriceListStruct> get thickness => _thickness ?? const [];
  set thickness(List<ThicknessAndPriceListStruct>? val) => _thickness = val;
  void updateThickness(Function(List<ThicknessAndPriceListStruct>) updateFn) =>
      updateFn(_thickness ??= []);
  bool hasThickness() => _thickness != null;

  // "shapes" field.
  List<String>? _shapes;
  List<String> get shapes => _shapes ?? const [];
  set shapes(List<String>? val) => _shapes = val;
  void updateShapes(Function(List<String>) updateFn) =>
      updateFn(_shapes ??= []);
  bool hasShapes() => _shapes != null;

  static SizeMapStruct fromMap(Map<String, dynamic> data) => SizeMapStruct(
        sizeId: data['sizeId'] as String?,
        thickness: getStructList(
          data['thickness'],
          ThicknessAndPriceListStruct.fromMap,
        ),
        shapes: getDataList(data['shapes']),
      );

  static SizeMapStruct? maybeFromMap(dynamic data) =>
      data is Map ? SizeMapStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'sizeId': _sizeId,
        'thickness': _thickness?.map((e) => e.toMap()).toList(),
        'shapes': _shapes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sizeId': serializeParam(
          _sizeId,
          ParamType.String,
        ),
        'thickness': serializeParam(
          _thickness,
          ParamType.DataStruct,
          true,
        ),
        'shapes': serializeParam(
          _shapes,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static SizeMapStruct fromSerializableMap(Map<String, dynamic> data) =>
      SizeMapStruct(
        sizeId: deserializeParam(
          data['sizeId'],
          ParamType.String,
          false,
        ),
        thickness: deserializeStructParam<ThicknessAndPriceListStruct>(
          data['thickness'],
          ParamType.DataStruct,
          true,
          structBuilder: ThicknessAndPriceListStruct.fromSerializableMap,
        ),
        shapes: deserializeParam<String>(
          data['shapes'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'SizeMapStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SizeMapStruct &&
        sizeId == other.sizeId &&
        listEquality.equals(thickness, other.thickness) &&
        listEquality.equals(shapes, other.shapes);
  }

  @override
  int get hashCode => const ListEquality().hash([sizeId, thickness, shapes]);
}

SizeMapStruct createSizeMapStruct({
  String? sizeId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SizeMapStruct(
      sizeId: sizeId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SizeMapStruct? updateSizeMapStruct(
  SizeMapStruct? sizeMap, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sizeMap
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSizeMapStructData(
  Map<String, dynamic> firestoreData,
  SizeMapStruct? sizeMap,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sizeMap == null) {
    return;
  }
  if (sizeMap.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && sizeMap.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sizeMapData = getSizeMapFirestoreData(sizeMap, forFieldValue);
  final nestedData = sizeMapData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = sizeMap.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSizeMapFirestoreData(
  SizeMapStruct? sizeMap, [
  bool forFieldValue = false,
]) {
  if (sizeMap == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sizeMap.toMap());

  // Add any Firestore field values
  sizeMap.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSizeMapListFirestoreData(
  List<SizeMapStruct>? sizeMaps,
) =>
    sizeMaps?.map((e) => getSizeMapFirestoreData(e, true)).toList() ?? [];
