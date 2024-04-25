import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? imageurlToString(String? imagePath) {
  return imagePath;
}

String toCapitalLetter(String? value) {
  return (value!.toUpperCase());
}

String? imgstringToimgPath(String? imagelink) {
  return imagelink;
}

double? totalCalculate(
  double? finalAmt,
  double? deliveryCharges,
) {
  return finalAmt! + deliveryCharges!;
}

double returnminusAmt(double price) {
  return -price;
}

String? getWidthInInch(String size) {
  List<String> dimensions = size.split(" X ");
  if (dimensions.length == 2) {
    return dimensions[0];
  }
}

String? getHeightInInch(String size) {
  List<String> dimensions = size.split(" X ");
  if (dimensions.length == 2) {
    return dimensions[1];
  }
}

double? getWidthInCm(String size) {
  List<String> dimensions = size.split(" X ");
  if (dimensions.length == 2) {
    int width = int.tryParse(dimensions[0]) ?? 0;
    double widthInCentimeters = width * 2.54;
    return widthInCentimeters;
  }
}

String? imageToBase64new(FFUploadedFile? file) {
  if (file == null || file.bytes == null) {
    return null;
  }

  String base64String = base64Encode(file.bytes!);

  return 'data:image/jpeg;base64,$base64String';
}

double? getHeightInCm(String size) {
  List<String> dimensions = size.split(" X ");
  if (dimensions.length == 2) {
    int width = int.tryParse(dimensions[1]) ?? 0;
    double widthInCentimeters = width * 2.54;
    return widthInCentimeters;
  }
}

String getNextDate(String? daysToAdd) {
  String notFound = "Sorry We Can't Deliver to your address.";
  if (daysToAdd == "notFound" || daysToAdd == null) {
    return notFound;
  }
  int dayInInteger = int.parse(daysToAdd);
  DateTime currentDate = DateTime.now();
  DateTime nextDate = currentDate.add(Duration(days: dayInInteger));

  // Format the next date as "DD-Month-YYYY"
  String formattedNextDate = DateFormat('dd-MMMM-yyyy').format(nextDate);

  return formattedNextDate;
}

String? imageToBase64(FFUploadedFile? file) {
  if (file == null || file.bytes == null) {
    return null;
  }

  String base64String = base64Encode(file.bytes!);

  return base64String;
}

FFUploadedFile? base64ToImage(String? base64Image) {
  if (base64Image == null) {
    return null;
  }

  final bytes = base64.decode(base64Image);
  final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';

  return FFUploadedFile(bytes: bytes, name: fileName);
}

dynamic carDashboardPriceReturn(String? side) {
  // find the price and mrp price of that product from name
  if (side == 'One Side') {
    return {'price': 299, 'mrp': 499};
  } else if (side == 'Dual Side') {
    return {'price': 399, 'mrp': 599};
  } else {
    return null;
  }
}

String? videoStringToVideoPath(String? videoLink) {
  return videoLink;
}

dynamic namePlatePriceList(
  String? size,
  String? thickness,
) {
  if (size == "12 X 8" && thickness == "3 mm") {
    return {'price': 750, 'mrp': 999};
  } else if (size == "12 X 8" && thickness == "8 mm") {
    return {'price': 850, 'mrp': 1099};
  } else if (size == "12 X 18" && thickness == "3 mm") {
    return {'price': 1550, 'mrp': 1750};
  } else if (size == "12 X 18" && thickness == "8 mm") {
    return {'price': 1950, 'mrp': 2199};
  } else {
    return null;
  }
}

int? stringToInt(String? stringmobileno) {
  // convert string  mobile no to int
  if (stringmobileno == null) {
    return null;
  }
  String digits = stringmobileno.replaceAll(RegExp(r'[^\d]'), '');
  return int.tryParse(digits);
}

double? finalAmt(double? amt) {
  return amt! * 100;
}

String getToday(DateTime dateTime) {
  var day, month;
  day = dateTime.day.toString();
  month = dateTime.month.toString();

  var invNum = dateTime.year.toString() +
      "-" +
      (month.length < 2 ? "0" + month : month).toString() +
      "-" +
      (day.length < 2 ? "0" + day : day).toString();
  return invNum.toString();
}

String selectedDateFormat(DateTime date) {
  var newFormat = DateFormat("dd-MM-yyyy");
  String newDateInString = newFormat.format(date);
  return newDateInString;
}

int? dateToMilliseconds(String? date) {
  List<String> parts = date!.split('-');
  int day = int.parse(parts[0]);
  int month = int.parse(parts[1]);
  int year = int.parse(parts[2]);

  DateTime dateTime = DateTime(year, month, day);
  return dateTime.millisecondsSinceEpoch;
}
