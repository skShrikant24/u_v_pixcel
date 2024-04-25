import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dropdown_model.dart';
export 'dropdown_model.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  late DropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowDropDown<String>(
      controller: _model.dropDownValueController ??=
          FormFieldController<String>(
        _model.dropDownValue ??= valueOrDefault<String>(
          widget.parameter1,
          '0',
        ),
      ),
      options: const ['Pending', 'Dispatch', 'Delivered'],
      onChanged: (val) async {
        setState(() => _model.dropDownValue = val);
        setState(() {
          FFAppState().dropdown = _model.dropDownValue!;
        });
      },
      width: 200.0,
      height: 50.0,
      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
            letterSpacing: 0.0,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
          ),
      hintText: 'Order Staus',
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 18.0,
      ),
      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 2.0,
      borderColor: FlutterFlowTheme.of(context).accent3,
      borderWidth: 0.5,
      borderRadius: 8.0,
      margin: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      hidesUnderline: true,
      isOverButton: true,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
