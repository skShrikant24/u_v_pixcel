import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'thickness_row_widget.dart' show ThicknessRowWidget;
import 'package:flutter/material.dart';

class ThicknessRowModel extends FlutterFlowModel<ThicknessRowWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for sizeDropdown widget.
  String? sizeDropdownValue;
  FormFieldController<String>? sizeDropdownValueController;
  // State field(s) for priceTextFeild widget.
  FocusNode? priceTextFeildFocusNode1;
  TextEditingController? priceTextFeildTextController1;
  String? Function(BuildContext, String?)?
      priceTextFeildTextController1Validator;
  // State field(s) for priceTextFeild widget.
  FocusNode? priceTextFeildFocusNode2;
  TextEditingController? priceTextFeildTextController2;
  String? Function(BuildContext, String?)?
      priceTextFeildTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    priceTextFeildFocusNode1?.dispose();
    priceTextFeildTextController1?.dispose();

    priceTextFeildFocusNode2?.dispose();
    priceTextFeildTextController2?.dispose();
  }
}
