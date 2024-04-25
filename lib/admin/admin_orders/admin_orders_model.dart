import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_page/drawer/drawer_widget.dart';
import '/user_page/header/header_widget.dart';
import 'admin_orders_widget.dart' show AdminOrdersWidget;
import 'package:flutter/material.dart';

class AdminOrdersModel extends FlutterFlowModel<AdminOrdersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in AdminOrders widget.
  List<OrdersRecord>? listOfOrdersAdmin;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  OrdersRecord? statusupdate;
  // Stores action output result for [Custom Action - generateInvoice] action in Button widget.
  String? returnurl2;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    drawerModel.dispose();
  }
}
