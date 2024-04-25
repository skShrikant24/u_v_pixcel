// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThicknessAndPriceListStruct extends FFFirebaseStruct {
  ThicknessAndPriceListStruct({
    String? id,
    double? sellingPrice,
    double? mrpPrice,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _sellingPrice = sellingPrice,
        _mrpPrice = mrpPrice,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "sellingPrice" field.
  double? _sellingPrice;
  double get sellingPrice => _sellingPrice ?? 0.0;
  set sellingPrice(double? val) => _sellingPrice = val;
  void incrementSellingPrice(double amount) =>
      _sellingPrice = sellingPrice + amount;
  bool hasSellingPrice() => _sellingPrice != null;

  // "mrpPrice" field.
  double? _mrpPrice;
  double get mrpPrice => _mrpPrice ?? 0.0;
  set mrpPrice(double? val) => _mrpPrice = val;
  void incrementMrpPrice(double amount) => _mrpPrice = mrpPrice + amount;
  bool hasMrpPrice() => _mrpPrice != null;

  static ThicknessAndPriceListStruct fromMap(Map<String, dynamic> data) =>
      ThicknessAndPriceListStruct(
        id: data['id'] as String?,
        sellingPrice: castToType<double>(data['sellingPrice']),
        mrpPrice: castToType<double>(data['mrpPrice']),
      );

  static ThicknessAndPriceListStruct? maybeFromMap(dynamic data) => data is Map
      ? ThicknessAndPriceListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'sellingPrice': _sellingPrice,
        'mrpPrice': _mrpPrice,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'sellingPrice': serializeParam(
          _sellingPrice,
          ParamType.double,
        ),
        'mrpPrice': serializeParam(
          _mrpPrice,
          ParamType.double,
        ),
      }.withoutNulls;

  static ThicknessAndPriceListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ThicknessAndPriceListStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        sellingPrice: deserializeParam(
          data['sellingPrice'],
          ParamType.double,
          false,
        ),
        mrpPrice: deserializeParam(
          data['mrpPrice'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ThicknessAndPriceListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ThicknessAndPriceListStruct &&
        id == other.id &&
        sellingPrice == other.sellingPrice &&
        mrpPrice == other.mrpPrice;
  }

  @override
  int get hashCode => const ListEquality().hash([id, sellingPrice, mrpPrice]);
}

ThicknessAndPriceListStruct createThicknessAndPriceListStruct({
  String? id,
  double? sellingPrice,
  double? mrpPrice,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ThicknessAndPriceListStruct(
      id: id,
      sellingPrice: sellingPrice,
      mrpPrice: mrpPrice,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ThicknessAndPriceListStruct? updateThicknessAndPriceListStruct(
  ThicknessAndPriceListStruct? thicknessAndPriceList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    thicknessAndPriceList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addThicknessAndPriceListStructData(
  Map<String, dynamic> firestoreData,
  ThicknessAndPriceListStruct? thicknessAndPriceList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (thicknessAndPriceList == null) {
    return;
  }
  if (thicknessAndPriceList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      thicknessAndPriceList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final thicknessAndPriceListData = getThicknessAndPriceListFirestoreData(
      thicknessAndPriceList, forFieldValue);
  final nestedData =
      thicknessAndPriceListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      thicknessAndPriceList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getThicknessAndPriceListFirestoreData(
  ThicknessAndPriceListStruct? thicknessAndPriceList, [
  bool forFieldValue = false,
]) {
  if (thicknessAndPriceList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(thicknessAndPriceList.toMap());

  // Add any Firestore field values
  thicknessAndPriceList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getThicknessAndPriceListListFirestoreData(
  List<ThicknessAndPriceListStruct>? thicknessAndPriceLists,
) =>
    thicknessAndPriceLists
        ?.map((e) => getThicknessAndPriceListFirestoreData(e, true))
        .toList() ??
    [];
