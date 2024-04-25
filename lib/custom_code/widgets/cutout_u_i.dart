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

import 'dart:io';
import 'dart:convert';
import 'index.dart'; // Imports other custom widgets

class CutoutUI extends StatefulWidget {
  const CutoutUI({
    super.key,
    this.width,
    this.height,
    this.imageFile,
    this.widthMedia,
    this.heightMedia,
  });

  final double? width;
  final double? height;
  final String? imageFile;
  final double? widthMedia;
  final double? heightMedia;

  @override
  State<CutoutUI> createState() => _CutoutUIState();
}

class _CutoutUIState extends State<CutoutUI> {
  double _scaleFactor = 1.0;
  Offset _offset = Offset.zero;
  Offset _initialFocalPoint = Offset.zero;
  Offset _textOffset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.widthMedia,
      height: widget.heightMedia,
      child: Stack(
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
              child: Transform.translate(
                offset: _offset,
                child: Image.memory(
                  base64Decode(widget.imageFile!),
                  width: widget.width,
                  height: widget.height,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
