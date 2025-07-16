import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'loding_page_model.dart';
export 'loding_page_model.dart';

/// Create a page Loding Page
class LodingPageWidget extends StatefulWidget {
  const LodingPageWidget({super.key});

  static String routeName = 'Loding_Page';
  static String routePath = '/lodingPage';

  @override
  State<LodingPageWidget> createState() => _LodingPageWidgetState();
}

class _LodingPageWidgetState extends State<LodingPageWidget>
    with TickerProviderStateMixin {
  late LodingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LodingPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userQuery = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.where(
          'phone_number',
          isEqualTo: FFAppState().CurentUserLogin.phoneNumber,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.companyQuery = await queryCompaniesRecordOnce(
        queryBuilder: (companiesRecord) => companiesRecord.where(
          'company_doc',
          isEqualTo: _model.userQuery?.companyDoc,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      FFAppState().CurentUserLogin = LoginUserStruct(
        businessName: _model.companyQuery?.businessName,
        displayName: _model.userQuery?.displayName,
        phoneNumber: FFAppState().CurentUserLogin.phoneNumber,
        photoUrl: _model.userQuery?.photoUrl,
        userRole: _model.userQuery?.userRole,
        employeeStatus: _model.userQuery?.userStatus,
        loginNumber: FFAppState().CurentUserLogin.loginNumber,
        isLogin: true,
        pCNavbarOpen: true,
        companiesStatus: _model.companyQuery?.companiesStatus,
        usersDoc: _model.userQuery?.usersDoc,
        companyDoc: _model.userQuery?.companyDoc,
        gender: _model.userQuery?.gender,
      );
      safeSetState(() {});
      if (FFAppState().CurentUserLogin.userRole == 'Admin') {
        context.pushNamed(
          AdminDashboardWidget.routeName,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.leftToRight,
              duration: Duration(milliseconds: 1000),
            ),
          },
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Hello ${FFAppState().CurentUserLogin.displayName}, welcome to Anvatrix!',
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Anwatrix_Font',
                    color: FlutterFlowTheme.of(context).alternate,
                    letterSpacing: 0.0,
                  ),
              textAlign: TextAlign.center,
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).success,
          ),
        );
        return;
      } else {
        if (FFAppState().CurentUserLogin.userRole == Roles.Owner.name) {
          context.pushNamed(
            CompanyDashboardWidget.routeName,
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.leftToRight,
                duration: Duration(milliseconds: 1000),
              ),
            },
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Hello ${FFAppState().CurentUserLogin.displayName}, welcome to Anvatrix!',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Anwatrix_Font',
                      color: FlutterFlowTheme.of(context).alternate,
                      letterSpacing: 0.0,
                    ),
                textAlign: TextAlign.center,
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).success,
            ),
          );
          return;
        } else {
          if (FFAppState().CurentUserLogin.userRole == Roles.User.name) {
            context.pushNamed(
              UserDashboardWidget.routeName,
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.leftToRight,
                  duration: Duration(milliseconds: 1000),
                ),
              },
            );

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Hello ${FFAppState().CurentUserLogin.displayName}, welcome to Anvatrix!',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Anwatrix_Font',
                        color: FlutterFlowTheme.of(context).alternate,
                        letterSpacing: 0.0,
                      ),
                  textAlign: TextAlign.center,
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).success,
              ),
            );
            return;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Something went wrong.',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Anwatrix_Font',
                        color: FlutterFlowTheme.of(context).alternate,
                        letterSpacing: 0.0,
                      ),
                  textAlign: TextAlign.center,
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).error,
              ),
            );
            return;
          }
        }
      }
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
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
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation']!),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
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
          ),
        ),
      ),
    );
  }
}
