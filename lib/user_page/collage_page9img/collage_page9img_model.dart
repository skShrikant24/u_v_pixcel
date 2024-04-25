import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_page/drawer/drawer_widget.dart';
import '/user_page/footer_mobile/footer_mobile_widget.dart';
import '/user_page/footer_web/footer_web_widget.dart';
import '/user_page/header/header_widget.dart';
import 'collage_page9img_widget.dart' show CollagePage9imgWidget;
import 'package:flutter/material.dart';

class CollagePage9imgModel extends FlutterFlowModel<CollagePage9imgWidget> {
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

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  bool isDataUploading5 = false;
  FFUploadedFile uploadedLocalFile5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl5 = '';

  bool isDataUploading6 = false;
  FFUploadedFile uploadedLocalFile6 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl6 = '';

  bool isDataUploading7 = false;
  FFUploadedFile uploadedLocalFile7 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl7 = '';

  bool isDataUploading8 = false;
  FFUploadedFile uploadedLocalFile8 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl8 = '';

  bool isDataUploading9 = false;
  FFUploadedFile uploadedLocalFile9 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl9 = '';

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
  bool isDataUploading10 = false;
  FFUploadedFile uploadedLocalFile10 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl10 = '';

  bool isDataUploading11 = false;
  FFUploadedFile uploadedLocalFile11 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl11 = '';

  bool isDataUploading12 = false;
  FFUploadedFile uploadedLocalFile12 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl12 = '';

  bool isDataUploading13 = false;
  FFUploadedFile uploadedLocalFile13 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl13 = '';

  bool isDataUploading14 = false;
  FFUploadedFile uploadedLocalFile14 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl14 = '';

  bool isDataUploading15 = false;
  FFUploadedFile uploadedLocalFile15 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl15 = '';

  bool isDataUploading16 = false;
  FFUploadedFile uploadedLocalFile16 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl16 = '';

  bool isDataUploading17 = false;
  FFUploadedFile uploadedLocalFile17 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl17 = '';

  bool isDataUploading18 = false;
  FFUploadedFile uploadedLocalFile18 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl18 = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SizeRecord? sizeDocOutputCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ThicknessRecord? thicknessDocOutputCopy;
  // Stores action output result for [Custom Action - returnOrderQtyPluslist] action in Button widget.
  List<OrdersStruct>? returnqtyCopy;
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
