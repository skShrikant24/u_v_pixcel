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

import 'index.dart'; // Imports other custom widgets

import 'dart:convert';

class HangingUI extends StatefulWidget {
  const HangingUI({
    super.key,
    this.width,
    this.height,
    this.imageFile,
    this.widthMedia,
    this.heightMedia,
    this.frameImage,
  });

  final double? width;
  final double? height;
  final String? imageFile;
  final double? widthMedia;
  final double? heightMedia;
  final String? frameImage;

  @override
  State<HangingUI> createState() => _HangingUIState();
}

class _HangingUIState extends State<HangingUI> {
  double _scaleFactor = 1.0;
  Offset _offset = Offset.zero;
  Offset _initialFocalPoint = Offset.zero;

  // Offset _textOffset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
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
            child: ClipPath(
              clipper: EggHorizontalShapeClipper(),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x33000000),
                      offset: Offset(
                        0,
                        1,
                      ),
                    )
                  ],
                ),
                child: Transform.translate(
                  offset: _offset,
                  child: Image.memory(
                    base64Decode(widget.imageFile!),
                    width: widget.width,
                    height: widget.height,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ], //stack children
      ),
    );
  }
}

class EggHorizontalShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval(Rect.fromLTWH(0.0, 0.0, 400, 400));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
