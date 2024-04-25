import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_page/drawer/drawer_widget.dart';
import '/user_page/header/header_widget.dart';
import 'shopping_cartnew_widget.dart' show ShoppingCartnewWidget;
import 'package:flutter/material.dart';

class ShoppingCartnewModel extends FlutterFlowModel<ShoppingCartnewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - returnOrderQtyminuslist] action in IconButton widget.
  List<OrdersStruct>? qtyminus;
  // Stores action output result for [Custom Action - returnOrderQtyPluslist] action in IconButton widget.
  List<OrdersStruct>? returnorderList;
  // Stores action output result for [Custom Action - returnOrderQtyminuslist] action in IconButton widget.
  List<OrdersStruct>? qtyminusCopy;
  // Stores action output result for [Custom Action - returnOrderQtyPluslist] action in IconButton widget.
  List<OrdersStruct>? returnorderListCopy;
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
