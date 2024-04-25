import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _orderList = prefs
              .getStringList('ff_orderList')
              ?.map((x) {
                try {
                  return OrdersStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _orderList;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_orders')) {
        try {
          final serializedData = prefs.getString('ff_orders') ?? '{}';
          _orders =
              OrdersStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _price = prefs.getDouble('ff_price') ?? _price;
    });
    _safeInit(() {
      _FinalAmt = prefs.getDouble('ff_FinalAmt') ?? _FinalAmt;
    });
    _safeInit(() {
      _deliveryCharges =
          prefs.getDouble('ff_deliveryCharges') ?? _deliveryCharges;
    });
    _safeInit(() {
      _loggedin = prefs.getBool('ff_loggedin') ?? _loggedin;
    });
    _safeInit(() {
      _count = prefs.getInt('ff_count') ?? _count;
    });
    _safeInit(() {
      _merchantTransactionId =
          prefs.getString('ff_merchantTransactionId') ?? _merchantTransactionId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _flag = 1;
  int get flag => _flag;
  set flag(int value) {
    _flag = value;
  }

  String _img = 'https://picsum.photos/seed/895/600';
  String get img => _img;
  set img(String value) {
    _img = value;
  }

  String _Shape = '';
  String get Shape => _Shape;
  set Shape(String value) {
    _Shape = value;
  }

  String _imageUrl =
      'https://firebasestorage.googleapis.com/v0/b/uvpixcel.appspot.com/o/importantImages%2FMAIN%20IMAGE%20new.jpg?alt=media&token=cdcd026f-349a-4d22-bc17-7e4d3730b5a2';
  String get imageUrl => _imageUrl;
  set imageUrl(String value) {
    _imageUrl = value;
  }

  double _zoomPer = 1.15;
  double get zoomPer => _zoomPer;
  set zoomPer(double value) {
    _zoomPer = value;
  }

  String _size = '12 X 9';
  String get size => _size;
  set size(String value) {
    _size = value;
  }

  String _thickness = '3 mm';
  String get thickness => _thickness;
  set thickness(String value) {
    _thickness = value;
  }

  String _textString = '';
  String get textString => _textString;
  set textString(String value) {
    _textString = value;
  }

  List<OrdersStruct> _orderList = [];
  List<OrdersStruct> get orderList => _orderList;
  set orderList(List<OrdersStruct> value) {
    _orderList = value;
    prefs.setStringList(
        'ff_orderList', value.map((x) => x.serialize()).toList());
  }

  void addToOrderList(OrdersStruct value) {
    _orderList.add(value);
    prefs.setStringList(
        'ff_orderList', _orderList.map((x) => x.serialize()).toList());
  }

  void removeFromOrderList(OrdersStruct value) {
    _orderList.remove(value);
    prefs.setStringList(
        'ff_orderList', _orderList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromOrderList(int index) {
    _orderList.removeAt(index);
    prefs.setStringList(
        'ff_orderList', _orderList.map((x) => x.serialize()).toList());
  }

  void updateOrderListAtIndex(
    int index,
    OrdersStruct Function(OrdersStruct) updateFn,
  ) {
    _orderList[index] = updateFn(_orderList[index]);
    prefs.setStringList(
        'ff_orderList', _orderList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInOrderList(int index, OrdersStruct value) {
    _orderList.insert(index, value);
    prefs.setStringList(
        'ff_orderList', _orderList.map((x) => x.serialize()).toList());
  }

  OrdersStruct _orders = OrdersStruct();
  OrdersStruct get orders => _orders;
  set orders(OrdersStruct value) {
    _orders = value;
    prefs.setString('ff_orders', value.serialize());
  }

  void updateOrdersStruct(Function(OrdersStruct) updateFn) {
    updateFn(_orders);
    prefs.setString('ff_orders', _orders.serialize());
  }

  double _price = 599.0;
  double get price => _price;
  set price(double value) {
    _price = value;
    prefs.setDouble('ff_price', value);
  }

  double _FinalAmt = 0.0;
  double get FinalAmt => _FinalAmt;
  set FinalAmt(double value) {
    _FinalAmt = value;
    prefs.setDouble('ff_FinalAmt', value);
  }

  double _deliveryCharges = 100.0;
  double get deliveryCharges => _deliveryCharges;
  set deliveryCharges(double value) {
    _deliveryCharges = value;
    prefs.setDouble('ff_deliveryCharges', value);
  }

  bool _loggedin = false;
  bool get loggedin => _loggedin;
  set loggedin(bool value) {
    _loggedin = value;
    prefs.setBool('ff_loggedin', value);
  }

  double _productPrice = 599.0;
  double get productPrice => _productPrice;
  set productPrice(double value) {
    _productPrice = value;
  }

  double _productMRPPrice = 899.0;
  double get productMRPPrice => _productMRPPrice;
  set productMRPPrice(double value) {
    _productMRPPrice = value;
  }

  int _startLopp = 0;
  int get startLopp => _startLopp;
  set startLopp(int value) {
    _startLopp = value;
  }

  int _endLoop = 0;
  int get endLoop => _endLoop;
  set endLoop(int value) {
    _endLoop = value;
  }

  bool _sizeHide = false;
  bool get sizeHide => _sizeHide;
  set sizeHide(bool value) {
    _sizeHide = value;
  }

  bool _thicknessHide = false;
  bool get thicknessHide => _thicknessHide;
  set thicknessHide(bool value) {
    _thicknessHide = value;
  }

  bool _catgoryHide = false;
  bool get catgoryHide => _catgoryHide;
  set catgoryHide(bool value) {
    _catgoryHide = value;
  }

  bool _shapeHide = false;
  bool get shapeHide => _shapeHide;
  set shapeHide(bool value) {
    _shapeHide = value;
  }

  bool _dashboardHide = false;
  bool get dashboardHide => _dashboardHide;
  set dashboardHide(bool value) {
    _dashboardHide = value;
  }

  List<ThicknessAndPriceListStruct> _priceListAndThicknessAppState = [];
  List<ThicknessAndPriceListStruct> get priceListAndThicknessAppState =>
      _priceListAndThicknessAppState;
  set priceListAndThicknessAppState(List<ThicknessAndPriceListStruct> value) {
    _priceListAndThicknessAppState = value;
  }

  void addToPriceListAndThicknessAppState(ThicknessAndPriceListStruct value) {
    _priceListAndThicknessAppState.add(value);
  }

  void removeFromPriceListAndThicknessAppState(
      ThicknessAndPriceListStruct value) {
    _priceListAndThicknessAppState.remove(value);
  }

  void removeAtIndexFromPriceListAndThicknessAppState(int index) {
    _priceListAndThicknessAppState.removeAt(index);
  }

  void updatePriceListAndThicknessAppStateAtIndex(
    int index,
    ThicknessAndPriceListStruct Function(ThicknessAndPriceListStruct) updateFn,
  ) {
    _priceListAndThicknessAppState[index] =
        updateFn(_priceListAndThicknessAppState[index]);
  }

  void insertAtIndexInPriceListAndThicknessAppState(
      int index, ThicknessAndPriceListStruct value) {
    _priceListAndThicknessAppState.insert(index, value);
  }

  List<SizeMapStruct> _sizeDetails = [];
  List<SizeMapStruct> get sizeDetails => _sizeDetails;
  set sizeDetails(List<SizeMapStruct> value) {
    _sizeDetails = value;
  }

  void addToSizeDetails(SizeMapStruct value) {
    _sizeDetails.add(value);
  }

  void removeFromSizeDetails(SizeMapStruct value) {
    _sizeDetails.remove(value);
  }

  void removeAtIndexFromSizeDetails(int index) {
    _sizeDetails.removeAt(index);
  }

  void updateSizeDetailsAtIndex(
    int index,
    SizeMapStruct Function(SizeMapStruct) updateFn,
  ) {
    _sizeDetails[index] = updateFn(_sizeDetails[index]);
  }

  void insertAtIndexInSizeDetails(int index, SizeMapStruct value) {
    _sizeDetails.insert(index, value);
  }

  String _estimatedDeliveryDate = '';
  String get estimatedDeliveryDate => _estimatedDeliveryDate;
  set estimatedDeliveryDate(String value) {
    _estimatedDeliveryDate = value;
  }

  bool _showEstimatedDate = false;
  bool get showEstimatedDate => _showEstimatedDate;
  set showEstimatedDate(bool value) {
    _showEstimatedDate = value;
  }

  bool _showClock = false;
  bool get showClock => _showClock;
  set showClock(bool value) {
    _showClock = value;
  }

  bool _showFrame = false;
  bool get showFrame => _showFrame;
  set showFrame(bool value) {
    _showFrame = value;
  }

  List<String> _imageUrlListForCollage = [];
  List<String> get imageUrlListForCollage => _imageUrlListForCollage;
  set imageUrlListForCollage(List<String> value) {
    _imageUrlListForCollage = value;
  }

  void addToImageUrlListForCollage(String value) {
    _imageUrlListForCollage.add(value);
  }

  void removeFromImageUrlListForCollage(String value) {
    _imageUrlListForCollage.remove(value);
  }

  void removeAtIndexFromImageUrlListForCollage(int index) {
    _imageUrlListForCollage.removeAt(index);
  }

  void updateImageUrlListForCollageAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _imageUrlListForCollage[index] = updateFn(_imageUrlListForCollage[index]);
  }

  void insertAtIndexInImageUrlListForCollage(int index, String value) {
    _imageUrlListForCollage.insert(index, value);
  }

  String _collageImgUrl1 = '';
  String get collageImgUrl1 => _collageImgUrl1;
  set collageImgUrl1(String value) {
    _collageImgUrl1 = value;
  }

  String _collageImgUrl2 = '';
  String get collageImgUrl2 => _collageImgUrl2;
  set collageImgUrl2(String value) {
    _collageImgUrl2 = value;
  }

  String _collageImgUrl3 = '';
  String get collageImgUrl3 => _collageImgUrl3;
  set collageImgUrl3(String value) {
    _collageImgUrl3 = value;
  }

  String _collageImgUrl4 = '';
  String get collageImgUrl4 => _collageImgUrl4;
  set collageImgUrl4(String value) {
    _collageImgUrl4 = value;
  }

  String _tat = '';
  String get tat => _tat;
  set tat(String value) {
    _tat = value;
  }

  List<String> _collagelist = [];
  List<String> get collagelist => _collagelist;
  set collagelist(List<String> value) {
    _collagelist = value;
  }

  void addToCollagelist(String value) {
    _collagelist.add(value);
  }

  void removeFromCollagelist(String value) {
    _collagelist.remove(value);
  }

  void removeAtIndexFromCollagelist(int index) {
    _collagelist.removeAt(index);
  }

  void updateCollagelistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _collagelist[index] = updateFn(_collagelist[index]);
  }

  void insertAtIndexInCollagelist(int index, String value) {
    _collagelist.insert(index, value);
  }

  String _editedimg = '';
  String get editedimg => _editedimg;
  set editedimg(String value) {
    _editedimg = value;
  }

  bool _flagimg = false;
  bool get flagimg => _flagimg;
  set flagimg(bool value) {
    _flagimg = value;
  }

  String _cutoutImagePath = '';
  String get cutoutImagePath => _cutoutImagePath;
  set cutoutImagePath(String value) {
    _cutoutImagePath = value;
  }

  int _count = 1;
  int get count => _count;
  set count(int value) {
    _count = value;
    prefs.setInt('ff_count', value);
  }

  UserOrderdetailsStruct _userOrderDetails = UserOrderdetailsStruct();
  UserOrderdetailsStruct get userOrderDetails => _userOrderDetails;
  set userOrderDetails(UserOrderdetailsStruct value) {
    _userOrderDetails = value;
  }

  void updateUserOrderDetailsStruct(Function(UserOrderdetailsStruct) updateFn) {
    updateFn(_userOrderDetails);
  }

  List<OrdersStruct> _ordersDetails = [];
  List<OrdersStruct> get ordersDetails => _ordersDetails;
  set ordersDetails(List<OrdersStruct> value) {
    _ordersDetails = value;
  }

  void addToOrdersDetails(OrdersStruct value) {
    _ordersDetails.add(value);
  }

  void removeFromOrdersDetails(OrdersStruct value) {
    _ordersDetails.remove(value);
  }

  void removeAtIndexFromOrdersDetails(int index) {
    _ordersDetails.removeAt(index);
  }

  void updateOrdersDetailsAtIndex(
    int index,
    OrdersStruct Function(OrdersStruct) updateFn,
  ) {
    _ordersDetails[index] = updateFn(_ordersDetails[index]);
  }

  void insertAtIndexInOrdersDetails(int index, OrdersStruct value) {
    _ordersDetails.insert(index, value);
  }

  String _carDashboardSide = '';
  String get carDashboardSide => _carDashboardSide;
  set carDashboardSide(String value) {
    _carDashboardSide = value;
  }

  int _collageSize = 0;
  int get collageSize => _collageSize;
  set collageSize(int value) {
    _collageSize = value;
  }

  String _collageImgUrl5 = '';
  String get collageImgUrl5 => _collageImgUrl5;
  set collageImgUrl5(String value) {
    _collageImgUrl5 = value;
  }

  String _collageImgUrl6 = '';
  String get collageImgUrl6 => _collageImgUrl6;
  set collageImgUrl6(String value) {
    _collageImgUrl6 = value;
  }

  String _collageImgUrl7 = '';
  String get collageImgUrl7 => _collageImgUrl7;
  set collageImgUrl7(String value) {
    _collageImgUrl7 = value;
  }

  String _collageImageUrl8 = '';
  String get collageImageUrl8 => _collageImageUrl8;
  set collageImageUrl8(String value) {
    _collageImageUrl8 = value;
  }

  String _collageImageUrl9 = '';
  String get collageImageUrl9 => _collageImageUrl9;
  set collageImageUrl9(String value) {
    _collageImageUrl9 = value;
  }

  double _namePlateTextSize = 12.0;
  double get namePlateTextSize => _namePlateTextSize;
  set namePlateTextSize(double value) {
    _namePlateTextSize = value;
  }

  String _clockdigitsimg = '';
  String get clockdigitsimg => _clockdigitsimg;
  set clockdigitsimg(String value) {
    _clockdigitsimg = value;
  }

  String _merchantTransactionId = '';
  String get merchantTransactionId => _merchantTransactionId;
  set merchantTransactionId(String value) {
    _merchantTransactionId = value;
    prefs.setString('ff_merchantTransactionId', value);
  }

  String _dropdown = '';
  String get dropdown => _dropdown;
  set dropdown(String value) {
    _dropdown = value;
  }

  int _orderId = 0;
  int get orderId => _orderId;
  set orderId(int value) {
    _orderId = value;
  }

  String _filterDate = '';
  String get filterDate => _filterDate;
  set filterDate(String value) {
    _filterDate = value;
  }

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? value) {
    _selectedDate = value;
  }

  bool _showPortrait = false;
  bool get showPortrait => _showPortrait;
  set showPortrait(bool value) {
    _showPortrait = value;
  }

  String _uploadImageOrVideoUrl = '';
  String get uploadImageOrVideoUrl => _uploadImageOrVideoUrl;
  set uploadImageOrVideoUrl(String value) {
    _uploadImageOrVideoUrl = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
