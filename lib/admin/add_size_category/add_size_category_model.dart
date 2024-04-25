import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_size_category_widget.dart' show AddSizeCategoryWidget;
import 'package:flutter/material.dart';

class AddSizeCategoryModel extends FlutterFlowModel<AddSizeCategoryWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // State field(s) for sizeDropdown widget.
  String? sizeDropdownValue;
  FormFieldController<String>? sizeDropdownValueController;
  // State field(s) for mrpTextFeild widget.
  FocusNode? mrpTextFeildFocusNode;
  TextEditingController? mrpTextFeildTextController;
  String? Function(BuildContext, String?)? mrpTextFeildTextControllerValidator;
  // State field(s) for priceTextFeild widget.
  FocusNode? priceTextFeildFocusNode;
  TextEditingController? priceTextFeildTextController;
  String? Function(BuildContext, String?)?
      priceTextFeildTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    mrpTextFeildFocusNode?.dispose();
    mrpTextFeildTextController?.dispose();

    priceTextFeildFocusNode?.dispose();
    priceTextFeildTextController?.dispose();
  }
}
