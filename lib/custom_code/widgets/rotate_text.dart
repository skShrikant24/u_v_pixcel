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

import 'package:google_fonts/google_fonts.dart';

class RotateText extends StatefulWidget {
  const RotateText({
    super.key,
    this.width,
    this.height,
    required this.text,
  });

  final double? width;
  final double? height;
  final String text;

  @override
  State<RotateText> createState() => _RotateTextState();
}

class _RotateTextState extends State<RotateText> {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3, // Rotate by 90 degrees clockwise
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.text,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: FlutterFlowTheme.of(context).accent1,
                      fontSize: 11,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
