import '/flutter_flow/flutter_flow_util.dart';
import '/user_page/drawer/drawer_widget.dart';
import '/user_page/header/header_widget.dart';
import 'shipping_policy_widget.dart' show ShippingPolicyWidget;
import 'package:flutter/material.dart';

class ShippingPolicyModel extends FlutterFlowModel<ShippingPolicyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
