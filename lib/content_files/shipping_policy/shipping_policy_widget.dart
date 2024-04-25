import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_page/drawer/drawer_widget.dart';
import '/user_page/header/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'shipping_policy_model.dart';
export 'shipping_policy_model.dart';

class ShippingPolicyWidget extends StatefulWidget {
  const ShippingPolicyWidget({super.key});

  @override
  State<ShippingPolicyWidget> createState() => _ShippingPolicyWidgetState();
}

class _ShippingPolicyWidgetState extends State<ShippingPolicyWidget> {
  late ShippingPolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShippingPolicyModel());

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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: 100.0,
                        height: MediaQuery.sizeOf(context).height * 0.13,
                        decoration: const BoxDecoration(),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                      child: Html(
                        data:
                            '<p><span style=\"font-size: 18pt;\"><strong>Shipping Policy</strong></span></p>\n<p><br></p><p><span style=\"color: rgb(29, 28, 29);\">Thank you for choosing uvpixel for your personalized items. We want to ensure a smooth and timely delivery of your order. Please review our shipping policy below for important information regarding shipping methods, processing times, and delivery estimates.Processing Time:Customization: Our personalized gifts require a certain amount of time for customization. The processing time for each item usually takes 3-7 days. Please note that this processing time is in addition to the shipping time.</span></p><p><span style=\"color: rgb(29, 28, 29);\">Shipping Methods:We offer various shipping methods to accommodate different delivery needs. The available shipping methods and associated costs will be displayed during the checkout process.</span></p><p><span style=\"color: rgb(29, 28, 29);\">Shipping Courier: This is our default shipping method, which typically takes 2-7 days to deliver your order within.</span></p><p><br></p><p><span style=\"color: rgb(29, 28, 29);\">DTDC courier&nbsp;usually deliver in 2-7 days.Tracking Information:Please do contact us with order id after 5 working days we will provide with tracking number.</span></p><p><span style=\"color: rgb(29, 28, 29);\">If you have any questions or need further assistance regarding our shipping policy, please contact our customer service team, and we will be happy to assist you.Thank you for choosing UVPIXEL for your personalized gifts.UVPIXEL</span></p><p><br></p><p><span style=\"color: rgb(29, 28, 29);\">WhatsApp</span></p><p><span style=\"color: rgb(29, 28, 29);\">+91 96897 29777</span></p>',
                        onLinkTap: (url, _, __, ___) => launchURL(url!),
                      ),
                    ),
                  ],
                ),
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
