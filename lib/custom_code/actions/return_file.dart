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

import 'dart:convert';
import 'dart:typed_data';

Future<String?> returnFile(FFUploadedFile? uploadedFile) async {
  if (uploadedFile == null) {
    return null; // If uploadedFile is null, return null
  }

  // Get the bytes from the uploaded file
  Uint8List? bytes = uploadedFile.bytes;

  // Encode the bytes to base64
  String base64Image = base64Encode(bytes!);

  // Construct the data URL
  String dataUrl = 'data:image/jpeg;base64,$base64Image';
  print(dataUrl);
  return dataUrl;
}
