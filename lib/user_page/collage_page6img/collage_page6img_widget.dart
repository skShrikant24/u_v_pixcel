import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/user_page/drawer/drawer_widget.dart';
import '/user_page/footer_mobile/footer_mobile_widget.dart';
import '/user_page/footer_web/footer_web_widget.dart';
import '/user_page/header/header_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'collage_page6img_model.dart';
export 'collage_page6img_model.dart';
import 'dart:convert';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:screenshot/screenshot.dart';
class CollagePage6imgWidget extends StatefulWidget {
  const CollagePage6imgWidget({
    super.key,
    this.categorydoc,
    String? prdTitle,
  }) : prdTitle = prdTitle ?? 'uV';

  final CategoryRecord? categorydoc;
  final String prdTitle;

  @override
  State<CollagePage6imgWidget> createState() => _CollagePage6imgWidgetState();
}

class _CollagePage6imgWidgetState extends State<CollagePage6imgWidget> {
  late CollagePage6imgModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CollagePage6imgModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().collageImgUrl1 =
        'https://firebasestorage.googleapis.com/v0/b/uvpixcel.appspot.com/o/Upload%20img%203.png?alt=media&token=af3a3bd7-fca3-4c08-9598-b75d34a2db8d';
        FFAppState().collageImgUrl2 =
        'https://firebasestorage.googleapis.com/v0/b/uvpixcel.appspot.com/o/Upload%20img%203.png?alt=media&token=af3a3bd7-fca3-4c08-9598-b75d34a2db8d';
        FFAppState().collageImgUrl3 =
        'https://firebasestorage.googleapis.com/v0/b/uvpixcel.appspot.com/o/Upload%20img%203.png?alt=media&token=af3a3bd7-fca3-4c08-9598-b75d34a2db8d';
        FFAppState().collageImgUrl4 =
        'https://firebasestorage.googleapis.com/v0/b/uvpixcel.appspot.com/o/Upload%20img%203.png?alt=media&token=af3a3bd7-fca3-4c08-9598-b75d34a2db8d';
        FFAppState().collageImgUrl5 =
        'https://firebasestorage.googleapis.com/v0/b/uvpixcel.appspot.com/o/Upload%20img%203.png?alt=media&token=af3a3bd7-fca3-4c08-9598-b75d34a2db8d';
        FFAppState().collageImgUrl6 =
        'https://firebasestorage.googleapis.com/v0/b/uvpixcel.appspot.com/o/Upload%20img%203.png?alt=media&token=af3a3bd7-fca3-4c08-9598-b75d34a2db8d';
      });
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }


  final ScreenshotController screenshotController = ScreenshotController();
  bool visible = true;
  Future<void> _captureAndDownloadScreenshot() async {
    try {
      setState(() {
        visible = false; // Set visible to false when IconButton is pressed
      });
      FFAppState().flagimg = true;
      await Future.delayed(Duration(milliseconds: 100));
      // Capture the screenshot
      Uint8List? imageBytes = await screenshotController.capture();

      if (imageBytes != null) {
        String base64Image = base64Encode(imageBytes);

        // Create a data URI for the image
        String dataUri = 'data:image/png;base64,$base64Image';

        // Now you have the base64 representation of the image and can use it wherever you need
        //print(dataUri);
        // Upload the screenshot or perform further operations

        String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
        String filename = 'screenshot_$timestamp.png';

        // Upload the screenshot to Firebase Storage with the unique filename
        final Reference ref =
        FirebaseStorage.instance.ref().child('screenshots').child(filename);
        final UploadTask uploadTask = ref.putData(imageBytes);

        // Await the completion of the upload task
        await uploadTask.whenComplete(() => null);

        // Get the download URL for the uploaded file
        String downloadURL = await ref.getDownloadURL();
        FFAppState().editedimg = downloadURL;
        /* await uploadTask.whenComplete(() {
          // Show success dialog
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Success'),
                content: Text('Image saved successfully!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        });*/
        // Print or use the download URL as needed
        print('File uploaded to Firebase Storage: $downloadURL');
      }
    } catch (e) {
      print('Error capturing or uploading screenshots: $e');
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: SizedBox(
          width: () {
            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
              return 275.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
              return 350.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
              return 350.0;
            } else {
              return 350.0;
            }
          }(),
          child: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.drawerModel,
              updateCallback: () => setState(() {}),
              child: const DrawerWidget(),
            ),
          ),
        ),
        body: Stack(
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
            ))
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 100.0,
                        height: MediaQuery.sizeOf(context).height * 0.13,
                        decoration: const BoxDecoration(),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.categorydoc?.title,
                            'Blank',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                            fontFamily: FlutterFlowTheme.of(context)
                                .headlineMediumFamily,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .headlineMediumFamily),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/HOME_PAGE.jpg',
                              ).image,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          30.0, 0.0, 30.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Screenshot(
                                            //  key: globalKey,
                                            controller: screenshotController,
                                            child:Container(
                                              width: 400.0,
                                              height: 350.0,
                                              decoration: const BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.min,
                                                      children: [
                                                        Expanded(
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor: Colors
                                                                .transparent,
                                                            onTap: () async {
                                                              final selectedMedia =
                                                              await selectMedia(
                                                                mediaSource:
                                                                MediaSource
                                                                    .photoGallery,
                                                                multiImage: false,
                                                              );
                                                              if (selectedMedia !=
                                                                  null &&
                                                                  selectedMedia.every((m) =>
                                                                      validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                setState(() =>
                                                                _model.isDataUploading1 =
                                                                true);
                                                                var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                                var downloadUrls =
                                                                <String>[];
                                                                try {
                                                                  selectedUploadedFiles =
                                                                      selectedMedia
                                                                          .map((m) =>
                                                                          FFUploadedFile(
                                                                            name: m.storagePath.split('/').last,
                                                                            bytes: m.bytes,
                                                                            height: m.dimensions?.height,
                                                                            width: m.dimensions?.width,
                                                                            blurHash: m.blurHash,
                                                                          ))
                                                                          .toList();

                                                                  downloadUrls = (await Future
                                                                      .wait(
                                                                    selectedMedia
                                                                        .map(
                                                                          (m) async =>
                                                                      await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                    ),
                                                                  ))
                                                                      .where((u) =>
                                                                  u !=
                                                                      null)
                                                                      .map((u) =>
                                                                  u!)
                                                                      .toList();
                                                                } finally {
                                                                  _model.isDataUploading1 =
                                                                  false;
                                                                }
                                                                if (selectedUploadedFiles
                                                                    .length ==
                                                                    selectedMedia
                                                                        .length &&
                                                                    downloadUrls
                                                                        .length ==
                                                                        selectedMedia
                                                                            .length) {
                                                                  setState(() {
                                                                    _model.uploadedLocalFile1 =
                                                                        selectedUploadedFiles
                                                                            .first;
                                                                    _model.uploadedFileUrl1 =
                                                                        downloadUrls
                                                                            .first;
                                                                  });
                                                                } else {
                                                                  setState(() {});
                                                                  return;
                                                                }
                                                              }

                                                              setState(() {
                                                                FFAppState()
                                                                    .collageImgUrl1 =
                                                                    _model
                                                                        .uploadedFileUrl1;
                                                              });
                                                            },
                                                            child: SizedBox(
                                                              width: 300.0,
                                                              height: 300.0,
                                                              child:
                                                              custom_widgets
                                                                  .UimageCopy(
                                                                width: 300.0,
                                                                height: 300.0,
                                                                shape: 'Square',
                                                                imageUrl: functions
                                                                    .imageurlToString(
                                                                    FFAppState()
                                                                        .collageImgUrl1),
                                                                zoomPercent: 2.0,
                                                                size: '12X9',
                                                                text: FFAppState()
                                                                    .textString,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor: Colors
                                                                .transparent,
                                                            onTap: () async {
                                                              final selectedMedia =
                                                              await selectMedia(
                                                                mediaSource:
                                                                MediaSource
                                                                    .photoGallery,
                                                                multiImage: false,
                                                              );
                                                              if (selectedMedia !=
                                                                  null &&
                                                                  selectedMedia.every((m) =>
                                                                      validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                setState(() =>
                                                                _model.isDataUploading2 =
                                                                true);
                                                                var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                                var downloadUrls =
                                                                <String>[];
                                                                try {
                                                                  selectedUploadedFiles =
                                                                      selectedMedia
                                                                          .map((m) =>
                                                                          FFUploadedFile(
                                                                            name: m.storagePath.split('/').last,
                                                                            bytes: m.bytes,
                                                                            height: m.dimensions?.height,
                                                                            width: m.dimensions?.width,
                                                                            blurHash: m.blurHash,
                                                                          ))
                                                                          .toList();

                                                                  downloadUrls = (await Future
                                                                      .wait(
                                                                    selectedMedia
                                                                        .map(
                                                                          (m) async =>
                                                                      await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                    ),
                                                                  ))
                                                                      .where((u) =>
                                                                  u !=
                                                                      null)
                                                                      .map((u) =>
                                                                  u!)
                                                                      .toList();
                                                                } finally {
                                                                  _model.isDataUploading2 =
                                                                  false;
                                                                }
                                                                if (selectedUploadedFiles
                                                                    .length ==
                                                                    selectedMedia
                                                                        .length &&
                                                                    downloadUrls
                                                                        .length ==
                                                                        selectedMedia
                                                                            .length) {
                                                                  setState(() {
                                                                    _model.uploadedLocalFile2 =
                                                                        selectedUploadedFiles
                                                                            .first;
                                                                    _model.uploadedFileUrl2 =
                                                                        downloadUrls
                                                                            .first;
                                                                  });
                                                                } else {
                                                                  setState(() {});
                                                                  return;
                                                                }
                                                              }

                                                              setState(() {
                                                                FFAppState()
                                                                    .collageImgUrl2 =
                                                                    _model
                                                                        .uploadedFileUrl2;
                                                              });
                                                            },
                                                            child: SizedBox(
                                                              width: 300.0,
                                                              height: 300.0,
                                                              child:
                                                              custom_widgets
                                                                  .UimageCopy(
                                                                width: 300.0,
                                                                height: 300.0,
                                                                shape: 'Square',
                                                                imageUrl: functions
                                                                    .imageurlToString(
                                                                    FFAppState()
                                                                        .collageImgUrl2),
                                                                zoomPercent: 2.0,
                                                                size: '12X9',
                                                                text: FFAppState()
                                                                    .textString,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor: Colors
                                                                .transparent,
                                                            onTap: () async {
                                                              final selectedMedia =
                                                              await selectMedia(
                                                                mediaSource:
                                                                MediaSource
                                                                    .photoGallery,
                                                                multiImage: false,
                                                              );
                                                              if (selectedMedia !=
                                                                  null &&
                                                                  selectedMedia.every((m) =>
                                                                      validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                setState(() =>
                                                                _model.isDataUploading3 =
                                                                true);
                                                                var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                                var downloadUrls =
                                                                <String>[];
                                                                try {
                                                                  selectedUploadedFiles =
                                                                      selectedMedia
                                                                          .map((m) =>
                                                                          FFUploadedFile(
                                                                            name: m.storagePath.split('/').last,
                                                                            bytes: m.bytes,
                                                                            height: m.dimensions?.height,
                                                                            width: m.dimensions?.width,
                                                                            blurHash: m.blurHash,
                                                                          ))
                                                                          .toList();

                                                                  downloadUrls = (await Future
                                                                      .wait(
                                                                    selectedMedia
                                                                        .map(
                                                                          (m) async =>
                                                                      await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                    ),
                                                                  ))
                                                                      .where((u) =>
                                                                  u !=
                                                                      null)
                                                                      .map((u) =>
                                                                  u!)
                                                                      .toList();
                                                                } finally {
                                                                  _model.isDataUploading3 =
                                                                  false;
                                                                }
                                                                if (selectedUploadedFiles
                                                                    .length ==
                                                                    selectedMedia
                                                                        .length &&
                                                                    downloadUrls
                                                                        .length ==
                                                                        selectedMedia
                                                                            .length) {
                                                                  setState(() {
                                                                    _model.uploadedLocalFile3 =
                                                                        selectedUploadedFiles
                                                                            .first;
                                                                    _model.uploadedFileUrl3 =
                                                                        downloadUrls
                                                                            .first;
                                                                  });
                                                                } else {
                                                                  setState(() {});
                                                                  return;
                                                                }
                                                              }

                                                              setState(() {
                                                                FFAppState()
                                                                    .collageImgUrl3 =
                                                                    _model
                                                                        .uploadedFileUrl3;
                                                              });
                                                            },
                                                            child: SizedBox(
                                                              width: 300.0,
                                                              height: 300.0,
                                                              child:
                                                              custom_widgets
                                                                  .UimageCopy(
                                                                width: 300.0,
                                                                height: 300.0,
                                                                shape: 'Square',
                                                                imageUrl: functions
                                                                    .imageurlToString(
                                                                    FFAppState()
                                                                        .collageImgUrl3),
                                                                zoomPercent: 2.0,
                                                                size: '12X9',
                                                                text: FFAppState()
                                                                    .textString,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.min,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Expanded(
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor: Colors
                                                                .transparent,
                                                            onTap: () async {
                                                              final selectedMedia =
                                                              await selectMedia(
                                                                mediaSource:
                                                                MediaSource
                                                                    .photoGallery,
                                                                multiImage: false,
                                                              );
                                                              if (selectedMedia !=
                                                                  null &&
                                                                  selectedMedia.every((m) =>
                                                                      validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                setState(() =>
                                                                _model.isDataUploading4 =
                                                                true);
                                                                var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                                var downloadUrls =
                                                                <String>[];
                                                                try {
                                                                  selectedUploadedFiles =
                                                                      selectedMedia
                                                                          .map((m) =>
                                                                          FFUploadedFile(
                                                                            name: m.storagePath.split('/').last,
                                                                            bytes: m.bytes,
                                                                            height: m.dimensions?.height,
                                                                            width: m.dimensions?.width,
                                                                            blurHash: m.blurHash,
                                                                          ))
                                                                          .toList();

                                                                  downloadUrls = (await Future
                                                                      .wait(
                                                                    selectedMedia
                                                                        .map(
                                                                          (m) async =>
                                                                      await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                    ),
                                                                  ))
                                                                      .where((u) =>
                                                                  u !=
                                                                      null)
                                                                      .map((u) =>
                                                                  u!)
                                                                      .toList();
                                                                } finally {
                                                                  _model.isDataUploading4 =
                                                                  false;
                                                                }
                                                                if (selectedUploadedFiles
                                                                    .length ==
                                                                    selectedMedia
                                                                        .length &&
                                                                    downloadUrls
                                                                        .length ==
                                                                        selectedMedia
                                                                            .length) {
                                                                  setState(() {
                                                                    _model.uploadedLocalFile4 =
                                                                        selectedUploadedFiles
                                                                            .first;
                                                                    _model.uploadedFileUrl4 =
                                                                        downloadUrls
                                                                            .first;
                                                                  });
                                                                } else {
                                                                  setState(() {});
                                                                  return;
                                                                }
                                                              }

                                                              setState(() {
                                                                FFAppState()
                                                                    .collageImgUrl4 =
                                                                    _model
                                                                        .uploadedFileUrl4;
                                                              });
                                                            },
                                                            child: SizedBox(
                                                              width: 300.0,
                                                              height: 300.0,
                                                              child:
                                                              custom_widgets
                                                                  .UimageCopy(
                                                                width: 300.0,
                                                                height: 300.0,
                                                                shape: 'Square',
                                                                imageUrl: functions
                                                                    .imageurlToString(
                                                                    FFAppState()
                                                                        .collageImgUrl4),
                                                                zoomPercent: 2.0,
                                                                size: '12X9',
                                                                text: FFAppState()
                                                                    .textString,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor: Colors
                                                                .transparent,
                                                            onTap: () async {
                                                              final selectedMedia =
                                                              await selectMedia(
                                                                mediaSource:
                                                                MediaSource
                                                                    .photoGallery,
                                                                multiImage: false,
                                                              );
                                                              if (selectedMedia !=
                                                                  null &&
                                                                  selectedMedia.every((m) =>
                                                                      validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                setState(() =>
                                                                _model.isDataUploading5 =
                                                                true);
                                                                var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                                var downloadUrls =
                                                                <String>[];
                                                                try {
                                                                  selectedUploadedFiles =
                                                                      selectedMedia
                                                                          .map((m) =>
                                                                          FFUploadedFile(
                                                                            name: m.storagePath.split('/').last,
                                                                            bytes: m.bytes,
                                                                            height: m.dimensions?.height,
                                                                            width: m.dimensions?.width,
                                                                            blurHash: m.blurHash,
                                                                          ))
                                                                          .toList();

                                                                  downloadUrls = (await Future
                                                                      .wait(
                                                                    selectedMedia
                                                                        .map(
                                                                          (m) async =>
                                                                      await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                    ),
                                                                  ))
                                                                      .where((u) =>
                                                                  u !=
                                                                      null)
                                                                      .map((u) =>
                                                                  u!)
                                                                      .toList();
                                                                } finally {
                                                                  _model.isDataUploading5 =
                                                                  false;
                                                                }
                                                                if (selectedUploadedFiles
                                                                    .length ==
                                                                    selectedMedia
                                                                        .length &&
                                                                    downloadUrls
                                                                        .length ==
                                                                        selectedMedia
                                                                            .length) {
                                                                  setState(() {
                                                                    _model.uploadedLocalFile5 =
                                                                        selectedUploadedFiles
                                                                            .first;
                                                                    _model.uploadedFileUrl5 =
                                                                        downloadUrls
                                                                            .first;
                                                                  });
                                                                } else {
                                                                  setState(() {});
                                                                  return;
                                                                }
                                                              }

                                                              setState(() {
                                                                FFAppState()
                                                                    .collageImgUrl5 =
                                                                    _model
                                                                        .uploadedFileUrl5;
                                                              });
                                                            },
                                                            child: SizedBox(
                                                              width: 300.0,
                                                              height: 300.0,
                                                              child:
                                                              custom_widgets
                                                                  .UimageCopy(
                                                                width: 300.0,
                                                                height: 300.0,
                                                                shape: 'Square',
                                                                imageUrl: functions
                                                                    .imageurlToString(
                                                                    FFAppState()
                                                                        .collageImgUrl5),
                                                                zoomPercent: 2.0,
                                                                size: '12X9',
                                                                text: FFAppState()
                                                                    .textString,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor: Colors
                                                                .transparent,
                                                            onTap: () async {
                                                              final selectedMedia =
                                                              await selectMedia(
                                                                mediaSource:
                                                                MediaSource
                                                                    .photoGallery,
                                                                multiImage: false,
                                                              );
                                                              if (selectedMedia !=
                                                                  null &&
                                                                  selectedMedia.every((m) =>
                                                                      validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                setState(() =>
                                                                _model.isDataUploading6 =
                                                                true);
                                                                var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                                var downloadUrls =
                                                                <String>[];
                                                                try {
                                                                  selectedUploadedFiles =
                                                                      selectedMedia
                                                                          .map((m) =>
                                                                          FFUploadedFile(
                                                                            name: m.storagePath.split('/').last,
                                                                            bytes: m.bytes,
                                                                            height: m.dimensions?.height,
                                                                            width: m.dimensions?.width,
                                                                            blurHash: m.blurHash,
                                                                          ))
                                                                          .toList();

                                                                  downloadUrls = (await Future
                                                                      .wait(
                                                                    selectedMedia
                                                                        .map(
                                                                          (m) async =>
                                                                      await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                    ),
                                                                  ))
                                                                      .where((u) =>
                                                                  u !=
                                                                      null)
                                                                      .map((u) =>
                                                                  u!)
                                                                      .toList();
                                                                } finally {
                                                                  _model.isDataUploading6 =
                                                                  false;
                                                                }
                                                                if (selectedUploadedFiles
                                                                    .length ==
                                                                    selectedMedia
                                                                        .length &&
                                                                    downloadUrls
                                                                        .length ==
                                                                        selectedMedia
                                                                            .length) {
                                                                  setState(() {
                                                                    _model.uploadedLocalFile6 =
                                                                        selectedUploadedFiles
                                                                            .first;
                                                                    _model.uploadedFileUrl6 =
                                                                        downloadUrls
                                                                            .first;
                                                                  });
                                                                } else {
                                                                  setState(() {});
                                                                  return;
                                                                }
                                                              }

                                                              setState(() {
                                                                FFAppState()
                                                                    .collageImgUrl6 =
                                                                    _model
                                                                        .uploadedFileUrl6;
                                                              });
                                                            },
                                                            child: SizedBox(
                                                              width: 300.0,
                                                              height: 300.0,
                                                              child:
                                                              custom_widgets
                                                                  .UimageCopy(
                                                                width: 300.0,
                                                                height: 300.0,
                                                                shape: 'Square',
                                                                imageUrl: functions
                                                                    .imageurlToString(
                                                                    FFAppState()
                                                                        .collageImgUrl6),
                                                                zoomPercent: 2.0,
                                                                size: '12X9',
                                                                text: FFAppState()
                                                                    .textString,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'By uploading an image you agree to our ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                              ),
                              TextSpan(
                                text: 'Terms of Service.',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 10.0,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey(FlutterFlowTheme.of(context)
                                  .bodyMediumFamily),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Photo Quality for ',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                              ),
                              TextSpan(
                                text: '12 x 9 ',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleLargeFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleLargeFamily),
                                ),
                              ),
                              TextSpan(
                                text: '  is Good',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey(FlutterFlowTheme.of(context)
                                  .bodyMediumFamily),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: MediaQuery.sizeOf(context).height * 0.14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 0.5,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: Text(
                                    'Sizes',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                      fontFamily:
                                      FlutterFlowTheme.of(context)
                                          .headlineSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .headlineSmallFamily),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      final sizeList = widget
                                          .categorydoc?.sizeMap
                                          .toList() ??
                                          [];
                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 5,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          childAspectRatio: 4.0,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: sizeList.length,
                                        itemBuilder: (context, sizeListIndex) {
                                          final sizeListItem =
                                          sizeList[sizeListIndex];
                                          return StreamBuilder<
                                              List<SizeRecord>>(
                                            stream: querySizeRecord(
                                              queryBuilder: (sizeRecord) =>
                                                  sizeRecord.where(
                                                    'id',
                                                    isEqualTo: sizeListItem.sizeId,
                                                  ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                    CircularProgressIndicator(
                                                      valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<SizeRecord>
                                              buttonSizeRecordList =
                                              snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final buttonSizeRecord =
                                              buttonSizeRecordList
                                                  .isNotEmpty
                                                  ? buttonSizeRecordList
                                                  .first
                                                  : null;
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() {
                                                    FFAppState().size =
                                                        buttonSizeRecord.id;
                                                  });
                                                  setState(() {
                                                    _model.selectedSize =
                                                        sizeListItem;
                                                  });
                                                  setState(() {
                                                    FFAppState().thickness =
                                                        sizeListItem
                                                            .thickness.first.id;
                                                    FFAppState().productPrice =
                                                        sizeListItem.thickness
                                                            .first.sellingPrice;
                                                    FFAppState()
                                                        .productMRPPrice =
                                                        sizeListItem.thickness
                                                            .first.mrpPrice;
                                                  });
                                                },
                                                text: buttonSizeRecord!.title,
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                                  iconPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0.0, 0.0,
                                                      0.0, 0.0),
                                                  color: FFAppState().size ==
                                                      sizeListItem.sizeId
                                                      ? FlutterFlowTheme.of(
                                                      context)
                                                      .secondary
                                                      : FlutterFlowTheme.of(
                                                      context)
                                                      .secondaryBackground,
                                                  textStyle:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .labelMedium
                                                      .override(
                                                    fontFamily:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .labelMediumFamily,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                        .containsKey(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .labelMediumFamily),
                                                  ),
                                                  elevation: 0.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      8.0),
                                                  hoverBorderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .secondary,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.25,
                          height: MediaQuery.sizeOf(context).height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: Text(
                                    'Thickness  (mm)',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                      fontFamily:
                                      FlutterFlowTheme.of(context)
                                          .headlineSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .headlineSmallFamily),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      final thicknessList = _model
                                          .selectedSize?.thickness
                                          .toList() ??
                                          [];
                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          childAspectRatio: 4.25,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: thicknessList.length,
                                        itemBuilder:
                                            (context, thicknessListIndex) {
                                          final thicknessListItem =
                                          thicknessList[thicknessListIndex];
                                          return StreamBuilder<
                                              List<ThicknessRecord>>(
                                            stream: queryThicknessRecord(
                                              queryBuilder: (thicknessRecord) =>
                                                  thicknessRecord.where(
                                                    'id',
                                                    isEqualTo: thicknessListItem.id,
                                                  ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                    CircularProgressIndicator(
                                                      valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ThicknessRecord>
                                              buttonThicknessRecordList =
                                              snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final buttonThicknessRecord =
                                              buttonThicknessRecordList
                                                  .isNotEmpty
                                                  ? buttonThicknessRecordList
                                                  .first
                                                  : null;
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() {
                                                    FFAppState().thickness =
                                                        buttonThicknessRecord
                                                            .id;
                                                    FFAppState().productPrice =
                                                        thicknessListItem
                                                            .sellingPrice;
                                                    FFAppState()
                                                        .productMRPPrice =
                                                        thicknessListItem
                                                            .mrpPrice;
                                                  });
                                                  await queryCategoryRecordOnce(
                                                    queryBuilder:
                                                        (categoryRecord) =>
                                                        categoryRecord
                                                            .where(
                                                          'categoryId',
                                                          isEqualTo: widget
                                                              .categorydoc
                                                              ?.categoryId,
                                                        ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                },
                                                text:
                                                buttonThicknessRecord!.name,
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                                  iconPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0.0, 0.0,
                                                      0.0, 0.0),
                                                  color: FFAppState()
                                                      .thickness ==
                                                      thicknessListItem.id
                                                      ? FlutterFlowTheme.of(
                                                      context)
                                                      .secondary
                                                      : FlutterFlowTheme.of(
                                                      context)
                                                      .secondaryBackground,
                                                  textStyle:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .labelMedium
                                                      .override(
                                                    fontFamily:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .labelMediumFamily,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                        .containsKey(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .labelMediumFamily),
                                                  ),
                                                  elevation: 0.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      8.0),
                                                  hoverBorderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .secondary,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {},
                                child: Text(
                                  '₹ ${FFAppState().productPrice.toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .displayMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondary,
                                    fontSize: 30.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                        FlutterFlowTheme.of(context)
                                            .displayMediumFamily),
                                  ),
                                ),
                              ),
                            ),
                            Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                Text(
                                  '₹ ${FFAppState().productMRPPrice.toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .displayMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .accent3,
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                        FlutterFlowTheme.of(context)
                                            .displayMediumFamily),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 90.0,
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      color:
                                      FlutterFlowTheme.of(context).accent3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Only ',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color:
                                  FlutterFlowTheme.of(context).success,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                              ),
                              TextSpan(
                                text: '7 ',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                              ),
                              TextSpan(
                                text: 'Acrylics',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                              ),
                              TextSpan(
                                text: ' left !',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color:
                                  FlutterFlowTheme.of(context).success,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey(FlutterFlowTheme.of(context)
                                  .bodyMediumFamily),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Current Processing Time ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                              ),
                              TextSpan(
                                text: '',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                              ),
                              TextSpan(
                                text: 'Hours',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey(FlutterFlowTheme.of(context)
                                  .bodyMediumFamily),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if ((FFAppState().size != '') &&
                                (FFAppState().thickness != '')) {
                              _model.sizeDocOutput = await querySizeRecordOnce(
                                queryBuilder: (sizeRecord) => sizeRecord.where(
                                  'id',
                                  isEqualTo: FFAppState().size,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              _model.thicknessDocOutput =
                              await queryThicknessRecordOnce(
                                queryBuilder: (thicknessRecord) =>
                                    thicknessRecord.where(
                                      'id',
                                      isEqualTo: FFAppState().thickness,
                                    ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              setState(() {
                                FFAppState().count = FFAppState().count +
                                    valueOrDefault<int>(
                                      FFAppState().orderList.length,
                                      1,
                                    );
                              });
                              setState(() {
                                FFAppState()
                                    .addToCollagelist(_model.uploadedFileUrl1);
                              });
                              setState(() {
                                FFAppState()
                                    .addToCollagelist(_model.uploadedFileUrl2);
                              });
                              setState(() {
                                FFAppState()
                                    .addToCollagelist(_model.uploadedFileUrl3);
                              });
                              setState(() {
                                FFAppState()
                                    .addToCollagelist(_model.uploadedFileUrl4);
                              });
                              setState(() {
                                FFAppState()
                                    .addToCollagelist(_model.uploadedFileUrl5);
                              });
                              setState(() {
                                FFAppState()
                                    .addToCollagelist(_model.uploadedFileUrl6);
                              });
                              await _captureAndDownloadScreenshot();
                              setState(() {
                                FFAppState().updateOrdersStruct(
                                      (e) => e
                                    ..imageurl = functions.imgstringToimgPath(
                                        FFAppState().editedimg)
                                    ..textString = FFAppState().textString
                                    ..shapes = FFAppState().Shape
                                    ..size = _model.sizeDocOutput?.title
                                    ..thickness =
                                        _model.thicknessDocOutput?.name
                                    ..price = valueOrDefault<double>(
                                      FFAppState().productPrice,
                                      599.0,
                                    )
                                    ..qty = 1.0
                                    ..collageimages =
                                    FFAppState().collagelist.toList()
                                    ..categoryName = valueOrDefault<String>(
                                      widget.categorydoc?.heading,
                                      'uv',
                                    )
                                    ..count = FFAppState().count,
                                );
                              });
                              _model.returnqty =
                              await actions.returnOrderQtyPluslist(
                                FFAppState().orders,
                              );
                              setState(() {
                                FFAppState().orders = OrdersStruct();
                                FFAppState().editedimg = '';
                              });

                              context.pushNamed('ShoppingCartnew');
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    content: const Text('Select Size & Thickness !'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }

                            setState(() {});
                          },
                          text: 'Buy Now',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                40.0, 0.0, 40.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).success,
                            textStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .headlineMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey(FlutterFlowTheme.of(context)
                                  .headlineMediumFamily),
                            ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            150.0, 0.0, 150.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Text(
                                'Check Estimated Delivery Date',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .headlineSmallFamily),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  25.0, 0.0, 25.0, 10.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.3,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).accent3,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _model.textController1,
                                        focusNode: _model.textFieldFocusNode1,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: false,
                                          labelStyle: FlutterFlowTheme.of(
                                              context)
                                              .headlineSmall
                                              .override(
                                            fontFamily:
                                            FlutterFlowTheme.of(context)
                                                .headlineSmallFamily,
                                            color:
                                            FlutterFlowTheme.of(context)
                                                .accent3,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts
                                                .asMap()
                                                .containsKey(FlutterFlowTheme
                                                .of(context)
                                                .headlineSmallFamily),
                                          ),
                                          hintText: 'Enter Pincode',
                                          hintStyle: FlutterFlowTheme.of(
                                              context)
                                              .headlineSmall
                                              .override(
                                            fontFamily:
                                            FlutterFlowTheme.of(context)
                                                .headlineSmallFamily,
                                            color:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts
                                                .asMap()
                                                .containsKey(FlutterFlowTheme
                                                .of(context)
                                                .headlineSmallFamily),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(0.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(0.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(0.0),
                                          ),
                                          focusedErrorBorder:
                                          OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(0.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                          fontFamily:
                                          FlutterFlowTheme.of(context)
                                              .headlineSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts
                                              .asMap()
                                              .containsKey(
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .headlineSmallFamily),
                                        ),
                                        validator: _model
                                            .textController1Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {},
                                      text: 'Check',
                                      options: FFButtonOptions(
                                        height: 50.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                          fontFamily:
                                          FlutterFlowTheme.of(context)
                                              .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts
                                              .asMap()
                                              .containsKey(
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .titleSmallFamily),
                                        ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(0.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (FFAppState().showEstimatedDate)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 25.0, 10.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                      FlutterFlowTheme.of(context).accent3,
                                    ),
                                  ),
                                  child: Text(
                                    'Expected ',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily:
                                      FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .bodyMediumFamily),
                                    ),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  25.0, 0.0, 25.0, 20.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.3,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).accent3,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 7.0, 0.0),
                                              child: Icon(
                                                Icons.local_shipping,
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                            Text(
                                              'Free \nShipping',
                                              textAlign: TextAlign.center,
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .override(
                                                fontFamily:
                                                FlutterFlowTheme.of(
                                                    context)
                                                    .labelLargeFamily,
                                                color:
                                                FlutterFlowTheme.of(
                                                    context)
                                                    .secondaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                    .asMap()
                                                    .containsKey(
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .labelLargeFamily),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 7.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.award,
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                            Text(
                                              '30 day \nMoney Back \nGuaranty ',
                                              textAlign: TextAlign.center,
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .override(
                                                fontFamily:
                                                FlutterFlowTheme.of(
                                                    context)
                                                    .labelLargeFamily,
                                                color:
                                                FlutterFlowTheme.of(
                                                    context)
                                                    .secondaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                    .asMap()
                                                    .containsKey(
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .labelLargeFamily),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 7.0, 0.0),
                                              child: Icon(
                                                Icons.security_sharp,
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                            Text(
                                              '100% Secure \nPayment',
                                              textAlign: TextAlign.center,
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .override(
                                                fontFamily:
                                                FlutterFlowTheme.of(
                                                    context)
                                                    .labelLargeFamily,
                                                color:
                                                FlutterFlowTheme.of(
                                                    context)
                                                    .secondaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                    .asMap()
                                                    .containsKey(
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .labelLargeFamily),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Description',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                      fontFamily:
                                      FlutterFlowTheme.of(context)
                                          .headlineLargeFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .headlineLargeFamily),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 35.0),
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 15.0),
                                      child: Text(
                                        'Perfect home décor gift.',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                          fontFamily:
                                          FlutterFlowTheme.of(context)
                                              .titleLargeFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts
                                              .asMap()
                                              .containsKey(
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .titleLargeFamily),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 7.0),
                                      child: Text(
                                        'Why UVPIXEL Acrylic Photo?',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                          fontFamily:
                                          FlutterFlowTheme.of(context)
                                              .headlineMediumFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts
                                              .asMap()
                                              .containsKey(FlutterFlowTheme
                                              .of(context)
                                              .headlineMediumFamily),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '- Instant processing from pune\n\n- Our pixel-perfect direct printing on acrylic, ensures that every detail of your image is faithfully reproduced with stunning accuracy and clarity. \n\n- HD print and high resolution\n\n- Before printing on acrylic, we subject the surface to a meticulous chemical treatment process. This treatment is crucial for ensuring optimal adhesion of the ink and achieving vibrant, long-lasting prints.\n\n- Yes, you heard it right! We offer same-day processing of orders to ensure you receive your personalized products with lightning speed.\n\n- Experience the convenience of fast and reliable processing from our pune facilities, ensuring that you receive your custom creations without delay.',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                        fontFamily:
                                        FlutterFlowTheme.of(context)
                                            .titleLargeFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleLargeFamily),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 5.0),
                              child: FlutterFlowVideoPlayer(
                                path: 'assets/videos/Sequence_03.mp4',
                                videoType: VideoType.asset,
                                width: double.infinity,
                                height: 800.0,
                                autoPlay: true,
                                looping: true,
                                showControls: false,
                                allowFullScreen: true,
                                allowPlaybackSpeedMenu: false,
                                lazyLoad: true,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 40.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Perfect home décor gift.',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                      fontFamily:
                                      FlutterFlowTheme.of(context)
                                          .headlineSmallFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .headlineSmallFamily),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 25.0),
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '- Easy to install\n\nThat quick mounting option with industrial level two-sided tapes sounds incredibly convenient! It eliminates the need for nails or hammers, making the installation process hassle-free and suitable for various surfaces without causing damage.\n\n- Providing a sleek and professional appearance once installed. This convenient mounting solution not only saves time but also preserves the integrity of your walls, making it ideal for both residential and commercial spaces where ease of installation and aesthetic appeal are paramount.\n\n----- You can customize your acrylic photo prints online with us in a range of sizes, providing you with options to suit your preferences and space requirements. Here are the available size options for you to choose from in inches:\n12x9 inches\n11x11 inches\n16x12 inches\n18x12 inches\n16x16 inches\n21x15 inches\n30x20 inches\n35x23 inches\n\nThese size options offer versatility and flexibility to accommodate various display needs, whether you\'re looking for a small accent piece or a statement artwork for your wall.\n\n- Auto orientation for acrylic prints is a great feature! It ensures that your photos are displayed in the best possible orientation to maximize print quality and visual impact.\n\n- It ensures that your acrylic picture is tailored precisely to fit the proportions of your image, whether it\'s vertical or horizontal, resulting in a perfectly customized print every time. Additionally, offering two thickness options of 3 mm, 5mm and 8 mm provides further flexibility for customers to choose the look and feel that best complements their space and personal preferences.',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                        fontFamily:
                                        FlutterFlowTheme.of(context)
                                            .titleLargeFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleLargeFamily),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 35.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/chart.jpg',
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 35.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/chart_2.jpg',
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      wrapWithModel(
                        model: _model.footerWebModel,
                        updateCallback: () => setState(() {}),
                        child: const FooterWebWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            if (responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            ))
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 100.0,
                        height: MediaQuery.sizeOf(context).height * 0.13,
                        decoration: const BoxDecoration(),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            25.0, 0.0, 25.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Text(
                                  'Customized Acrylic Photos by UVPiXEL',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                        FlutterFlowTheme.of(context)
                                            .titleMediumFamily),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.45,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/HOME_PAGE.jpg',
                              ).image,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Screenshot(
                                                      //  key: globalKey,
                                                      controller: screenshotController,
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration: const BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                2.0,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                          MainAxisSize.min,
                                                          children: [
                                                            Expanded(
                                                              child: Row(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                    InkWell(
                                                                      splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                      focusColor:
                                                                      Colors
                                                                          .transparent,
                                                                      hoverColor:
                                                                      Colors
                                                                          .transparent,
                                                                      highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        final selectedMedia =
                                                                        await selectMedia(
                                                                          mediaSource:
                                                                          MediaSource.photoGallery,
                                                                          multiImage:
                                                                          false,
                                                                        );
                                                                        if (selectedMedia !=
                                                                            null &&
                                                                            selectedMedia.every((m) => validateFileFormat(
                                                                                m.storagePath,
                                                                                context))) {
                                                                          setState(() =>
                                                                          _model.isDataUploading7 =
                                                                          true);
                                                                          var selectedUploadedFiles =
                                                                          <FFUploadedFile>[];

                                                                          var downloadUrls =
                                                                          <String>[];
                                                                          try {
                                                                            selectedUploadedFiles = selectedMedia
                                                                                .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                                .toList();

                                                                            downloadUrls = (await Future.wait(
                                                                              selectedMedia.map(
                                                                                    (m) async => await uploadData(m.storagePath, m.bytes),
                                                                              ),
                                                                            ))
                                                                                .where((u) => u != null)
                                                                                .map((u) => u!)
                                                                                .toList();
                                                                          } finally {
                                                                            _model.isDataUploading7 =
                                                                            false;
                                                                          }
                                                                          if (selectedUploadedFiles.length == selectedMedia.length &&
                                                                              downloadUrls.length ==
                                                                                  selectedMedia.length) {
                                                                            setState(
                                                                                    () {
                                                                                  _model.uploadedLocalFile7 =
                                                                                      selectedUploadedFiles.first;
                                                                                  _model.uploadedFileUrl7 =
                                                                                      downloadUrls.first;
                                                                                });
                                                                          } else {
                                                                            setState(
                                                                                    () {});
                                                                            return;
                                                                          }
                                                                        }

                                                                        setState(
                                                                                () {
                                                                              FFAppState().collageImgUrl1 =
                                                                                  _model.uploadedFileUrl7;
                                                                            });
                                                                      },
                                                                      child:
                                                                      SizedBox(
                                                                        width:
                                                                        300.0,
                                                                        height:
                                                                        300.0,
                                                                        child: custom_widgets
                                                                            .UimageCopy(
                                                                          width:
                                                                          300.0,
                                                                          height:
                                                                          300.0,
                                                                          shape:
                                                                          'Square',
                                                                          imageUrl:
                                                                          functions.imageurlToString(FFAppState().collageImgUrl1),
                                                                          zoomPercent:
                                                                          2.0,
                                                                          size:
                                                                          '12X9',
                                                                          text: FFAppState()
                                                                              .textString,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                    InkWell(
                                                                      splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                      focusColor:
                                                                      Colors
                                                                          .transparent,
                                                                      hoverColor:
                                                                      Colors
                                                                          .transparent,
                                                                      highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        final selectedMedia =
                                                                        await selectMedia(
                                                                          mediaSource:
                                                                          MediaSource.photoGallery,
                                                                          multiImage:
                                                                          false,
                                                                        );
                                                                        if (selectedMedia !=
                                                                            null &&
                                                                            selectedMedia.every((m) => validateFileFormat(
                                                                                m.storagePath,
                                                                                context))) {
                                                                          setState(() =>
                                                                          _model.isDataUploading8 =
                                                                          true);
                                                                          var selectedUploadedFiles =
                                                                          <FFUploadedFile>[];

                                                                          var downloadUrls =
                                                                          <String>[];
                                                                          try {
                                                                            selectedUploadedFiles = selectedMedia
                                                                                .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                                .toList();

                                                                            downloadUrls = (await Future.wait(
                                                                              selectedMedia.map(
                                                                                    (m) async => await uploadData(m.storagePath, m.bytes),
                                                                              ),
                                                                            ))
                                                                                .where((u) => u != null)
                                                                                .map((u) => u!)
                                                                                .toList();
                                                                          } finally {
                                                                            _model.isDataUploading8 =
                                                                            false;
                                                                          }
                                                                          if (selectedUploadedFiles.length == selectedMedia.length &&
                                                                              downloadUrls.length ==
                                                                                  selectedMedia.length) {
                                                                            setState(
                                                                                    () {
                                                                                  _model.uploadedLocalFile8 =
                                                                                      selectedUploadedFiles.first;
                                                                                  _model.uploadedFileUrl8 =
                                                                                      downloadUrls.first;
                                                                                });
                                                                          } else {
                                                                            setState(
                                                                                    () {});
                                                                            return;
                                                                          }
                                                                        }

                                                                        setState(
                                                                                () {
                                                                              FFAppState().collageImgUrl2 =
                                                                                  _model.uploadedFileUrl8;
                                                                            });
                                                                      },
                                                                      child:
                                                                      SizedBox(
                                                                        width:
                                                                        300.0,
                                                                        height:
                                                                        300.0,
                                                                        child: custom_widgets
                                                                            .UimageCopy(
                                                                          width:
                                                                          300.0,
                                                                          height:
                                                                          300.0,
                                                                          shape:
                                                                          'Square',
                                                                          imageUrl:
                                                                          functions.imageurlToString(FFAppState().collageImgUrl2),
                                                                          zoomPercent:
                                                                          2.0,
                                                                          size:
                                                                          '12X9',
                                                                          text: FFAppState()
                                                                              .textString,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                    InkWell(
                                                                      splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                      focusColor:
                                                                      Colors
                                                                          .transparent,
                                                                      hoverColor:
                                                                      Colors
                                                                          .transparent,
                                                                      highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        final selectedMedia =
                                                                        await selectMedia(
                                                                          mediaSource:
                                                                          MediaSource.photoGallery,
                                                                          multiImage:
                                                                          false,
                                                                        );
                                                                        if (selectedMedia !=
                                                                            null &&
                                                                            selectedMedia.every((m) => validateFileFormat(
                                                                                m.storagePath,
                                                                                context))) {
                                                                          setState(() =>
                                                                          _model.isDataUploading9 =
                                                                          true);
                                                                          var selectedUploadedFiles =
                                                                          <FFUploadedFile>[];

                                                                          var downloadUrls =
                                                                          <String>[];
                                                                          try {
                                                                            selectedUploadedFiles = selectedMedia
                                                                                .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                                .toList();

                                                                            downloadUrls = (await Future.wait(
                                                                              selectedMedia.map(
                                                                                    (m) async => await uploadData(m.storagePath, m.bytes),
                                                                              ),
                                                                            ))
                                                                                .where((u) => u != null)
                                                                                .map((u) => u!)
                                                                                .toList();
                                                                          } finally {
                                                                            _model.isDataUploading9 =
                                                                            false;
                                                                          }
                                                                          if (selectedUploadedFiles.length == selectedMedia.length &&
                                                                              downloadUrls.length ==
                                                                                  selectedMedia.length) {
                                                                            setState(
                                                                                    () {
                                                                                  _model.uploadedLocalFile9 =
                                                                                      selectedUploadedFiles.first;
                                                                                  _model.uploadedFileUrl9 =
                                                                                      downloadUrls.first;
                                                                                });
                                                                          } else {
                                                                            setState(
                                                                                    () {});
                                                                            return;
                                                                          }
                                                                        }

                                                                        setState(
                                                                                () {
                                                                              FFAppState().collageImgUrl3 =
                                                                                  _model.uploadedFileUrl9;
                                                                            });
                                                                      },
                                                                      child:
                                                                      SizedBox(
                                                                        width:
                                                                        300.0,
                                                                        height:
                                                                        300.0,
                                                                        child: custom_widgets
                                                                            .UimageCopy(
                                                                          width:
                                                                          300.0,
                                                                          height:
                                                                          300.0,
                                                                          shape:
                                                                          'Square',
                                                                          imageUrl:
                                                                          functions.imageurlToString(FFAppState().collageImgUrl3),
                                                                          zoomPercent:
                                                                          2.0,
                                                                          size:
                                                                          '12X9',
                                                                          text: FFAppState()
                                                                              .textString,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Row(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                    InkWell(
                                                                      splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                      focusColor:
                                                                      Colors
                                                                          .transparent,
                                                                      hoverColor:
                                                                      Colors
                                                                          .transparent,
                                                                      highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        final selectedMedia =
                                                                        await selectMedia(
                                                                          mediaSource:
                                                                          MediaSource.photoGallery,
                                                                          multiImage:
                                                                          false,
                                                                        );
                                                                        if (selectedMedia !=
                                                                            null &&
                                                                            selectedMedia.every((m) => validateFileFormat(
                                                                                m.storagePath,
                                                                                context))) {
                                                                          setState(() =>
                                                                          _model.isDataUploading10 =
                                                                          true);
                                                                          var selectedUploadedFiles =
                                                                          <FFUploadedFile>[];

                                                                          var downloadUrls =
                                                                          <String>[];
                                                                          try {
                                                                            selectedUploadedFiles = selectedMedia
                                                                                .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                                .toList();

                                                                            downloadUrls = (await Future.wait(
                                                                              selectedMedia.map(
                                                                                    (m) async => await uploadData(m.storagePath, m.bytes),
                                                                              ),
                                                                            ))
                                                                                .where((u) => u != null)
                                                                                .map((u) => u!)
                                                                                .toList();
                                                                          } finally {
                                                                            _model.isDataUploading10 =
                                                                            false;
                                                                          }
                                                                          if (selectedUploadedFiles.length == selectedMedia.length &&
                                                                              downloadUrls.length ==
                                                                                  selectedMedia.length) {
                                                                            setState(
                                                                                    () {
                                                                                  _model.uploadedLocalFile10 =
                                                                                      selectedUploadedFiles.first;
                                                                                  _model.uploadedFileUrl10 =
                                                                                      downloadUrls.first;
                                                                                });
                                                                          } else {
                                                                            setState(
                                                                                    () {});
                                                                            return;
                                                                          }
                                                                        }

                                                                        setState(
                                                                                () {
                                                                              FFAppState().collageImgUrl4 =
                                                                                  _model.uploadedFileUrl10;
                                                                            });
                                                                      },
                                                                      child:
                                                                      SizedBox(
                                                                        width:
                                                                        300.0,
                                                                        height:
                                                                        300.0,
                                                                        child: custom_widgets
                                                                            .UimageCopy(
                                                                          width:
                                                                          300.0,
                                                                          height:
                                                                          300.0,
                                                                          shape:
                                                                          'Square',
                                                                          imageUrl:
                                                                          functions.imageurlToString(FFAppState().collageImgUrl4),
                                                                          zoomPercent:
                                                                          2.0,
                                                                          size:
                                                                          '12X9',
                                                                          text: FFAppState()
                                                                              .textString,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                    InkWell(
                                                                      splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                      focusColor:
                                                                      Colors
                                                                          .transparent,
                                                                      hoverColor:
                                                                      Colors
                                                                          .transparent,
                                                                      highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        final selectedMedia =
                                                                        await selectMedia(
                                                                          mediaSource:
                                                                          MediaSource.photoGallery,
                                                                          multiImage:
                                                                          false,
                                                                        );
                                                                        if (selectedMedia !=
                                                                            null &&
                                                                            selectedMedia.every((m) => validateFileFormat(
                                                                                m.storagePath,
                                                                                context))) {
                                                                          setState(() =>
                                                                          _model.isDataUploading11 =
                                                                          true);
                                                                          var selectedUploadedFiles =
                                                                          <FFUploadedFile>[];

                                                                          var downloadUrls =
                                                                          <String>[];
                                                                          try {
                                                                            selectedUploadedFiles = selectedMedia
                                                                                .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                                .toList();

                                                                            downloadUrls = (await Future.wait(
                                                                              selectedMedia.map(
                                                                                    (m) async => await uploadData(m.storagePath, m.bytes),
                                                                              ),
                                                                            ))
                                                                                .where((u) => u != null)
                                                                                .map((u) => u!)
                                                                                .toList();
                                                                          } finally {
                                                                            _model.isDataUploading11 =
                                                                            false;
                                                                          }
                                                                          if (selectedUploadedFiles.length == selectedMedia.length &&
                                                                              downloadUrls.length ==
                                                                                  selectedMedia.length) {
                                                                            setState(
                                                                                    () {
                                                                                  _model.uploadedLocalFile11 =
                                                                                      selectedUploadedFiles.first;
                                                                                  _model.uploadedFileUrl11 =
                                                                                      downloadUrls.first;
                                                                                });
                                                                          } else {
                                                                            setState(
                                                                                    () {});
                                                                            return;
                                                                          }
                                                                        }

                                                                        setState(
                                                                                () {
                                                                              FFAppState().collageImgUrl5 =
                                                                                  _model.uploadedFileUrl11;
                                                                            });
                                                                      },
                                                                      child:
                                                                      SizedBox(
                                                                        width:
                                                                        300.0,
                                                                        height:
                                                                        300.0,
                                                                        child: custom_widgets
                                                                            .UimageCopy(
                                                                          width:
                                                                          300.0,
                                                                          height:
                                                                          300.0,
                                                                          shape:
                                                                          'Square',
                                                                          imageUrl:
                                                                          functions.imageurlToString(FFAppState().collageImgUrl5),
                                                                          zoomPercent:
                                                                          2.0,
                                                                          size:
                                                                          '12X9',
                                                                          text: FFAppState()
                                                                              .textString,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                    InkWell(
                                                                      splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                      focusColor:
                                                                      Colors
                                                                          .transparent,
                                                                      hoverColor:
                                                                      Colors
                                                                          .transparent,
                                                                      highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        final selectedMedia =
                                                                        await selectMedia(
                                                                          mediaSource:
                                                                          MediaSource.photoGallery,
                                                                          multiImage:
                                                                          false,
                                                                        );
                                                                        if (selectedMedia !=
                                                                            null &&
                                                                            selectedMedia.every((m) => validateFileFormat(
                                                                                m.storagePath,
                                                                                context))) {
                                                                          setState(() =>
                                                                          _model.isDataUploading12 =
                                                                          true);
                                                                          var selectedUploadedFiles =
                                                                          <FFUploadedFile>[];

                                                                          var downloadUrls =
                                                                          <String>[];
                                                                          try {
                                                                            selectedUploadedFiles = selectedMedia
                                                                                .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                                .toList();

                                                                            downloadUrls = (await Future.wait(
                                                                              selectedMedia.map(
                                                                                    (m) async => await uploadData(m.storagePath, m.bytes),
                                                                              ),
                                                                            ))
                                                                                .where((u) => u != null)
                                                                                .map((u) => u!)
                                                                                .toList();
                                                                          } finally {
                                                                            _model.isDataUploading12 =
                                                                            false;
                                                                          }
                                                                          if (selectedUploadedFiles.length == selectedMedia.length &&
                                                                              downloadUrls.length ==
                                                                                  selectedMedia.length) {
                                                                            setState(
                                                                                    () {
                                                                                  _model.uploadedLocalFile12 =
                                                                                      selectedUploadedFiles.first;
                                                                                  _model.uploadedFileUrl12 =
                                                                                      downloadUrls.first;
                                                                                });
                                                                          } else {
                                                                            setState(
                                                                                    () {});
                                                                            return;
                                                                          }
                                                                        }

                                                                        setState(
                                                                                () {
                                                                              FFAppState().collageImgUrl6 =
                                                                                  _model.uploadedFileUrl12;
                                                                            });
                                                                      },
                                                                      child:
                                                                      SizedBox(
                                                                        width:
                                                                        300.0,
                                                                        height:
                                                                        300.0,
                                                                        child: custom_widgets
                                                                            .UimageCopy(
                                                                          width:
                                                                          300.0,
                                                                          height:
                                                                          300.0,
                                                                          shape:
                                                                          'Square',
                                                                          imageUrl:
                                                                          functions.imageurlToString(FFAppState().collageImgUrl6),
                                                                          zoomPercent:
                                                                          2.0,
                                                                          size:
                                                                          '12X9',
                                                                          text: FFAppState()
                                                                              .textString,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'By uploading an image you agree to our ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                              ),
                              TextSpan(
                                text: 'Terms of Service.',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 10.0,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey(FlutterFlowTheme.of(context)
                                  .bodyMediumFamily),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Photo Quality for ',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                              ),
                              TextSpan(
                                text: '12 x 9 ',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleLargeFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleLargeFamily),
                                ),
                              ),
                              TextSpan(
                                text: ' is Good',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey(FlutterFlowTheme.of(context)
                                  .bodyMediumFamily),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'UV Pixel ',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleLargeFamily,
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleLargeFamily),
                                ),
                              ),
                              TextSpan(
                                text: '2 Mounting Options',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleLargeFamily,
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleLargeFamily),
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey(FlutterFlowTheme.of(context)
                                  .bodyMediumFamily),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          height: MediaQuery.sizeOf(context).height * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 0.5,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: Text(
                                    'Sizes',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                      fontFamily:
                                      FlutterFlowTheme.of(context)
                                          .headlineSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .headlineSmallFamily),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      final sizeList = widget
                                          .categorydoc?.sizeMap
                                          .toList() ??
                                          [];
                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 5,
                                          crossAxisSpacing: 3.0,
                                          mainAxisSpacing: 7.0,
                                          childAspectRatio: 2.25,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: sizeList.length,
                                        itemBuilder: (context, sizeListIndex) {
                                          final sizeListItem =
                                          sizeList[sizeListIndex];
                                          return StreamBuilder<
                                              List<SizeRecord>>(
                                            stream: querySizeRecord(
                                              queryBuilder: (sizeRecord) =>
                                                  sizeRecord.where(
                                                    'id',
                                                    isEqualTo: sizeListItem.sizeId,
                                                  ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                    CircularProgressIndicator(
                                                      valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<SizeRecord>
                                              buttonSizeRecordList =
                                              snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final buttonSizeRecord =
                                              buttonSizeRecordList
                                                  .isNotEmpty
                                                  ? buttonSizeRecordList
                                                  .first
                                                  : null;
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() {
                                                    FFAppState().size =
                                                        buttonSizeRecord.id;
                                                  });
                                                  setState(() {
                                                    _model.selectedSize =
                                                        sizeListItem;
                                                  });
                                                  setState(() {
                                                    FFAppState().thickness =
                                                        sizeListItem
                                                            .thickness.first.id;
                                                    FFAppState().productPrice =
                                                        sizeListItem.thickness
                                                            .first.sellingPrice;
                                                    FFAppState()
                                                        .productMRPPrice =
                                                        sizeListItem.thickness
                                                            .first.mrpPrice;
                                                  });
                                                },
                                                text: buttonSizeRecord!.title,
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      5.0, 0.0, 5.0, 0.0),
                                                  iconPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0.0, 0.0,
                                                      0.0, 0.0),
                                                  color: FFAppState().size ==
                                                      sizeListItem.sizeId
                                                      ? FlutterFlowTheme.of(
                                                      context)
                                                      .secondary
                                                      : FlutterFlowTheme.of(
                                                      context)
                                                      .secondaryBackground,
                                                  textStyle:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .labelLarge
                                                      .override(
                                                    fontFamily:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .labelLargeFamily,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                        .containsKey(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .labelLargeFamily),
                                                  ),
                                                  elevation: 0.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      8.0),
                                                  hoverBorderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .secondary,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: 70.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: Text(
                                    'Thickness  (mm)',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                      fontFamily:
                                      FlutterFlowTheme.of(context)
                                          .headlineSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .headlineSmallFamily),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      final thicknessList = _model
                                          .selectedSize?.thickness
                                          .toList() ??
                                          [];
                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          childAspectRatio: 4.0,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: thicknessList.length,
                                        itemBuilder:
                                            (context, thicknessListIndex) {
                                          final thicknessListItem =
                                          thicknessList[thicknessListIndex];
                                          return StreamBuilder<
                                              List<ThicknessRecord>>(
                                            stream: queryThicknessRecord(
                                              queryBuilder: (thicknessRecord) =>
                                                  thicknessRecord.where(
                                                    'id',
                                                    isEqualTo: thicknessListItem.id,
                                                  ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                    CircularProgressIndicator(
                                                      valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ThicknessRecord>
                                              buttonThicknessRecordList =
                                              snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final buttonThicknessRecord =
                                              buttonThicknessRecordList
                                                  .isNotEmpty
                                                  ? buttonThicknessRecordList
                                                  .first
                                                  : null;
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() {
                                                    FFAppState().thickness =
                                                        buttonThicknessRecord
                                                            .id;
                                                    FFAppState().productPrice =
                                                        thicknessListItem
                                                            .sellingPrice;
                                                    FFAppState()
                                                        .productMRPPrice =
                                                        thicknessListItem
                                                            .mrpPrice;
                                                  });
                                                  await queryCategoryRecordOnce(
                                                    queryBuilder:
                                                        (categoryRecord) =>
                                                        categoryRecord
                                                            .where(
                                                          'categoryId',
                                                          isEqualTo: widget
                                                              .categorydoc
                                                              ?.categoryId,
                                                        ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                },
                                                text:
                                                buttonThicknessRecord!.name,
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                                  iconPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0.0, 0.0,
                                                      0.0, 0.0),
                                                  color: FFAppState()
                                                      .thickness ==
                                                      thicknessListItem.id
                                                      ? FlutterFlowTheme.of(
                                                      context)
                                                      .secondary
                                                      : FlutterFlowTheme.of(
                                                      context)
                                                      .secondaryBackground,
                                                  textStyle:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .titleSmall
                                                      .override(
                                                    fontFamily:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .titleSmallFamily,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                        .containsKey(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .titleSmallFamily),
                                                  ),
                                                  elevation: 0.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      8.0),
                                                  hoverBorderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .secondary,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Text(
                                '₹ ${FFAppState().productPrice.toString()}',
                                style: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displayMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondary,
                                  fontSize: 30.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .displayMediumFamily),
                                ),
                              ),
                            ),
                            Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                Text(
                                  '₹ ${FFAppState().productMRPPrice.toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .displayMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .accent3,
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                        FlutterFlowTheme.of(context)
                                            .displayMediumFamily),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 90.0,
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      color:
                                      FlutterFlowTheme.of(context).accent3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Only ',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color:
                                  FlutterFlowTheme.of(context).success,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                              ),
                              TextSpan(
                                text: '7 Acrylics ',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                              ),
                              TextSpan(
                                text: 'left !',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color:
                                  FlutterFlowTheme.of(context).success,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey(FlutterFlowTheme.of(context)
                                  .bodyMediumFamily),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Text(
                          'Current Processing Time 4 Hours',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                            fontFamily: FlutterFlowTheme.of(context)
                                .bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .bodyMediumFamily),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if ((FFAppState().size != '') &&
                                (FFAppState().thickness != '')) {
                              _model.sizeDocOutputCopy =
                              await querySizeRecordOnce(
                                queryBuilder: (sizeRecord) => sizeRecord.where(
                                  'id',
                                  isEqualTo: FFAppState().size,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              _model.thicknessDocOutputCopy =
                              await queryThicknessRecordOnce(
                                queryBuilder: (thicknessRecord) =>
                                    thicknessRecord.where(
                                      'id',
                                      isEqualTo: FFAppState().thickness,
                                    ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              setState(() {
                                FFAppState().count = FFAppState().count +
                                    valueOrDefault<int>(
                                      FFAppState().orderList.length,
                                      1,
                                    );
                              });
                              await _captureAndDownloadScreenshot();
                              setState(() {
                                FFAppState()
                                    .addToCollagelist(_model.uploadedFileUrl7);
                              });
                              setState(() {
                                FFAppState()
                                    .addToCollagelist(_model.uploadedFileUrl8);
                              });
                              setState(() {
                                FFAppState()
                                    .addToCollagelist(_model.uploadedFileUrl9);
                              });
                              setState(() {
                                FFAppState()
                                    .addToCollagelist(_model.uploadedFileUrl10);
                              });
                              setState(() {
                                FFAppState()
                                    .addToCollagelist(_model.uploadedFileUrl11);
                              });
                              setState(() {
                                FFAppState()
                                    .addToCollagelist(_model.uploadedFileUrl12);
                              });
                              setState(() {
                                FFAppState().updateOrdersStruct(
                                      (e) => e
                                    ..imageurl = functions.imgstringToimgPath(
                                        FFAppState().editedimg)
                                    ..textString = FFAppState().textString
                                    ..shapes = FFAppState().Shape
                                    ..size = _model.sizeDocOutputCopy?.title
                                    ..thickness =
                                        _model.thicknessDocOutputCopy?.name
                                    ..price = valueOrDefault<double>(
                                      FFAppState().productPrice,
                                      599.0,
                                    )
                                    ..qty = 1.0
                                    ..collageimages =
                                    FFAppState().collagelist.toList()
                                    ..categoryName = valueOrDefault<String>(
                                      widget.categorydoc?.heading,
                                      'uv',
                                    )
                                    ..count = FFAppState().count,
                                );
                              });
                              _model.returnqtyCopy =
                              await actions.returnOrderQtyPluslist(
                                FFAppState().orders,
                              );
                              setState(() {
                                FFAppState().orders = OrdersStruct();
                                FFAppState().editedimg = '';
                              });

                              context.pushNamed('ShoppingCartnew');
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    content: const Text('Select Size & Thickness !'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }

                            setState(() {});
                          },
                          text: 'Buy Now',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                40.0, 0.0, 40.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).success,
                            textStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .headlineMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey(FlutterFlowTheme.of(context)
                                  .headlineMediumFamily),
                            ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Text(
                              'Check Estimated Delivery Date',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineSmallFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap()
                                    .containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineSmallFamily),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                25.0, 0.0, 25.0, 10.0),
                            child: Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).accent3,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _model.textController2,
                                      focusNode: _model.textFieldFocusNode2,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                          fontFamily:
                                          FlutterFlowTheme.of(context)
                                              .headlineSmallFamily,
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .accent3,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts
                                              .asMap()
                                              .containsKey(
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .headlineSmallFamily),
                                        ),
                                        hintText: 'Enter Pincode',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                          fontFamily:
                                          FlutterFlowTheme.of(context)
                                              .headlineSmallFamily,
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts
                                              .asMap()
                                              .containsKey(
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .headlineSmallFamily),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(0.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(0.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(0.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(0.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                        fontFamily:
                                        FlutterFlowTheme.of(context)
                                            .headlineSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineSmallFamily),
                                      ),
                                      validator: _model.textController2Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: 'Check',
                                    options: FFButtonOptions(
                                      height: 50.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      color:
                                      FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                        fontFamily:
                                        FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                      ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                25.0, 0.0, 25.0, 20.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).accent3,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 7.0, 0.0),
                                            child: Icon(
                                              Icons.local_shipping,
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                          Text(
                                            'Free \nShipping',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                              fontFamily:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .labelLargeFamily,
                                              color: FlutterFlowTheme.of(
                                                  context)
                                                  .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                  .asMap()
                                                  .containsKey(
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .labelLargeFamily),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 7.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.award,
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                          Text(
                                            '30 day \nMoney Back \nGuaranty ',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                              fontFamily:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .labelLargeFamily,
                                              color: FlutterFlowTheme.of(
                                                  context)
                                                  .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                  .asMap()
                                                  .containsKey(
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .labelLargeFamily),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 7.0, 0.0),
                                            child: Icon(
                                              Icons.security_sharp,
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                          Text(
                                            '100% Secure \nPayment',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                              fontFamily:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .labelLargeFamily,
                                              color: FlutterFlowTheme.of(
                                                  context)
                                                  .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                  .asMap()
                                                  .containsKey(
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .labelLargeFamily),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Description',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineLargeFamily,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                        FlutterFlowTheme.of(context)
                                            .headlineLargeFamily),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 35.0),
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 15.0),
                                    child: Text(
                                      'Perfect home décor gift.',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                        fontFamily:
                                        FlutterFlowTheme.of(context)
                                            .titleLargeFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleLargeFamily),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 7.0),
                                    child: Text(
                                      'Why UVPIXEL Acrylic Photo?',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                        fontFamily:
                                        FlutterFlowTheme.of(context)
                                            .headlineMediumFamily,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineMediumFamily),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '- Instant processing from pune\n\n- Our pixel-perfect direct printing on acrylic, ensures that every detail of your image is faithfully reproduced with stunning accuracy and clarity. \n\n- HD print and high resolution\n\n- Before printing on acrylic, we subject the surface to a meticulous chemical treatment process. This treatment is crucial for ensuring optimal adhesion of the ink and achieving vibrant, long-lasting prints.\n\n- Yes, you heard it right! We offer same-day processing of orders to ensure you receive your personalized products with lightning speed.\n\n- Experience the convenience of fast and reliable processing from our pune facilities, ensuring that you receive your custom creations without delay.',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                      fontFamily:
                                      FlutterFlowTheme.of(context)
                                          .titleLargeFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .titleLargeFamily),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 5.0),
                            child: FlutterFlowVideoPlayer(
                              path: 'assets/videos/Sequence_03.mp4',
                              videoType: VideoType.asset,
                              autoPlay: true,
                              looping: true,
                              showControls: false,
                              allowFullScreen: true,
                              allowPlaybackSpeedMenu: false,
                              lazyLoad: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 40.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Perfect home décor gift.',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineSmallFamily,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                        FlutterFlowTheme.of(context)
                                            .headlineSmallFamily),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 25.0),
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '- Easy to install\n\nThat quick mounting option with industrial level two-sided tapes sounds incredibly convenient! It eliminates the need for nails or hammers, making the installation process hassle-free and suitable for various surfaces without causing damage.\n\n- Providing a sleek and professional appearance once installed. This convenient mounting solution not only saves time but also preserves the integrity of your walls, making it ideal for both residential and commercial spaces where ease of installation and aesthetic appeal are paramount.\n\n----- You can customize your acrylic photo prints online with us in a range of sizes, providing you with options to suit your preferences and space requirements. Here are the available size options for you to choose from in inches:\n12x9 inches\n11x11 inches\n16x12 inches\n18x12 inches\n16x16 inches\n21x15 inches\n30x20 inches\n35x23 inches\n\nThese size options offer versatility and flexibility to accommodate various display needs, whether you\'re looking for a small accent piece or a statement artwork for your wall.\n\n- Auto orientation for acrylic prints is a great feature! It ensures that your photos are displayed in the best possible orientation to maximize print quality and visual impact.\n\n- It ensures that your acrylic picture is tailored precisely to fit the proportions of your image, whether it\'s vertical or horizontal, resulting in a perfectly customized print every time. Additionally, offering two thickness options of 3 mm, 5mm and 8 mm provides further flexibility for customers to choose the look and feel that best complements their space and personal preferences.',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                      fontFamily:
                                      FlutterFlowTheme.of(context)
                                          .titleLargeFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .titleLargeFamily),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 35.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/chart.jpg',
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 35.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/chart_2.jpg',
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      wrapWithModel(
                        model: _model.footerMobileModel,
                        updateCallback: () => setState(() {}),
                        child: const FooterMobileWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            wrapWithModel(
              model: _model.headerModel,
              updateCallback: () => setState(() {}),
              child: const HeaderWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
