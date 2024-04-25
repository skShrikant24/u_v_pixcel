// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersStruct extends FFFirebaseStruct {
  OrdersStruct({
    String? imageurl,
    String? textString,
    String? shapes,
    String? size,
    String? thickness,
    double? price,
    double? qty,
    double? total,
    double? finalAmt,
    DocumentReference? userRef,
    String? categoryName,
    List<String>? collageimages,
    int? count,
    String? originalimage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _imageurl = imageurl,
        _textString = textString,
        _shapes = shapes,
        _size = size,
        _thickness = thickness,
        _price = price,
        _qty = qty,
        _total = total,
        _finalAmt = finalAmt,
        _userRef = userRef,
        _categoryName = categoryName,
        _collageimages = collageimages,
        _count = count,
        _originalimage = originalimage,
        super(firestoreUtilData);

  // "imageurl" field.
  String? _imageurl;
  String get imageurl => _imageurl ?? '';
  set imageurl(String? val) => _imageurl = val;
  bool hasImageurl() => _imageurl != null;

  // "textString" field.
  String? _textString;
  String get textString => _textString ?? '';
  set textString(String? val) => _textString = val;
  bool hasTextString() => _textString != null;

  // "shapes" field.
  String? _shapes;
  String get shapes => _shapes ?? '';
  set shapes(String? val) => _shapes = val;
  bool hasShapes() => _shapes != null;

  // "size" field.
  String? _size;
  String get size => _size ?? '';
  set size(String? val) => _size = val;
  bool hasSize() => _size != null;

  // "thickness" field.
  String? _thickness;
  String get thickness => _thickness ?? '';
  set thickness(String? val) => _thickness = val;
  bool hasThickness() => _thickness != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "qty" field.
  double? _qty;
  double get qty => _qty ?? 1.0;
  set qty(double? val) => _qty = val;
  void incrementQty(double amount) => _qty = qty + amount;
  bool hasQty() => _qty != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;
  void incrementTotal(double amount) => _total = total + amount;
  bool hasTotal() => _total != null;

  // "finalAmt" field.
  double? _finalAmt;
  double get finalAmt => _finalAmt ?? 0.0;
  set finalAmt(double? val) => _finalAmt = val;
  void incrementFinalAmt(double amount) => _finalAmt = finalAmt + amount;
  bool hasFinalAmt() => _finalAmt != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;
  bool hasUserRef() => _userRef != null;

  // "categoryName" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  set categoryName(String? val) => _categoryName = val;
  bool hasCategoryName() => _categoryName != null;

  // "collageimages" field.
  List<String>? _collageimages;
  List<String> get collageimages => _collageimages ?? const [];
  set collageimages(List<String>? val) => _collageimages = val;
  void updateCollageimages(Function(List<String>) updateFn) =>
      updateFn(_collageimages ??= []);
  bool hasCollageimages() => _collageimages != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 1;
  set count(int? val) => _count = val;
  void incrementCount(int amount) => _count = count + amount;
  bool hasCount() => _count != null;

  // "originalimage" field.
  String? _originalimage;
  String get originalimage => _originalimage ?? '';
  set originalimage(String? val) => _originalimage = val;
  bool hasOriginalimage() => _originalimage != null;

  static OrdersStruct fromMap(Map<String, dynamic> data) => OrdersStruct(
        imageurl: data['imageurl'] as String?,
        textString: data['textString'] as String?,
        shapes: data['shapes'] as String?,
        size: data['size'] as String?,
        thickness: data['thickness'] as String?,
        price: castToType<double>(data['price']),
        qty: castToType<double>(data['qty']),
        total: castToType<double>(data['total']),
        finalAmt: castToType<double>(data['finalAmt']),
        userRef: data['userRef'] as DocumentReference?,
        categoryName: data['categoryName'] as String?,
        collageimages: getDataList(data['collageimages']),
        count: castToType<int>(data['count']),
        originalimage: data['originalimage'] as String?,
      );

  static OrdersStruct? maybeFromMap(dynamic data) =>
      data is Map ? OrdersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'imageurl': _imageurl,
        'textString': _textString,
        'shapes': _shapes,
        'size': _size,
        'thickness': _thickness,
        'price': _price,
        'qty': _qty,
        'total': _total,
        'finalAmt': _finalAmt,
        'userRef': _userRef,
        'categoryName': _categoryName,
        'collageimages': _collageimages,
        'count': _count,
        'originalimage': _originalimage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'imageurl': serializeParam(
          _imageurl,
          ParamType.String,
        ),
        'textString': serializeParam(
          _textString,
          ParamType.String,
        ),
        'shapes': serializeParam(
          _shapes,
          ParamType.String,
        ),
        'size': serializeParam(
          _size,
          ParamType.String,
        ),
        'thickness': serializeParam(
          _thickness,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'qty': serializeParam(
          _qty,
          ParamType.double,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'finalAmt': serializeParam(
          _finalAmt,
          ParamType.double,
        ),
        'userRef': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
        'categoryName': serializeParam(
          _categoryName,
          ParamType.String,
        ),
        'collageimages': serializeParam(
          _collageimages,
          ParamType.String,
          true,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
        'originalimage': serializeParam(
          _originalimage,
          ParamType.String,
        ),
      }.withoutNulls;

  static OrdersStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrdersStruct(
        imageurl: deserializeParam(
          data['imageurl'],
          ParamType.String,
          false,
        ),
        textString: deserializeParam(
          data['textString'],
          ParamType.String,
          false,
        ),
        shapes: deserializeParam(
          data['shapes'],
          ParamType.String,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.String,
          false,
        ),
        thickness: deserializeParam(
          data['thickness'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        qty: deserializeParam(
          data['qty'],
          ParamType.double,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        finalAmt: deserializeParam(
          data['finalAmt'],
          ParamType.double,
          false,
        ),
        userRef: deserializeParam(
          data['userRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['USER_PROFILE'],
        ),
        categoryName: deserializeParam(
          data['categoryName'],
          ParamType.String,
          false,
        ),
        collageimages: deserializeParam<String>(
          data['collageimages'],
          ParamType.String,
          true,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
        originalimage: deserializeParam(
          data['originalimage'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OrdersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OrdersStruct &&
        imageurl == other.imageurl &&
        textString == other.textString &&
        shapes == other.shapes &&
        size == other.size &&
        thickness == other.thickness &&
        price == other.price &&
        qty == other.qty &&
        total == other.total &&
        finalAmt == other.finalAmt &&
        userRef == other.userRef &&
        categoryName == other.categoryName &&
        listEquality.equals(collageimages, other.collageimages) &&
        count == other.count &&
        originalimage == other.originalimage;
  }

  @override
  int get hashCode => const ListEquality().hash([
        imageurl,
        textString,
        shapes,
        size,
        thickness,
        price,
        qty,
        total,
        finalAmt,
        userRef,
        categoryName,
        collageimages,
        count,
        originalimage
      ]);
}

OrdersStruct createOrdersStruct({
  String? imageurl,
  String? textString,
  String? shapes,
  String? size,
  String? thickness,
  double? price,
  double? qty,
  double? total,
  double? finalAmt,
  DocumentReference? userRef,
  String? categoryName,
  int? count,
  String? originalimage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrdersStruct(
      imageurl: imageurl,
      textString: textString,
      shapes: shapes,
      size: size,
      thickness: thickness,
      price: price,
      qty: qty,
      total: total,
      finalAmt: finalAmt,
      userRef: userRef,
      categoryName: categoryName,
      count: count,
      originalimage: originalimage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrdersStruct? updateOrdersStruct(
  OrdersStruct? orders, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    orders
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrdersStructData(
  Map<String, dynamic> firestoreData,
  OrdersStruct? orders,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orders == null) {
    return;
  }
  if (orders.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && orders.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ordersData = getOrdersFirestoreData(orders, forFieldValue);
  final nestedData = ordersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = orders.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrdersFirestoreData(
  OrdersStruct? orders, [
  bool forFieldValue = false,
]) {
  if (orders == null) {
    return {};
  }
  final firestoreData = mapToFirestore(orders.toMap());

  // Add any Firestore field values
  orders.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrdersListFirestoreData(
  List<OrdersStruct>? orderss,
) =>
    orderss?.map((e) => getOrdersFirestoreData(e, true)).toList() ?? [];
