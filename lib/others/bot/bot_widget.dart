import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'bot_model.dart';
export 'bot_model.dart';

class BotWidget extends StatefulWidget {
  const BotWidget({super.key});

  @override
  State<BotWidget> createState() => _BotWidgetState();
}

class _BotWidgetState extends State<BotWidget> {
  late BotModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BotModel());

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
                    'assets/jsons/Anima_Bot.json',
                    width: 150.0,
                    height: 150.0,
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
