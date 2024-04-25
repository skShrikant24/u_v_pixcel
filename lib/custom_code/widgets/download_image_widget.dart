// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:image_downloader_web/image_downloader_web.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DownloadImageWidget extends StatefulWidget {
  const DownloadImageWidget({
    Key? key,
    this.width,
    this.height,
    required this.imageUrl,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String imageUrl;

  @override
  State<DownloadImageWidget> createState() => _DownloadImageWidgetState();
}

class _DownloadImageWidgetState extends State<DownloadImageWidget> {
  Future<void> _downloadImage() async {
    final response = await http.get(Uri.parse(widget.imageUrl));
    final bytes = response.bodyBytes;
    final directory = await getExternalStorageDirectory();
    final filePath = '${directory!.path}/downloaded_image.png';
    File(filePath).writeAsBytesSync(bytes);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Image downloaded'),
      ),
    );
  }

  Future<String?> downloadAndEncodeImage(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        return 'data:image/png;base64,' + base64Encode(bytes);
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      print('Error downloading image: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final base64Image = await downloadAndEncodeImage(widget.imageUrl!);
        if (base64Image != null) {
          await WebImageDownloader.downloadImageFromWeb(
            base64Image,
            name: 'UVPIXEL',
            imageType: ImageType.png,
          );
          //print(base64Image);
        }
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        child: Icon(
          Icons.download,
          size: 30,
          color: Colors.blue,
        ),
      ),
    );
  }
}
