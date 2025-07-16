import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'web_navbar_model.dart';
export 'web_navbar_model.dart';

class WebNavbarWidget extends StatefulWidget {
  const WebNavbarWidget({
    super.key,
    required this.webNavSelected,
  });

  final int? webNavSelected;

  @override
  State<WebNavbarWidget> createState() => _WebNavbarWidgetState();
}

class _WebNavbarWidgetState extends State<WebNavbarWidget> {
  late WebNavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebNavbarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
      ),
      child: SafeArea(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: 270.0,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(0.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: AutoSizeText(
                          'Anvatrix',
                          minFontSize: 40.0,
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                font: GoogleFonts.notoSerif(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              '',
                              width: 44.0,
                              height: 44.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFAppState().CurentUserLogin.displayName,
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.notoSerif(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  currentPhoneNumber,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.notoSerif(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 12.0,
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 0.0, 0.0),
                          child: Text(
                            'Platform Navigation',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.notoSerif(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  AdminDashboardWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                width: double.infinity,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  color: () {
                                    if (_model.mouseRegionHovered1) {
                                      return Color(0xFF003153);
                                    } else if (widget.webNavSelected == 1) {
                                      return FlutterFlowTheme.of(context)
                                          .secondaryBackground;
                                    } else {
                                      return Color(0xFF778899);
                                    }
                                  }(),
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.space_dashboard,
                                        color: () {
                                          if (_model.mouseRegionHovered1) {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          } else if (widget.webNavSelected ==
                                              1) {
                                            return FlutterFlowTheme.of(context)
                                                .primaryText;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          }
                                        }(),
                                        size: 24.0,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Dashboard',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.notoSerif(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: () {
                                                    if (_model
                                                        .mouseRegionHovered1) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else if (widget
                                                            .webNavSelected ==
                                                        1) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primaryText;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    }
                                                  }(),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered1 = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered1 = false);
                          }),
                        ),
                        if (FFAppState().CurentUserLogin.userRole ==
                            Roles.Admin.name)
                          MouseRegion(
                            opaque: false,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    AdminCompaniesWidget.routeName,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.easeInOut,
                                  width: double.infinity,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if (_model.mouseRegionHovered2) {
                                        return Color(0xFF003153);
                                      } else if (widget.webNavSelected == 2) {
                                        return FlutterFlowTheme.of(context)
                                            .secondaryBackground;
                                      } else {
                                        return Color(0xFF778899);
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(12.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.business_rounded,
                                          color: () {
                                            if (_model.mouseRegionHovered2) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryBackground;
                                            } else if (widget.webNavSelected ==
                                                2) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primaryText;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryBackground;
                                            }
                                          }(),
                                          size: 24.0,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Company',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.notoSerif(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: () {
                                                      if (_model
                                                          .mouseRegionHovered2) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      } else if (widget
                                                              .webNavSelected ==
                                                          2) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primaryText;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      }
                                                    }(),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionHovered2 = true);
                            }),
                            onExit: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionHovered2 = false);
                            }),
                          ),
                        if (FFAppState().CurentUserLogin.userRole !=
                            Roles.User.name)
                          MouseRegion(
                            opaque: false,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    AdminBranchWidget.routeName,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.easeInOut,
                                  width: double.infinity,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if (_model.mouseRegionHovered3) {
                                        return Color(0xFF003153);
                                      } else if (widget.webNavSelected == 3) {
                                        return FlutterFlowTheme.of(context)
                                            .secondaryBackground;
                                      } else {
                                        return Color(0xFF778899);
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(12.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add_business,
                                          color: () {
                                            if (_model.mouseRegionHovered3) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryBackground;
                                            } else if (widget.webNavSelected ==
                                                3) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primaryText;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryBackground;
                                            }
                                          }(),
                                          size: 24.0,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Branch',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.notoSerif(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: () {
                                                      if (_model
                                                          .mouseRegionHovered3) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      } else if (widget
                                                              .webNavSelected ==
                                                          3) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primaryText;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      }
                                                    }(),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionHovered3 = true);
                            }),
                            onExit: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionHovered3 = false);
                            }),
                          ),
                        if (FFAppState().CurentUserLogin.userRole !=
                            Roles.User.name)
                          MouseRegion(
                            opaque: false,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    AdminDepartmentWidget.routeName,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.easeInOut,
                                  width: double.infinity,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if (_model.mouseRegionHovered4) {
                                        return Color(0xFF003153);
                                      } else if (widget.webNavSelected == 4) {
                                        return FlutterFlowTheme.of(context)
                                            .secondaryBackground;
                                      } else {
                                        return Color(0xFF778899);
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(12.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.desk_rounded,
                                          color: () {
                                            if (_model.mouseRegionHovered4) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryBackground;
                                            } else if (widget.webNavSelected ==
                                                4) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primaryText;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryBackground;
                                            }
                                          }(),
                                          size: 24.0,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'departments',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.notoSerif(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: () {
                                                      if (_model
                                                          .mouseRegionHovered4) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      } else if (widget
                                                              .webNavSelected ==
                                                          4) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primaryText;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      }
                                                    }(),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionHovered4 = true);
                            }),
                            onExit: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionHovered4 = false);
                            }),
                          ),
                        if (FFAppState().CurentUserLogin.userRole !=
                            Roles.User.name)
                          MouseRegion(
                            opaque: false,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    AdminDesignationWidget.routeName,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.easeInOut,
                                  width: double.infinity,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if (_model.mouseRegionHovered5) {
                                        return Color(0xFF003153);
                                      } else if (widget.webNavSelected == 5) {
                                        return FlutterFlowTheme.of(context)
                                            .secondaryBackground;
                                      } else {
                                        return Color(0xFF778899);
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(12.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.label_sharp,
                                          color: () {
                                            if (_model.mouseRegionHovered5) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryBackground;
                                            } else if (widget.webNavSelected ==
                                                5) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primaryText;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryBackground;
                                            }
                                          }(),
                                          size: 24.0,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'designation',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.notoSerif(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: () {
                                                      if (_model
                                                          .mouseRegionHovered5) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      } else if (widget
                                                              .webNavSelected ==
                                                          5) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primaryText;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      }
                                                    }(),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionHovered5 = true);
                            }),
                            onExit: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionHovered5 = false);
                            }),
                          ),
                        if (FFAppState().CurentUserLogin.userRole !=
                            Roles.User.name)
                          MouseRegion(
                            opaque: false,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    AdminMyTeamWidget.routeName,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.easeInOut,
                                  width: double.infinity,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if (_model.mouseRegionHovered6) {
                                        return Color(0xFF003153);
                                      } else if (widget.webNavSelected == 6) {
                                        return FlutterFlowTheme.of(context)
                                            .secondaryBackground;
                                      } else {
                                        return Color(0xFF778899);
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(12.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.people_rounded,
                                          color: () {
                                            if (_model.mouseRegionHovered6) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryBackground;
                                            } else if (widget.webNavSelected ==
                                                6) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primaryText;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryBackground;
                                            }
                                          }(),
                                          size: 24.0,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'My Team',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.notoSerif(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: () {
                                                      if (_model
                                                          .mouseRegionHovered6) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      } else if (widget
                                                              .webNavSelected ==
                                                          6) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primaryText;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      }
                                                    }(),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionHovered6 = true);
                            }),
                            onExit: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionHovered6 = false);
                            }),
                          ),
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(AdminTaskWidget.routeName);
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                width: double.infinity,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  color: () {
                                    if (_model.mouseRegionHovered7) {
                                      return Color(0xFF003153);
                                    } else if (widget.webNavSelected == 7) {
                                      return FlutterFlowTheme.of(context)
                                          .secondaryBackground;
                                    } else {
                                      return Color(0xFF778899);
                                    }
                                  }(),
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.work,
                                        color: () {
                                          if (_model.mouseRegionHovered7) {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          } else if (widget.webNavSelected ==
                                              7) {
                                            return FlutterFlowTheme.of(context)
                                                .primaryText;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          }
                                        }(),
                                        size: 24.0,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Task',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.notoSerif(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: () {
                                                    if (_model
                                                        .mouseRegionHovered7) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else if (widget
                                                            .webNavSelected ==
                                                        7) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primaryText;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    }
                                                  }(),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered7 = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered7 = false);
                          }),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Settings',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Anwatrix_Font',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              width: double.infinity,
                              height: 44.0,
                              decoration: BoxDecoration(
                                color: () {
                                  if (_model.mouseRegionHovered8) {
                                    return Color(0xFF003153);
                                  } else if (widget.webNavSelected == 8) {
                                    return FlutterFlowTheme.of(context)
                                        .secondaryBackground;
                                  } else {
                                    return Color(0xFF778899);
                                  }
                                }(),
                                borderRadius: BorderRadius.circular(12.0),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.notifications_rounded,
                                      color: () {
                                        if (_model.mouseRegionHovered8) {
                                          return FlutterFlowTheme.of(context)
                                              .secondaryBackground;
                                        } else if (widget.webNavSelected ==
                                            8) {
                                          return FlutterFlowTheme.of(context)
                                              .primaryText;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .secondaryBackground;
                                        }
                                      }(),
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Notifications',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.notoSerif(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: () {
                                                  if (_model
                                                      .mouseRegionHovered8) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground;
                                                  } else if (widget
                                                          .webNavSelected ==
                                                      8) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground;
                                                  }
                                                }(),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 32.0,
                                      decoration: BoxDecoration(
                                        color: () {
                                          if (_model.mouseRegionHovered8) {
                                            return Color(0xFF003153);
                                          } else if (widget.webNavSelected ==
                                              8) {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          } else {
                                            return Color(0xFF778899);
                                          }
                                        }(),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 4.0, 8.0, 4.0),
                                          child: Text(
                                            '12',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Anwatrix_Font',
                                                  color: () {
                                                    if (_model
                                                        .mouseRegionHovered8) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else if (widget
                                                            .webNavSelected ==
                                                        8) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primaryText;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    }
                                                  }(),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered8 = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered8 = false);
                          }),
                        ),
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  AdminProfileWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                width: double.infinity,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  color: () {
                                    if (_model.mouseRegionHovered9) {
                                      return Color(0xFF003153);
                                    } else if (widget.webNavSelected == 9) {
                                      return FlutterFlowTheme.of(context)
                                          .secondaryBackground;
                                    } else {
                                      return Color(0xFF778899);
                                    }
                                  }(),
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person_rounded,
                                        color: () {
                                          if (_model.mouseRegionHovered9) {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          } else if (widget.webNavSelected ==
                                              9) {
                                            return FlutterFlowTheme.of(context)
                                                .primaryText;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          }
                                        }(),
                                        size: 24.0,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'My Profile',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.notoSerif(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: () {
                                                    if (_model
                                                        .mouseRegionHovered9) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    } else if (widget
                                                            .webNavSelected ==
                                                        9) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primaryText;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground;
                                                    }
                                                  }(),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered9 = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered9 = false);
                          }),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                ),
                Divider(
                  height: 12.0,
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.menu_open_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
