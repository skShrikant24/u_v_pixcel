import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/user_page/drawer/drawer_widget.dart';
import '/user_page/header/header_widget.dart';
import 'checkout_details_widget.dart' show CheckoutDetailsWidget;
import 'package:flutter/material.dart';

class CheckoutDetailsModel extends FlutterFlowModel<CheckoutDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OrdersRecord? orderid;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrdersRecord? docOrderw;
  // Stores action output result for [Backend Call - API (payAPI)] action in Button widget.
  ApiCallResponse? apiResultnbp;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode10;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode11;
  TextEditingController? textController11;
  String? Function(BuildContext, String?)? textController11Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode12;
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode13;
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode14;
  TextEditingController? textController14;
  String? Function(BuildContext, String?)? textController14Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode15;
  TextEditingController? textController15;
  String? Function(BuildContext, String?)? textController15Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode16;
  TextEditingController? textController16;
  String? Function(BuildContext, String?)? textController16Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OrdersRecord? orderid2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrdersRecord? docOrder;
  // Stores action output result for [Backend Call - API (payAPI)] action in Button widget.
  ApiCallResponse? apiResultnbp2;
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
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();

    textFieldFocusNode7?.dispose();
    textController7?.dispose();

    textFieldFocusNode8?.dispose();
    textController8?.dispose();

    textFieldFocusNode9?.dispose();
    textController9?.dispose();

    textFieldFocusNode10?.dispose();
    textController10?.dispose();

    textFieldFocusNode11?.dispose();
    textController11?.dispose();

    textFieldFocusNode12?.dispose();
    textController12?.dispose();

    textFieldFocusNode13?.dispose();
    textController13?.dispose();

    textFieldFocusNode14?.dispose();
    textController14?.dispose();

    textFieldFocusNode15?.dispose();
    textController15?.dispose();

    textFieldFocusNode16?.dispose();
    textController16?.dispose();

    headerModel.dispose();
    drawerModel.dispose();
  }
}
