import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_page/drawer/drawer_widget.dart';
import '/user_page/header/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'refund_and_return_policy_model.dart';
export 'refund_and_return_policy_model.dart';

class RefundAndReturnPolicyWidget extends StatefulWidget {
  const RefundAndReturnPolicyWidget({super.key});

  @override
  State<RefundAndReturnPolicyWidget> createState() =>
      _RefundAndReturnPolicyWidgetState();
}

class _RefundAndReturnPolicyWidgetState
    extends State<RefundAndReturnPolicyWidget> {
  late RefundAndReturnPolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RefundAndReturnPolicyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: SizedBox(
          width: () {
            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
              return 275.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
              return 350.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
              return 350.0;
            } else {
              return 350.0;
            }
          }(),
          child: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.drawerModel,
              updateCallback: () => setState(() {}),
              child: const DrawerWidget(),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                    child: Container(
                      width: 100.0,
                      height: MediaQuery.sizeOf(context).height * 0.13,
                      decoration: const BoxDecoration(),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 30.0, 0.0),
                            child: Html(
                              data:
                                  '<p><span style=\"font-size: 18pt;\"><strong>Return and Refund Policy</strong></span></p>\n<p><br />we understand that online shopping can sometimes be disappointing if the received products do not meet your expectations. That\'s why we offer a comprehensive guarantee and refund policy to ensure your satisfaction.</p>\n<p>Quality Guarantee:<br />If your products arrive damaged or in any preceding condition, we are committed to providing you with the necessary assistance for return or exchange. Our team will carefully inspect the returned merchandise to ensure its quality and take responsibility for any defects or issues.</p>\n<p>Exchange/Refund Process:<br />Upon verification of the returned merchandise and confirmation of its quality and original packaging, we will process the exchange or refund accordingly. Please ensure to read the product information carefully before confirming your order to avoid any misunderstandings.</p>\n<p>Quality Check Procedure:<br />We prioritize delivering only the highest quality products to our customers. Each item undergoes a thorough quality check procedure to ensure its condition meets our standards. However, please note that certain art products, particularly handmade paintings, may exhibit slight variations in finish due to the nature of their creation.</p>\n<p>Return Window:<br />If, despite our efforts, you are still not satisfied with your purchase, you may initiate a return within 7 days of delivery. Please contact us via email with all the necessary details within this timeframe. We will arrange for the pickup of the item. Please note that a deduction of 15% of the order value will be applied for return shipping costs in the event of a refund.</p>\n<p>This Refund Policy (&ldquo;Policy&rdquo;) applies to all purchases of personalized products made from <strong>SUMAN GRAPHICS</strong> by consumers within the jurisdiction of India. This Policy outlines the terms and conditions under which consumers may be eligible for a refund for personalized products purchased from the Company</p>\n<p>Return Received and Inspected: Once the returned item is received, it undergoes inspection to ensure it meets the return criteria (e.g., unused, undamaged).</p>\n<p>Notification: You will receive an email confirming the receipt of your returned item.</p>\n<p>Approval or Rejection: You will be informed whether your refund request has been approved or rejected based on the condition of the returned item.</p>\n<p>Refund Processing: If your refund is approved, the refund amount will be processed. This usually involves crediting the amount back to the original method of payment (e.g., credit card).</p>\n<p>Timeline: The refund process typically takes 7-15 working days to complete. This duration may vary depending on factors such as the policies of the company and the processing time of financial institutions</p>',
                              onLinkTap: (url, _, __, ___) => launchURL(url!),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            wrapWithModel(
              model: _model.headerModel,
              updateCallback: () => setState(() {}),
              child: const HeaderWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
