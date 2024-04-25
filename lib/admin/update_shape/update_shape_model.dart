import '/flutter_flow/flutter_flow_util.dart';
import 'update_shape_widget.dart' show UpdateShapeWidget;
import 'package:flutter/material.dart';

class UpdateShapeModel extends FlutterFlowModel<UpdateShapeWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for mrpTextFeild widget.
  FocusNode? mrpTextFeildFocusNode;
  TextEditingController? mrpTextFeildTextController;
  String? Function(BuildContext, String?)? mrpTextFeildTextControllerValidator;
  // State field(s) for priceTextFeild widget.
  FocusNode? priceTextFeildFocusNode;
  TextEditingController? priceTextFeildTextController;
  String? Function(BuildContext, String?)?
      priceTextFeildTextControllerValidator;
  // State field(s) for TextCatalogueCode widget.
  FocusNode? textCatalogueCodeFocusNode;
  TextEditingController? textCatalogueCodeTextController;
  String? Function(BuildContext, String?)?
      textCatalogueCodeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    mrpTextFeildFocusNode?.dispose();
    mrpTextFeildTextController?.dispose();

    priceTextFeildFocusNode?.dispose();
    priceTextFeildTextController?.dispose();

    textCatalogueCodeFocusNode?.dispose();
    textCatalogueCodeTextController?.dispose();
  }
}
