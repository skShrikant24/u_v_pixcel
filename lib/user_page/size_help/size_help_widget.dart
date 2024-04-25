import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'size_help_model.dart';
export 'size_help_model.dart';

class SizeHelpWidget extends StatefulWidget {
  const SizeHelpWidget({super.key});

  @override
  State<SizeHelpWidget> createState() => _SizeHelpWidgetState();
}

class _SizeHelpWidgetState extends State<SizeHelpWidget> {
  late SizeHelpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SizeHelpModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'assets/images/chart.jpg',
          width: 350.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
