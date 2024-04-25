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

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'dart:ui';

import 'package:screenshot/screenshot.dart';

import 'package:firebase_storage/firebase_storage.dart';

import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';

// Imports other custom widgets

import 'dart:async';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:image_downloader_web/image_downloader_web.dart';

class Uimage extends StatefulWidget {
  const Uimage({
    super.key,
    this.width,
    this.height,
    this.shape,
    this.imageUrl,
    this.zoomPercent,
    this.size,
    this.text,
    this.rotationAngle,
    this.clock,
    required this.frame,
    this.flagimg,
    this.clockdigits,
  });

  final double? width;
  final double? height;
  final String? shape;
  final String? imageUrl;
  final double? zoomPercent;
  final String? size;
  final String? text;
  final double? rotationAngle;
  final bool? clock;
  final bool frame;
  final bool? flagimg;
  final String? clockdigits;

  @override
  State<Uimage> createState() => _UimageState();
}

class _UimageState extends State<Uimage> {
  double _scaleFactor = 1.0;
  Offset _offset = Offset.zero;
  Offset _initialFocalPoint = Offset.zero;
  Offset _textOffset = Offset.zero;
  Timer? _timer;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.clock == true) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _now = DateTime.now();
        });
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Color _getFrameColor(String? shape, BuildContext context) {
    switch (shape) {
      case 'FrameBlack':
        return Color(0xFF0B0B0B);
      case 'FrameYellow':
        return Colors.yellow;
      case 'FrameRed':
        return Colors.red;
      case 'FrameWhite':
        return Colors.white;
      default:
        return Color(0xFF0B0B0B);
    }
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
        print(dataUri);
        // Upload the screenshot or perform further operations
        final Reference ref = FirebaseStorage.instance
            .ref()
            .child('screenshots')
            .child('screenshot.png');
        final UploadTask uploadTask = ref.putData(imageBytes);

        // Await the completion of the upload task
        await uploadTask.whenComplete(() => null);

        // Get the download URL for the uploaded file
        String downloadURL = await ref.getDownloadURL();
        FFAppState().editedimg = downloadURL;
        await uploadTask.whenComplete(() {
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
        });
        // Print or use the download URL as needed
        print('File uploaded to Firebase Storage: $downloadURL');
      }
    } catch (e) {
      print('Error capturing or uploading screenshots: $e');
    }
  }
  /*

  final GlobalKey globalKey = GlobalKey();

  bool visible = true;
  Future<void> _captureAndDownloadScreenshot() async {
    try {
      // Create a RenderRepaintBoundary and wait for it to be ready
      setState(() {
        visible = false; // Set visible to false when IconButton is pressed
      });
      FFAppState().flagimg = true;
      await Future.delayed(Duration(milliseconds: 100));
      // Create a RenderRepaintBoundary and wait for it to be ready
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image =
          await boundary.toImage(pixelRatio: ui.window.devicePixelRatio);

      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      String filename = 'screenshot_$timestamp.png';

      // Upload the screenshot to Firebase Storage with the unique filename
      final Reference ref =
          FirebaseStorage.instance.ref().child('screenshots').child(filename);
      final UploadTask uploadTask = ref.putData(pngBytes);

      // Await the completion of the upload task
      await uploadTask.whenComplete(() => null);

      // Get the download URL for the uploaded file
      String downloadURL = await ref.getDownloadURL();
      FFAppState().editedimg = downloadURL;
      await uploadTask.whenComplete(() {
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
      });
      // Print or use the download URL as needed
      print('File uploaded to Firebase Storage: $downloadURL');
    } catch (e) {
      print('Error capturing or uploading screenshot4: $e');
    }
  } */

  @override
  Widget build(BuildContext context) {
    final List<String> sizeParts = widget.size!.split('X');
    final double desiredWidth = double.parse(sizeParts[0]);
    final double desiredHeight = double.parse(sizeParts[1]);
    final double? _rotationAngle = widget.rotationAngle;

    return Screenshot(
      //  key: globalKey,
      controller: screenshotController, // Add RepaintBoundary key
      child: Container(
        width: desiredWidth,
        height: desiredHeight,
        decoration: widget.frame
            ? BoxDecoration(
                // color: FlutterFlowTheme.of(context).secondaryBackground,
                border: Border.all(
                  color: _getFrameColor(widget.shape, context),
                  width: 12,
                ),
              )
            : null,
        child: Stack(
          children: [
            Transform.rotate(
              angle: _rotationAngle! * (pi / 180), // Convert degrees to radians
              child: GestureDetector(
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
                  clipper: widget.shape == 'Square'
                      ? SquareShapeClipper()
                      : widget.shape == 'RoundSquare'
                          ? RoundSquareShapeClipper()
                          : widget.shape == 'RoundCorner'
                              ? RoundCornerShapeClipper()
                              : widget.shape == 'Circle'
                                  ? CircleShapeClipper()
                                  : widget.shape == 'Bean'
                                      ? BeanShapeClipper()
                                      : widget.shape == 'CutSquare'
                                          ? CutSquareShapeClipper()
                                          : widget.shape == 'leaf'
                                              ? leafShapeClipper()
                                              : widget.shape == 'OvelVertical'
                                                  ? ovelVerticalClipper()
                                                  : widget.shape ==
                                                          'BeanVertical'
                                                      ? BeanVerticalClipper()
                                                      : null,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(
                            0,
                            2,
                          ),
                        )
                      ],
                    ),
                    child: Transform.rotate(
                      angle: -_rotationAngle * (pi / 180),
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
                ),
              ),
            ),
            /* Positioned(
              bottom: 10.0,
              right: 10.0,
              child: Visibility(
                visible:
                    visible, // Set to true if you want the icon to be visible initially
                child: IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () async {
                    setState(() {
                      visible =
                          false; // Set visible to false when IconButton is pressed
                    });

                    await _captureAndDownloadScreenshot();
                  },
                ),
              ),
            ),*/
            if (widget.clock == true) ...[
              for (var i = 1; i <= 12; i++)
                IgnorePointer(
                  child: Align(
                    alignment: Alignment.center,
                    child: AnalogClock(
                      dateTime: DateTime.now(),
                      isKeepTime: true,
                      dialColor: Colors.transparent,
                      //dialBorderColor: Colors.black,
                      // dialBorderWidthFactor: 0.02,
                      markingColor: null,
                      //markingRadiusFactor: 1.0,
                      //  markingWidthFactor: 1.0,
                      hourNumberColor: Colors.white,
                      hourNumbers: const [
                        '',
                        '',
                        '',
                        '',
                        '',
                        '',
                        '',
                        '',
                        '',
                        '',
                        '',
                        ''
                      ],
                      hourNumberSizeFactor: 1.0,
                      hourNumberRadiusFactor: 1.0,
                      hourHandColor: Colors.white,
                      hourHandWidthFactor: 1.0,
                      hourHandLengthFactor: 0.8,
                      minuteHandColor: Colors.white,
                      minuteHandWidthFactor: 1.0,
                      minuteHandLengthFactor: 0.8,
                      secondHandColor: Colors.white,
                      secondHandWidthFactor: 1.0,
                      secondHandLengthFactor: 0.8,
                      centerPointColor: Colors.white,
                      centerPointWidthFactor: 1.0,
                    ),
                  ),
                ),
            ],
            if (widget.clockdigits != null) ...[
              IgnorePointer(
                child: Image.network(
                  widget.clockdigits!,
                  width: widget.width,
                  height: widget.height,
                  fit: BoxFit.contain,
                ),
              ),
            ],
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
        ),
      ),
    );
  }
}

class SquareShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRect(Rect.fromLTRB(0.0, 0.0, size.width, size.height));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CutSquareShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    path.moveTo(width * 0.1925000, height * 0.0005000);
    path.lineTo(0, height * 0.1865000);
    path.lineTo(0, height * 0.8060000);
    path.lineTo(width * 0.1905000, height);
    path.lineTo(width * 0.8110000, height);
    path.lineTo(width, height * 0.8075000);
    path.lineTo(width, height * 0.1885000);
    path.lineTo(width * 0.8095000, 0);
    path.lineTo(width * 0.1925000, height * 0.0005000);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class leafShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    path.moveTo(width * 0.2505000, height * 0.0005000);
    path.cubicTo(width * 0.1281250, height * 0.0020000, width * 0.0021250,
        height * 0.1380000, 0, height * 0.2505000);
    path.quadraticBezierTo(
        width * -0.0003750, height * 0.4538750, width * -0.0015000, height);
    path.quadraticBezierTo(
        width * 0.5418750, height, width * 0.7450000, height);
    path.cubicTo(width * 0.8727500, height * 0.9976250, width * 0.9982500,
        height * 0.8688750, width, height * 0.7505000);
    path.quadraticBezierTo(
        width * 0.9998750, height * 0.5488750, width * 1.0015000, 0);
    path.quadraticBezierTo(width * 0.8572500, height * 0.0001250,
        width * 0.2505000, height * 0.0005000);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ovelVerticalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    path.moveTo(width * 0.5006137, height * -0.0062930);
    path.cubicTo(width * 0.6813784, height * -0.0062930, width * 0.9525253,
        height * 0.1349752, width * 0.9525253, height * 0.4982364);
    path.cubicTo(width * 0.9525253, height * 0.7000481, width * 0.8169518,
        height * 1.0027657, width * 0.5006137, height * 1.0027657);
    path.cubicTo(width * 0.3198491, height * 1.0027657, width * 0.0487021,
        height * 0.8514069, width * 0.0487021, height * 0.4982364);
    path.cubicTo(width * 0.0487021, height * 0.2964246, width * 0.1842756,
        height * -0.0062930, width * 0.5006137, height * -0.0062930);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BeanVerticalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    path.moveTo(width * 0.5000000, height * 0.0025000);
    path.cubicTo(width * 0.2290000, height * 0.0022500, width * 0.1270000,
        height * 0.1282500, width * 0.1240000, height * 0.2515000);
    path.cubicTo(width * 0.1252500, height * 0.3746250, width * 0.1757500,
        height * 0.3948750, width * 0.1790000, height * 0.5000000);
    path.cubicTo(width * 0.1763750, height * 0.5985000, width * 0.1251250,
        height * 0.6275000, width * 0.1245000, height * 0.7500000);
    path.cubicTo(width * 0.1248750, height * 0.8745000, width * 0.2276250,
        height * 0.9975000, width * 0.5000000, height);
    path.cubicTo(width * 0.7330000, height * 0.9970000, width * 0.9510000,
        height * 0.7450000, width * 0.9560000, height * 0.4980000);
    path.cubicTo(width * 0.9530000, height * 0.2476250, width * 0.7370000,
        height * 0.0036250, width * 0.5000000, height * 0.0025000);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class RoundSquareShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTRB(0.0, 0.0, size.width, size.height),
        Radius.circular(20.0))); // You can adjust the radius as needed
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RoundCornerShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTRB(0.0, 0.0, size.width, size.height),
        Radius.circular(80.0))); // You can adjust the radius as needed
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

/*
class CircleShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}*/
class CircleShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    path.moveTo(width * 0.4978880, height * -0.0085980);
    path.cubicTo(width * 0.6557802, height * -0.0085980, width * 0.8926185,
        height * 0.1325500, width * 0.8926185, height * 0.4955020);
    path.cubicTo(width * 0.8926185, height * 0.6971420, width * 0.7741994,
        height * 0.9996019, width * 0.4978880, height * 0.9996019);
    path.cubicTo(width * 0.3399957, height * 0.9996019, width * 0.1031574,
        height * 0.8483719, width * 0.1031574, height * 0.4955020);
    path.cubicTo(width * 0.1031574, height * 0.2938620, width * 0.2215766,
        height * -0.0085980, width * 0.4978880, height * -0.0085980);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class EggHorizontalShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval(Rect.fromLTWH(0.0, 0.0, 485, 400));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class BeanShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;

    path.moveTo(width * 0.4993098, height * 0.0697393);
    path.cubicTo(width * 0.8912944, height * 0.0681673, width * 1.0026536,
        height * 0.4525130, width * 1.0020969, height * 0.6945957);
    path.cubicTo(width * 0.9558828, height * 1.2471417, width * 0.5939652,
        height * 0.8203530, width * 0.5004234, height * 0.8565082);
    path.cubicTo(width * 0.4102224, height * 0.8195670, width * 0.0449641,
        height * 1.2424258, width * -0.0012500, height * 0.7000976);
    path.cubicTo(width * 0.0009772, height * 0.4501550, width * 0.1112228,
        height * 0.0713113, width * 0.4993098, height * 0.0697393);

    return path;
  }

  // Add curves on top (optional, depending on your design)
  // Adjust control points to customize the curves

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

//Frames code
