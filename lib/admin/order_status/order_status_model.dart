import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_page/success_alert/success_alert_widget.dart';
import 'order_status_widget.dart' show OrderStatusWidget;
import 'package:flutter/material.dart';

class OrderStatusModel extends FlutterFlowModel<OrderStatusWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (checkStatus)] action in OrderStatus widget.
  ApiCallResponse? apiResults2w;
  // Model for SuccessAlert component.
  late SuccessAlertModel successAlertModel;

  @override
  void initState(BuildContext context) {
    successAlertModel = createModel(context, () => SuccessAlertModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    successAlertModel.dispose();
  }
}
