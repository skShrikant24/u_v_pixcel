// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:js';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/rendering.dart';

import '../actions/capture_and_download_screenshot.dart';
import '../widgets/uimage.dart';

final GlobalKey globalKey = GlobalKey();
Future<void> captureAndDownloadScreenshot() async {
  try {
    // Create a RenderRepaintBoundary and wait for it to be ready

    await Future.delayed(Duration(milliseconds: 100));
    // Create a RenderRepaintBoundary and wait for it to be ready
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image =
        await boundary.toImage(pixelRatio: ui.window.devicePixelRatio);

    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    //String base64Image = base64Encode(pngBytes);

    // Create a data URI for the image
    // String dataUri = 'data:image/png;base64,$base64Image';

    // Now you have the base64 representation of the image and can use it wherever you need
    //  print('Base64 Image: $dataUri');
    // Upload the screenshot to Firebase Storage
    final Reference ref = FirebaseStorage.instance
        .ref()
        .child('screenshots')
        .child('screenshot.png');
    final UploadTask uploadTask = ref.putData(pngBytes);

    // Await the completion of the upload task
    await uploadTask.whenComplete(() => null);

    // Get the download URL for the uploaded file
    String downloadURL = await ref.getDownloadURL();
    FFAppState().editedimg = downloadURL;
    await uploadTask.whenComplete(() {
      // Show success dialog
    });
    // Print or use the download URL as needed
    print('File uploaded to Firebase Storage: $downloadURL');
  } catch (e) {
    print('Error capturing or uploading screenshot4: $e');
  }
}
