import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_page/drawer/drawer_widget.dart';
import '/user_page/header/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'privacy_policy_model.dart';
export 'privacy_policy_model.dart';

class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget({super.key});

  @override
  State<PrivacyPolicyWidget> createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  late PrivacyPolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPolicyModel());

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
                            '<p><span style=\"font-size: 18pt;\"><strong>Privacy Policy</strong></span></p>\n<p>Welcome to uvpixel.com! These terms and conditions apply to all visitors of uvpixel.com. Please read these terms and conditions carefully before using our website.</p>\n<p>By accessing or using uvpixel.com, you agree to be bound by these terms and conditions. If you do not agree with any part of these terms and conditions, you may not access or use uvpixel.com.</p>\n<p><br />At uvpixel.com we are committed to protecting your privacy and ensuring the security of your personal information. We understand the importance of safeguarding your data and take all necessary measures to ensure its confidentiality.</p>\n<p>Collection of Personal Information:<br />We do not share your personal data with anyone. Your privacy is of utmost importance to us, and we respect it accordingly.<br />Security of Information:</p>\n<p>Your information is protected with the utmost care. We utilize industry-standard security measures to safeguard your personal data against unauthorized access, alteration, disclosure, or destruction.</p>\n<p>Payment Security:</p>\n<p>Rest assured that uvpixel does not have access to any of your bank details or credit card numbers. This ensures that your payment information remains extremely secure during transactions.</p>\n<p>Delivery &nbsp; - Our goods are delivered worldwide by DTDC The are the world\'s largest logistics company. We cannot accept any responsibility for the service they provide. You must notify us within 10 working days if your goods do not arrive within the delivery deadlines.</p>\n<p>Prices -<br />At uvpixel.com, we strive to maintain fair and competitive pricing for all our products. However, in cases of hyperinflation or unforeseen economic circumstances, we reserve the right to adjust our prices accordingly.</p>\n<p>Please Read Carefully<br />uvpixel ( \"uvpixel.com\", \"uvpixel\", \"we\", \"us\", or \"our\") value the private nature of your personal information. To inform you about how we use the information we have collected from you, and how it is used, we have created the \"Privacy policy\".</p>',
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
