import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'no_data_found_model.dart';
export 'no_data_found_model.dart';

class NoDataFoundWidget extends StatefulWidget {
  const NoDataFoundWidget({super.key});

  @override
  State<NoDataFoundWidget> createState() => _NoDataFoundWidgetState();
}

class _NoDataFoundWidgetState extends State<NoDataFoundWidget> {
  late NoDataFoundModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoDataFoundModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: Lottie.asset(
                    'assets/jsons/NoData.json',
                    width: 450.0,
                    height: 450.0,
                    fit: BoxFit.contain,
                    animate: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
