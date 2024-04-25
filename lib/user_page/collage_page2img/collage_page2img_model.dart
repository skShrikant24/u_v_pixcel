import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_page/drawer/drawer_widget.dart';
import '/user_page/footer_mobile/footer_mobile_widget.dart';
import '/user_page/footer_web/footer_web_widget.dart';
import '/user_page/header/header_widget.dart';
import 'collage_page2img_widget.dart' show CollagePage2imgWidget;
import 'package:flutter/material.dart';

class CollagePage2imgModel extends FlutterFlowModel<CollagePage2imgWidget> {
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
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SizeRecord? sizeDocOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ThicknessRecord? thicknessDocOutput;
  // Stores action output result for [Custom Action - returnOrderQtyPluslist] action in Button widget.
  List<OrdersStruct>? returnqty;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for FooterWeb component.
  late FooterWebModel footerWebModel;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SizeRecord? sizeDocOutputMo;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ThicknessRecord? thicknessDocOutputMo;
  // Stores action output result for [Custom Action - returnOrderQtyPluslist] action in Button widget.
  List<OrdersStruct>? returnqtymo;
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
