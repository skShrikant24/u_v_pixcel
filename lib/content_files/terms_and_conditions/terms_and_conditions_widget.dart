import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_page/drawer/drawer_widget.dart';
import '/user_page/header/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'terms_and_conditions_model.dart';
export 'terms_and_conditions_model.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  late TermsAndConditionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsAndConditionsModel());

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
                            '<p><strong><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 24px;\">Terms and Conditions</span></strong></p>\n<p><span style=\"font-family: Arial, Helvetica, sans-serif;\"><br></span></p>\n<p><span style=\"font-family: Arial, Helvetica, sans-serif;\">Welcome to our website. By accessing or using this site and/or purchasing any products or services from us, you agree to be bound by the following terms and conditions (&quot;Terms of Service&quot;). These Terms of Service apply to all users of the site, including browsers, sellers, clients, retailers, and subscribers of articles.</span></p>\n<p><span style=\"font-family: Arial, Helvetica, sans-serif;\">Please read these Terms of Service carefully before accessing or using our website. If you do not agree to all the terms and conditions of this agreement, then you may not access the website or use any services.</span></p>\n<p><span style=\"font-family: arial, helvetica, sans-serif;\">1. Amendments to Terms of Service</span></p>\n<p><span style=\"font-family: arial, helvetica, sans-serif;\">We reserve the right to update, change, or replace any part of these Terms of Service by posting updates and changes to our website. Your continued use of or access to the website following the posting of any changes constitutes acceptance of those changes.</span></p>\n<p><span style=\"font-family: arial, helvetica, sans-serif;\">2. Online E-Commerce Platform</span><br /><span style=\"font-family: arial, helvetica, sans-serif;\">Our website provides an online e-commerce platform that allows us to sell products and services to you. By agreeing to these Terms of Service, you represent that you are at least the age of majority in your state or province of residence, or that you are the age of majority in your state or province of residence and you have given us your consent to allow any of your minor dependents to use this site</span></p>\n<p><span style=\"font-family: arial, helvetica, sans-serif;\">3. Photo Upload Policy for Personalization</span><br /><span style=\"font-family: arial, helvetica, sans-serif;\">At our website, we offer personalized products that allow customers to upload their own photos for customization. However, we strictly prohibit the use of copyrighted photos without proper authorization. While we do not have an automated method to detect copyrighted material, it is the responsibility of the customer to ensure that they have the right to use any photo they upload.</span></p>\n<p><span style=\"font-family: arial, helvetica, sans-serif;\">If copyrighted photos are uploaded without authorization, we will not proceed with printing the product, and no refund will be issued for the order. Additionally, customers must ensure they have obtained consent from any individuals depicted in the photos they upload.</span><br /><span style=\"font-family: arial, helvetica, sans-serif;\">&nbsp; &nbsp;We do not allow the printing of celebrity photos, whether they are Indian or international, unless the customer provides proof of ownership or consent from the person depicted. We make every effort to identify and avoid printing such photos.</span><br /><span style=\"font-family: arial, helvetica, sans-serif;\">&nbsp; &nbsp;By uploading a photo for personalization, you confirm that you have the legal right to use the image and that it does not violate any copyright or other intellectual property rights.</span><br /><span style=\"font-family: arial, helvetica, sans-serif;\">Thank you for your cooperation and understanding.</span></p>\n<p><span style=\"font-family: arial, helvetica, sans-serif;\">4. Disclaimer of Warranties; Limitation of Liability</span><br /><span style=\"font-family: arial, helvetica, sans-serif;\">We do not guarantee, represent, or warrant that your use of our service will be uninterrupted, timely, secure, or error-free. We do not warrant that the results that may be obtained from the use of the service will be accurate or reliable. You agree that from time to time we may remove the service for indefinite periods of time or cancel the service at any time, without notice to you.</span></p>\n<p><span style=\"font-family: arial, helvetica, sans-serif;\">5. Changes to Services and Prices</span><br /><span style=\"font-family: arial, helvetica, sans-serif;\">Prices for our products are subject to change without notice. We reserve the right at any time to modify or discontinue the Service (or any part or content thereof) without notice at any time.</span></p>\n<p><span style=\"font-family: arial, helvetica, sans-serif;\">6. Accuracy of Information</span><br /><span style=\"font-family: arial, helvetica, sans-serif;\">We are not responsible if information made available on this site is not accurate, complete, or current. The material on this site is provided for general information only and should not be relied upon or used as the sole basis for making decisions without consulting primary, more accurate, more complete, or more timely sources of information. Any reliance on the material on this site is at your own risk.</span></p>\n<p><span style=\"font-family: arial, helvetica, sans-serif;\">7. Modifications to the Service</span><br /><span style=\"font-family: arial, helvetica, sans-serif;\">We reserve the right to modify or discontinue the Service (or any part or content thereof) without notice at any time.</span></p>\n<p><br /><span style=\"font-family: arial, helvetica, sans-serif;\">8. Governing Law</span><br /><span style=\"font-family: arial, helvetica, sans-serif;\">These Terms of Service and any separate agreements whereby we provide you Services shall be governed by and construed in accordance with the laws of [Your Country/State].</span></p>\n<p><span style=\"font-family: arial, helvetica, sans-serif;\">10. Contact Information</span><br /><span style=\"font-family: arial, helvetica, sans-serif;\">Questions about the Terms of Service should be sent to us at sumangraphics111@gmail.com.</span></p>',
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
