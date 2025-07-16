import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'page_refresh_model.dart';
export 'page_refresh_model.dart';

class PageRefreshWidget extends StatefulWidget {
  const PageRefreshWidget({super.key});

  @override
  State<PageRefreshWidget> createState() => _PageRefreshWidgetState();
}

class _PageRefreshWidgetState extends State<PageRefreshWidget>
    with TickerProviderStateMixin {
  late PageRefreshModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageRefreshModel());

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.1,
            end: 1.0,
          ),
        ],
      ),
    });

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
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Professional_Logo_for_Anvatrix_(2).png',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: Lottie.asset(
                    'assets/jsons/Loading.json',
                    width: 70.0,
                    height: 70.0,
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
