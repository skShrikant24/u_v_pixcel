import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "orderList" field.
  List<OrdersStruct>? _orderList;
  List<OrdersStruct> get orderList => _orderList ?? const [];
  bool hasOrderList() => _orderList != null;

  // "finalAmt" field.
  double? _finalAmt;
  double get finalAmt => _finalAmt ?? 0.0;
  bool hasFinalAmt() => _finalAmt != null;

  // "deliveryCharges" field.
  double? _deliveryCharges;
  double get deliveryCharges => _deliveryCharges ?? 0.0;
  bool hasDeliveryCharges() => _deliveryCharges != null;

  // "subTotal" field.
  double? _subTotal;
  double get subTotal => _subTotal ?? 0.0;
  bool hasSubTotal() => _subTotal != null;

  // "userdetails" field.
  UserOrderdetailsStruct? _userdetails;
  UserOrderdetailsStruct get userdetails =>
      _userdetails ?? UserOrderdetailsStruct();
  bool hasUserdetails() => _userdetails != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "orderAt" field.
  int? _orderAt;
  int get orderAt => _orderAt ?? 0;
  bool hasOrderAt() => _orderAt != null;

  // "transactionId" field.
  String? _transactionId;
  String get transactionId => _transactionId ?? '';
  bool hasTransactionId() => _transactionId != null;

  // "paymentStatus" field.
  bool? _paymentStatus;
  bool get paymentStatus => _paymentStatus ?? false;
  bool hasPaymentStatus() => _paymentStatus != null;

  // "orderId" field.
  int? _orderId;
  int get orderId => _orderId ?? 0;
  bool hasOrderId() => _orderId != null;

  // "orderDate" field.
  String? _orderDate;
  String get orderDate => _orderDate ?? '';
  bool hasOrderDate() => _orderDate != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _orderList = getStructList(
      snapshotData['orderList'],
      OrdersStruct.fromMap,
    );
    _finalAmt = castToType<double>(snapshotData['finalAmt']);
    _deliveryCharges = castToType<double>(snapshotData['deliveryCharges']);
    _subTotal = castToType<double>(snapshotData['subTotal']);
    _userdetails =
        UserOrderdetailsStruct.maybeFromMap(snapshotData['userdetails']);
    _status = snapshotData['status'] as String?;
    _orderAt = castToType<int>(snapshotData['orderAt']);
    _transactionId = snapshotData['transactionId'] as String?;
    _paymentStatus = snapshotData['paymentStatus'] as bool?;
    _orderId = castToType<int>(snapshotData['orderId']);
    _orderDate = snapshotData['orderDate'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ORDERS');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? id,
  double? finalAmt,
  double? deliveryCharges,
  double? subTotal,
  UserOrderdetailsStruct? userdetails,
  String? status,
  int? orderAt,
  String? transactionId,
  bool? paymentStatus,
  int? orderId,
  String? orderDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'finalAmt': finalAmt,
      'deliveryCharges': deliveryCharges,
      'subTotal': subTotal,
      'userdetails': UserOrderdetailsStruct().toMap(),
      'status': status,
      'orderAt': orderAt,
      'transactionId': transactionId,
      'paymentStatus': paymentStatus,
      'orderId': orderId,
      'orderDate': orderDate,
    }.withoutNulls,
  );

  // Handle nested data for "userdetails" field.
  addUserOrderdetailsStructData(firestoreData, userdetails, 'userdetails');

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        listEquality.equals(e1?.orderList, e2?.orderList) &&
        e1?.finalAmt == e2?.finalAmt &&
        e1?.deliveryCharges == e2?.deliveryCharges &&
        e1?.subTotal == e2?.subTotal &&
        e1?.userdetails == e2?.userdetails &&
        e1?.status == e2?.status &&
        e1?.orderAt == e2?.orderAt &&
        e1?.transactionId == e2?.transactionId &&
        e1?.paymentStatus == e2?.paymentStatus &&
        e1?.orderId == e2?.orderId &&
        e1?.orderDate == e2?.orderDate;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.id,
        e?.orderList,
        e?.finalAmt,
        e?.deliveryCharges,
        e?.subTotal,
        e?.userdetails,
        e?.status,
        e?.orderAt,
        e?.transactionId,
        e?.paymentStatus,
        e?.orderId,
        e?.orderDate
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
