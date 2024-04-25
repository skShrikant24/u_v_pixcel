import '/flutter_flow/flutter_flow_util.dart';
import 'clock_page_test_widget.dart' show ClockPageTestWidget;
import 'package:flutter/material.dart';

class ClockPageTestModel extends FlutterFlowModel<ClockPageTestWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for text1 widget.
  FocusNode? text1FocusNode;
  TextEditingController? text1TextController;
  String? Function(BuildContext, String?)? text1TextControllerValidator;
  // State field(s) for text2 widget.
  FocusNode? text2FocusNode;
  TextEditingController? text2TextController;
  String? Function(BuildContext, String?)? text2TextControllerValidator;
  // State field(s) for text3 widget.
  FocusNode? text3FocusNode;
  TextEditingController? text3TextController;
  String? Function(BuildContext, String?)? text3TextControllerValidator;
  // State field(s) for text4 widget.
  FocusNode? text4FocusNode;
  TextEditingController? text4TextController;
  String? Function(BuildContext, String?)? text4TextControllerValidator;
  // State field(s) for text5 widget.
  FocusNode? text5FocusNode;
  TextEditingController? text5TextController;
  String? Function(BuildContext, String?)? text5TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    text1FocusNode?.dispose();
    text1TextController?.dispose();

    text2FocusNode?.dispose();
    text2TextController?.dispose();

    text3FocusNode?.dispose();
    text3TextController?.dispose();

    text4FocusNode?.dispose();
    text4TextController?.dispose();

    text5FocusNode?.dispose();
    text5TextController?.dispose();
  }
}
