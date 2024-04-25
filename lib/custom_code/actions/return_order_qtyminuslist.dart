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

Future<List<OrdersStruct>> returnOrderQtyminuslist(OrdersStruct order) async {
  List<OrdersStruct> returnList = FFAppState().orderList;
  double subtotal = 0;
  // Iterate through the existing orders
  for (int j = 0; j < returnList.length; j++) {
    OrdersStruct struct = returnList[j];

    // Check if shape and size match
    if (struct.shapes == order.shapes && struct.size == order.size) {
      // Increment quantity
      if (struct.qty > 1) {
        struct.qty--;

        // Calculate total and finalAmt
        struct.total = struct.price * struct.qty;
        struct.finalAmt = struct.total;

        // Update the order in the list
        returnList[j] = struct;

        // Exit the loop since we found a match
        break;
      }
    }
  }

  // If no matching order found, add the provided order
  if (returnList.isEmpty ||
      returnList.every((struct) =>
          struct.shapes != order.shapes || struct.size != order.size)) {
    order.total = order.price * order.qty;
    order.finalAmt = order.total;
    returnList.add(order);
  }
  subtotal = 0;
  for (int j = 0; j < returnList.length; j++) {
    subtotal += returnList[j].finalAmt;
  }
  FFAppState().FinalAmt = subtotal;
  print(returnList);
  return returnList;
}
