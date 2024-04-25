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

import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_downloader_web/image_downloader_web.dart';

class UimageCopy extends StatefulWidget {
  const UimageCopy({
    super.key,
    this.width,
    this.height,
    this.shape,
    this.imageUrl,
    this.zoomPercent,
    this.size,
    this.text,
  });

  final double? width;
  final double? height;
  final String? shape;
  final String? imageUrl;
  final double? zoomPercent;
  final String? size;
  final String? text;

  @override
  State<UimageCopy> createState() => _UimageCopyState();
}

class _UimageCopyState extends State<UimageCopy> {
  double _scaleFactor = 1.0;
  Offset _offset = Offset.zero;
  Offset _initialFocalPoint = Offset.zero;
  Offset _textOffset = Offset.zero;

  Future<String?> downloadAndEncodeImage(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        return 'data:image/png;base64,' + base64Encode(bytes);
        //  download the image by base64Image url
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
    final List<String> sizeParts = widget.size!.split('X');
    final double desiredWidth = double.parse(sizeParts[0]);
    final double desiredHeight = double.parse(sizeParts[1]);

    print(desiredWidth);
    print(desiredHeight);
    return Container(
        width: desiredWidth,
        height: desiredHeight,
        child: Stack(// by row its in row direaction
            children: [
          Stack(
            children: [
              GestureDetector(
                onScaleStart: (details) {
                  _initialFocalPoint = details.localFocalPoint - _offset;
                },
                onScaleUpdate: (details) {
                  setState(() {
                    _scaleFactor = details.scale;
                    _offset = details.localFocalPoint - _initialFocalPoint;
                  });
                },
                child: ClipRRect(
                  borderRadius: _getBorderRadius(),
                  child: Transform.scale(
                    scale: _scaleFactor * (widget.zoomPercent ?? 1.0),
                    child: Transform.translate(
                      offset: _offset,
                      child: Image.network(
                        widget.imageUrl!,
                        width: widget.width,
                        height: widget.height,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              if (widget.text != null)
                Positioned(
                  top: _textOffset.dy,
                  left: _textOffset.dx,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        _textOffset += details.delta;
                      });
                    },
                    child: Text(
                      widget.text!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ), //stack end
        ] //children array
            ) //colmun end

        ); //return container
  } // widget end

  BorderRadius _getBorderRadius() {
    switch (widget.shape) {
      case 'Circle':
        return BorderRadius.circular(widget.width! / 2);
      case 'Square':
        return BorderRadius.zero;
      case 'RoundSquare':
        return BorderRadius.circular(10.0);
      case 'capsule':
        return BorderRadius.vertical(
            top: Radius.circular(widget.width! / 2),
            bottom: Radius.circular(10.0)); // Pill-shaped
      case 'RoundCorner':
        return BorderRadius.all(Radius.circular(widget.width! / 4));
      case 'leaf': // New shape "leaf"
        return BorderRadius.only(
          topLeft: Radius.circular(200.0),
          topRight: Radius.circular(2.0),
          bottomLeft: Radius.circular(2.0),
          bottomRight: Radius.circular(200.0),
        );
      default:
        return BorderRadius.zero;
    }
  }
}
