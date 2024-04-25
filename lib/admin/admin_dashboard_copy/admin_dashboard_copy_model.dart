import '/flutter_flow/flutter_flow_util.dart';
import '/user_page/drawer/drawer_widget.dart';
import '/user_page/header/header_widget.dart';
import 'admin_dashboard_copy_widget.dart' show AdminDashboardCopyWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class AdminDashboardCopyModel
    extends FlutterFlowModel<AdminDashboardCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // Stores action output result for [Custom Action - genarateThicknessCode] action in Button widget.
  int? thicknesslen;
  // Stores action output result for [Custom Action - genarateCatCode] action in Button widget.
  int? catCodeLen;
  // Stores action output result for [Custom Action - genarateShapeCode] action in Button widget.
  int? shapeLen;
  // Stores action output result for [Custom Action - genarateSizeCode] action in Button widget.
  int? codeLen;
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
    expandableExpandableController.dispose();
    headerModel.dispose();
    drawerModel.dispose();
  }
}
