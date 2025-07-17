import '/backend/schema/enums/enums.dart';
import '/component/my_a_i_agent/my_a_i_agent_widget.dart';
import '/component/web_navbar/web_navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'admin_task_model.dart';
export 'admin_task_model.dart';

class AdminTaskWidget extends StatefulWidget {
  const AdminTaskWidget({super.key});

  static String routeName = 'Admin_Task';
  static String routePath = '/Task/Management';

  @override
  State<AdminTaskWidget> createState() => _AdminTaskWidgetState();
}

class _AdminTaskWidgetState extends State<AdminTaskWidget> {
  late AdminTaskModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminTaskModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        floatingActionButton: Builder(
          builder: (context) => Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 16.0),
            child: FloatingActionButton(
              onPressed: () async {
                if (FFAppState().CurentUserLogin.userRole != Roles.User.name) {
                  await showAlignedDialog(
                    barrierColor: Colors.transparent,
                    context: context,
                    isGlobal: false,
                    avoidOverflow: true,
                    targetAnchor: AlignmentDirectional(-1.0, 0.0)
                        .resolve(Directionality.of(context)),
                    followerAnchor: AlignmentDirectional(0.0, 0.0)
                        .resolve(Directionality.of(context)),
                    builder: (dialogContext) {
                      return Material(
                        color: Colors.transparent,
                        child: GestureDetector(
                          onTap: () {
                            FocusScope.of(dialogContext).unfocus();
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: MyAIAgentWidget(),
                        ),
                      );
                    },
                  );

                  return;
                } else {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Access Denied'),
                        content: Text(
                            'You don’t have permission. Please contact support.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }
              },
              backgroundColor: FlutterFlowTheme.of(context).primary,
              elevation: 8.0,
              child: Icon(
                Icons.chat_rounded,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.webNavbarModel,
                updateCallback: () => safeSetState(() {}),
                child: WebNavbarWidget(
                  webNavSelected: 7,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
