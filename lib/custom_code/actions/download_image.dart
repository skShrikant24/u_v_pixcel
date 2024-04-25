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

import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future downloadImage(String? imageLink) async {
  // download image using link
  if (imageLink == null) {
    throw Exception('Image link is null');
  }

  try {
    var http;
    var response = await http.get(Uri.parse(imageLink));
    var bytes = response.bodyBytes;

    // Get the directory for the app's temporary files.
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    // Create a file in the temporary directory with a unique name.
    String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    File file = File('$tempPath/$fileName');

    // Write the bytes to the file.
    await file.writeAsBytes(bytes);

    return file.path;
  } catch (e) {
    throw Exception('Failed to download image: $e');
  }
}
