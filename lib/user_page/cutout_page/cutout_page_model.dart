import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_page/drawer/drawer_widget.dart';
import '/user_page/footer_mobile/footer_mobile_widget.dart';
import '/user_page/footer_web/footer_web_widget.dart';
import '/user_page/header/header_widget.dart';
import 'cutout_page_widget.dart' show CutoutPageWidget;
import 'package:flutter/material.dart';

class CutoutPageModel extends FlutterFlowModel<CutoutPageWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? image;

  SizeMapStruct? selectedSize;
  void updateSelectedSizeStruct(Function(SizeMapStruct) updateFn) =>
      updateFn(selectedSize ??= SizeMapStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SizeRecord? sizeDocOutCutOut;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ThicknessRecord? thicknessDocOutCutOut;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for FooterWeb component.
  late FooterWebModel footerWebModel;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (remove)] action in Button widget.
  ApiCallResponse? apiResult1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SizeRecord? sizeDocOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ThicknessRecord? thicknessDocOutput;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
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
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    footerWebModel.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    footerMobileModel.dispose();
    headerModel.dispose();
    drawerModel.dispose();
  }
}
