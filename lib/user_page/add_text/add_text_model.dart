import '/flutter_flow/flutter_flow_util.dart';
import 'add_text_widget.dart' show AddTextWidget;
import 'package:flutter/material.dart';

class AddTextModel extends FlutterFlowModel<AddTextWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextCatalogueName widget.
  FocusNode? textCatalogueNameFocusNode;
  TextEditingController? textCatalogueNameTextController;
  String? Function(BuildContext, String?)?
      textCatalogueNameTextControllerValidator;
  String? _textCatalogueNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    textCatalogueNameTextControllerValidator =
        _textCatalogueNameTextControllerValidator;
  }

  @override
  void dispose() {
    textCatalogueNameFocusNode?.dispose();
    textCatalogueNameTextController?.dispose();
  }
}
