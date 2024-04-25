import '/flutter_flow/flutter_flow_util.dart';
import 'update_size_widget.dart' show UpdateSizeWidget;
import 'package:flutter/material.dart';

class UpdateSizeModel extends FlutterFlowModel<UpdateSizeWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for sizeNameTextFeild widget.
  FocusNode? sizeNameTextFeildFocusNode;
  TextEditingController? sizeNameTextFeildTextController;
  String? Function(BuildContext, String?)?
      sizeNameTextFeildTextControllerValidator;
  // State field(s) for widthTextFeild widget.
  FocusNode? widthTextFeildFocusNode;
  TextEditingController? widthTextFeildTextController;
  String? Function(BuildContext, String?)?
      widthTextFeildTextControllerValidator;
  // State field(s) for heightTextFeild widget.
  FocusNode? heightTextFeildFocusNode;
  TextEditingController? heightTextFeildTextController;
  String? Function(BuildContext, String?)?
      heightTextFeildTextControllerValidator;
  // State field(s) for TextCatalogueCode widget.
  FocusNode? textCatalogueCodeFocusNode;
  TextEditingController? textCatalogueCodeTextController;
  String? Function(BuildContext, String?)?
      textCatalogueCodeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    sizeNameTextFeildFocusNode?.dispose();
    sizeNameTextFeildTextController?.dispose();

    widthTextFeildFocusNode?.dispose();
    widthTextFeildTextController?.dispose();

    heightTextFeildFocusNode?.dispose();
    heightTextFeildTextController?.dispose();

    textCatalogueCodeFocusNode?.dispose();
    textCatalogueCodeTextController?.dispose();
  }
}
