import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'mounting_options_model.dart';
export 'mounting_options_model.dart';

class MountingOptionsWidget extends StatefulWidget {
  const MountingOptionsWidget({super.key});

  @override
  State<MountingOptionsWidget> createState() => _MountingOptionsWidgetState();
}

class _MountingOptionsWidgetState extends State<MountingOptionsWidget> {
  late MountingOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MountingOptionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        'assets/images/chart_2.jpg',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
