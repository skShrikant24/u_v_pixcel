import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_category_widget.dart' show UpdateCategoryWidget;
import 'package:flutter/material.dart';

class UpdateCategoryModel extends FlutterFlowModel<UpdateCategoryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for productDropdown widget.
  String? productDropdownValue;
  FormFieldController<String>? productDropdownValueController;
  // State field(s) for TextCatalogueCode widget.
  FocusNode? textCatalogueCodeFocusNode;
  TextEditingController? textCatalogueCodeTextController;
  String? Function(BuildContext, String?)?
      textCatalogueCodeTextControllerValidator;
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
  // State field(s) for mrpTextFeild widget.
  FocusNode? mrpTextFeildFocusNode1;
  TextEditingController? mrpTextFeildTextController1;
  String? Function(BuildContext, String?)? mrpTextFeildTextController1Validator;
  // State field(s) for priceTextFeild widget.
  FocusNode? priceTextFeildFocusNode3;
  TextEditingController? priceTextFeildTextController3;
  String? Function(BuildContext, String?)?
      priceTextFeildTextController3Validator;
  // State field(s) for mrpTextFeild widget.
  FocusNode? mrpTextFeildFocusNode2;
  TextEditingController? mrpTextFeildTextController2;
  String? Function(BuildContext, String?)? mrpTextFeildTextController2Validator;
  // State field(s) for priceTextFeild widget.
  FocusNode? priceTextFeildFocusNode4;
  TextEditingController? priceTextFeildTextController4;
  String? Function(BuildContext, String?)?
      priceTextFeildTextController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textCatalogueCodeFocusNode?.dispose();
    textCatalogueCodeTextController?.dispose();

    priceTextFeildFocusNode1?.dispose();
    priceTextFeildTextController1?.dispose();

    priceTextFeildFocusNode2?.dispose();
    priceTextFeildTextController2?.dispose();

    mrpTextFeildFocusNode1?.dispose();
    mrpTextFeildTextController1?.dispose();

    priceTextFeildFocusNode3?.dispose();
    priceTextFeildTextController3?.dispose();

    mrpTextFeildFocusNode2?.dispose();
    mrpTextFeildTextController2?.dispose();

    priceTextFeildFocusNode4?.dispose();
    priceTextFeildTextController4?.dispose();

    textFieldFocusNode?.dispose();
    textController8?.dispose();
  }
}
