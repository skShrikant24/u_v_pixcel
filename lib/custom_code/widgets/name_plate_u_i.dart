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

class NamePlateUI extends StatefulWidget {
  const NamePlateUI({
    super.key,
    this.width,
    this.height,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.text5,
    this.namePlateImage,
    this.textSize,
  });

  final double? width;
  final double? height;
  final String? text1;
  final String? text2;
  final String? text3;
  final String? text4;
  final String? text5;
  final String? namePlateImage;
  final double? textSize;

  @override
  State<NamePlateUI> createState() => _NamePlateUIState();
}

class _NamePlateUIState extends State<NamePlateUI> {
  double _scaleFactor = 1.0;
  Offset _offset = Offset.zero;
  Offset _initialFocalPoint = Offset.zero;
  Offset _text1Offset = Offset.zero;
  Offset _text2Offset = Offset.zero;
  Offset _text3Offset = Offset.zero;
  Offset _text4Offset = Offset.zero;
  Offset _text5Offset = Offset.zero;

  double _textSize = 21.0; // Single font size variable

  // Add flags to identify the selected text
  bool isText1Selected = false;
  bool isText2Selected = false;
  bool isText3Selected = false;
  bool isText4Selected = false;
  bool isText5Selected = false;
  // Add flags to identify if the text is being dragged
  bool isDraggingText1 = false;
  bool isDraggingText2 = false;
  bool isDraggingText3 = false;
  bool isDraggingText4 = false;
  bool isDraggingText5 = false;

  double _textSize1 = 21.0;
  double _textSize2 = 21.0;
  double _textSize3 = 21.0;
  double _textSize4 = 21.0;
  double _textSize5 = 21.0;

  Color _textColor1 = Colors.black;
  Color _textColor2 = Colors.black;
  Color _textColor3 = Colors.black;
  Color _textColor4 = Colors.black;
  Color _textColor5 = Colors.black;

  Color _selectedColor = Colors.black;
  List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.teal,
    Colors.pink,
  ];

  void increaseFontSize() {
    if (isText1Selected) {
      setState(() {
        _textSize1 += 1.0; // Increase font size
      });
    } else if (isText2Selected) {
      setState(() {
        _textSize2 += 1.0; // Increase font size
      });
    } else if (isText3Selected) {
      setState(() {
        _textSize3 += 1.0; // Increase font size
      });
    } else if (isText4Selected) {
      setState(() {
        _textSize4 += 1.0; // Increase font size
      });
    } else if (isText5Selected) {
      setState(() {
        _textSize5 += 1.0; // Increase font size
      });
    } else {
      setState(() {
        _textSize += 1.0; // Increase font size
      });
    }
  }

  void decreaseFontSize() {
    if (isText1Selected) {
      if (_textSize1 > 1.0) {
        _textSize1 -= 1.0; // Decrease font size
      }
    } else if (isText2Selected) {
      if (_textSize2 > 1.0) {
        _textSize2 -= 1.0; // Decrease font size
      }
    } else if (isText3Selected) {
      if (_textSize3 > 1.0) {
        _textSize3 -= 1.0; // Decrease font size
      }
    } else if (isText4Selected) {
      if (_textSize4 > 1.0) {
        _textSize4 -= 1.0; // Decrease font size
      }
    } else if (isText5Selected) {
      if (_textSize5 > 1.0) {
        _textSize5 -= 1.0; // Decrease font size
      }
    } else {
      if (_textSize > 1.0) {
        _textSize -= 1.0; // Decrease font size
      }
    }
  }

  //screenshot code
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
  }
  //screenshot code

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: globalKey,
      child: Container(
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
                  child: Image.network(
                    widget.namePlateImage!,
                    width: widget.width,
                    height: widget.height,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
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
            ),
            if (widget.text1 != null)
              Positioned(
                top: _text1Offset.dy,
                left: _text1Offset.dx,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isText1Selected = true;
                      isText2Selected = false;
                      isText3Selected = false;
                      isText4Selected = false;
                      isText5Selected = false;
                    });
                  },
                  onPanStart: (details) {
                    setState(() {
                      isDraggingText1 = true;
                      isDraggingText2 = false;
                      isDraggingText3 = false;
                      isDraggingText4 = false;
                      isDraggingText5 = false;
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      isDraggingText1 = false;
                    });
                  },
                  onPanUpdate: (details) {
                    if (isDraggingText1) {
                      setState(() {
                        _text1Offset += details.delta;
                      });
                    }
                  },
                  child: Text(
                    widget.text1!,
                    style: TextStyle(
                      color: _textColor1,
                      fontSize: _textSize1, // Use text 1 font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            if (widget.text2 != null)
              Positioned(
                top: _text2Offset.dy,
                left: _text2Offset.dx,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isText2Selected = true;
                      isText1Selected = false;
                      isText3Selected = false;
                      isText4Selected = false;
                      isText5Selected = false;
                    });
                  },
                  onPanStart: (details) {
                    setState(() {
                      isDraggingText2 = true;
                      isDraggingText1 = false;
                      isDraggingText3 = false;
                      isDraggingText4 = false;
                      isDraggingText5 = false;
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      isDraggingText2 = false;
                    });
                  },
                  onPanUpdate: (details) {
                    if (isDraggingText2) {
                      setState(() {
                        _text2Offset += details.delta;
                      });
                    }
                  },
                  child: Text(
                    widget.text2!,
                    style: TextStyle(
                      color: _textColor2,
                      fontSize: _textSize2, // Use text 1 font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            if (widget.text3 != null)
              Positioned(
                top: _text3Offset.dy,
                left: _text3Offset.dx,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isText3Selected = true;
                      isText1Selected = false;
                      isText2Selected = false;
                      isText4Selected = false;
                      isText5Selected = false;
                    });
                  },
                  onPanStart: (details) {
                    setState(() {
                      isDraggingText3 = true;
                      isDraggingText1 = false;
                      isDraggingText2 = false;
                      isDraggingText4 = false;
                      isDraggingText5 = false;
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      isDraggingText3 = false;
                    });
                  },
                  onPanUpdate: (details) {
                    if (isDraggingText3) {
                      setState(() {
                        _text3Offset += details.delta;
                      });
                    }
                  },
                  child: Text(
                    widget.text3!,
                    style: TextStyle(
                      color: _textColor3,
                      fontSize: _textSize3, // Use text 1 font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            if (widget.text4 != null)
              Positioned(
                top: _text4Offset.dy,
                left: _text4Offset.dx,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isText4Selected = true;
                      isText1Selected = false;
                      isText2Selected = false;
                      isText3Selected = false;
                      isText5Selected = false;
                    });
                  },
                  onPanStart: (details) {
                    setState(() {
                      isDraggingText4 = true;
                      isDraggingText1 = false;
                      isDraggingText2 = false;
                      isDraggingText3 = false;
                      isDraggingText5 = false;
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      isDraggingText4 = false;
                    });
                  },
                  onPanUpdate: (details) {
                    if (isDraggingText4) {
                      setState(() {
                        _text4Offset += details.delta;
                      });
                    }
                  },
                  child: Text(
                    widget.text4!,
                    style: TextStyle(
                      color: _textColor4,
                      fontSize: _textSize4, // Use text 1 font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            if (widget.text5 != null)
              Positioned(
                top: _text5Offset.dy,
                left: _text5Offset.dx,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isText5Selected = true;
                      isText1Selected = false;
                      isText2Selected = false;
                      isText3Selected = false;
                      isText4Selected = false;
                    });
                  },
                  onPanStart: (details) {
                    setState(() {
                      isDraggingText5 = true;
                      isDraggingText1 = false;
                      isDraggingText2 = false;
                      isDraggingText3 = false;
                      isDraggingText4 = false;
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      isDraggingText5 = false;
                    });
                  },
                  onPanUpdate: (details) {
                    if (isDraggingText5) {
                      setState(() {
                        _text5Offset += details.delta;
                      });
                    }
                  },
                  child: Text(
                    widget.text5!,
                    style: TextStyle(
                      color: _textColor5,
                      fontSize: _textSize5, // Use text 1 font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            Positioned(
              bottom: 10.0,
              left: 10.0,
              child: ElevatedButton(
                onPressed: () {
                  increaseFontSize();
                },
                child: Icon(Icons.add),
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 100.0,
              child: ElevatedButton(
                onPressed: () {
                  decreaseFontSize();
                },
                child: Icon(Icons.remove),
              ),
            ),
            Positioned(
              bottom: 10.0,
              right: 50.0,
              child: TextButton(
                onPressed: _showColorPicker,
                child: Text('Choose Color'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick a color'),
          content: Container(
            height: 200,
            width: 100,
            child: ListView.builder(
              itemCount: _colors.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    if (isText1Selected) {
                      _textColor1 = _colors[index];
                    } else if (isText2Selected) {
                      _textColor2 = _colors[index];
                    } else if (isText3Selected) {
                      _textColor3 = _colors[index];
                    } else if (isText4Selected) {
                      _textColor4 = _colors[index];
                    } else if (isText5Selected) {
                      _textColor5 = _colors[index];
                    } else {
                      setState(() {
                        _selectedColor = _colors[index];
                      });
                    }
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 50,
                    color: _colors[index],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
