import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_page/drawer/drawer_widget.dart';
import '/user_page/footer_mobile/footer_mobile_widget.dart';
import '/user_page/footer_web/footer_web_widget.dart';
import '/user_page/header/header_widget.dart';
import 'gallerycollage_widget.dart' show GallerycollageWidget;
import 'package:flutter/material.dart';

class GallerycollageModel extends FlutterFlowModel<GallerycollageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  CategoryRecord? categorydoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  CategoryRecord? categorydoc2;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  CategoryRecord? categorydoc3;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  CategoryRecord? categorydoc4;
  // Model for FooterWeb component.
  late FooterWebModel footerWebModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  CategoryRecord? categorydoc1;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  CategoryRecord? categorydoc21;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  CategoryRecord? categorydoc31;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  CategoryRecord? categorydoc41;
  // Model for FooterMobile component.
  late FooterMobileModel footerMobileModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    footerWebModel = createModel(context, () => FooterWebModel());
    footerMobileModel = createModel(context, () => FooterMobileModel());
    headerModel = createModel(context, () => HeaderModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    footerWebModel.dispose();
    footerMobileModel.dispose();
    headerModel.dispose();
    drawerModel.dispose();
  }
}
