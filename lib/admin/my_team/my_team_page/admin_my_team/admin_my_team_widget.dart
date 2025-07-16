import '/admin/my_team/my_team_componenet/add_employee_form/add_employee_form_widget.dart';
import '/admin/my_team/my_team_componenet/admin_add_employee_form/admin_add_employee_form_widget.dart';
import '/admin/my_team/my_team_componenet/edit_admin_add_employee_form/edit_admin_add_employee_form_widget.dart';
import '/admin/my_team/my_team_componenet/edit_employee_form/edit_employee_form_widget.dart';
import '/alrt/user_delete/user_delete_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/component/web_navbar/web_navbar_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/others/no_data_found/no_data_found_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_my_team_model.dart';
export 'admin_my_team_model.dart';

class AdminMyTeamWidget extends StatefulWidget {
  const AdminMyTeamWidget({super.key});

  static String routeName = 'Admin_MyTeam';
  static String routePath = '/Admin_MyTeam';

  @override
  State<AdminMyTeamWidget> createState() => _AdminMyTeamWidgetState();
}

class _AdminMyTeamWidgetState extends State<AdminMyTeamWidget> {
  late AdminMyTeamModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminMyTeamModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().CurentUserLogin.userRole == Roles.Admin.name) {
        _model.companyList = await queryCompaniesRecordOnce(
          queryBuilder: (companiesRecord) => companiesRecord
              .orderBy('companies_created_time', descending: true),
        );
        _model.ussrQuery = await queryUsersRecordOnce(
          queryBuilder: (usersRecord) =>
              usersRecord.orderBy('users_created_time', descending: true),
          limit: 11,
        );
        _model.ussrQueryCount = await queryUsersRecordCount(
          queryBuilder: (usersRecord) =>
              usersRecord.orderBy('users_created_time', descending: true),
        );
        _model.usersCount = _model.ussrQueryCount;
        safeSetState(() {});
        for (int loop1Index = 0;
            loop1Index <= _model.ussrQuery!.length;
            loop1Index++) {
          final currentLoop1Item = _model.ussrQuery![loop1Index];
          _model.addToUsersList(currentLoop1Item);
          _model.lastUser = _model.ussrQuery?.elementAtOrNull((int? var1) {
            return (var1 != null) ? (var1 - 1) : -1;
          }(_model.ussrQuery?.length));
          _model.adminCompanyList =
              _model.companyList!.toList().cast<CompaniesRecord>();
          safeSetState(() {});
        }
        return;
      } else {
        if (FFAppState().CurentUserLogin.userRole == Roles.Owner.name) {
          _model.ownerCompany = await queryCompaniesRecordOnce(
            queryBuilder: (companiesRecord) => companiesRecord
                .where(
                  'company_doc',
                  isEqualTo: FFAppState().CurentUserLogin.companyDoc,
                )
                .orderBy('companies_created_time', descending: true),
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          _model.ussrQueryOwner = await queryUsersRecordOnce(
            queryBuilder: (usersRecord) => usersRecord
                .where(
                  'company_doc',
                  isEqualTo: FFAppState().CurentUserLogin.companyDoc,
                )
                .orderBy('users_created_time', descending: true),
            limit: 11,
          );
          _model.ussrQueryCountOwner = await queryUsersRecordCount(
            queryBuilder: (usersRecord) =>
                usersRecord.orderBy('users_created_time', descending: true),
          );
          _model.usersCount = _model.ussrQueryCountOwner;
          safeSetState(() {});
          for (int loop2Index = 0;
              loop2Index <= _model.ussrQueryOwner!.length;
              loop2Index++) {
            final currentLoop2Item = _model.ussrQueryOwner![loop2Index];
            _model.addToUsersList(currentLoop2Item);
            _model.lastUser =
                _model.ussrQueryOwner?.elementAtOrNull((int? var1) {
              return (var1 != null) ? (var1 - 1) : -1;
            }(_model.ussrQueryOwner?.length));
            _model.ownerCompnay = _model.ownerCompany;
            safeSetState(() {});
          }
          return;
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('Access Denied'),
                content:
                    Text('You do not have permission to access this feature.'),
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
      }
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
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.webNavbarModel,
                updateCallback: () => safeSetState(() {}),
                child: WebNavbarWidget(
                  webNavSelected: 6,
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
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Employee Data',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                font: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        Text(
                                          'Created employeee List below.',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 5.0))
                                          .around(SizedBox(height: 5.0)),
                                    ),
                                    Builder(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
                                          var _shouldSetState = false;
                                          if (FFAppState()
                                                  .CurentUserLogin
                                                  .userRole ==
                                              Roles.Admin.name) {
                                            await showDialog(
                                              barrierColor: Colors.transparent,
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child:
                                                        AdminAddEmployeeFormWidget(
                                                      companyList: _model
                                                          .adminCompanyList,
                                                      dataRefresh: () async {
                                                        _model.refreshUserList =
                                                            await queryUsersRecordOnce(
                                                          queryBuilder: (usersRecord) =>
                                                              usersRecord.orderBy(
                                                                  'users_created_time',
                                                                  descending:
                                                                      true),
                                                          limit: 11,
                                                        );
                                                        _model.refreshUserCount =
                                                            await queryUsersRecordCount(
                                                          queryBuilder: (usersRecord) =>
                                                              usersRecord.orderBy(
                                                                  'users_created_time',
                                                                  descending:
                                                                      true),
                                                        );
                                                        _model.usersList = _model
                                                            .refreshUserList!
                                                            .toList()
                                                            .cast<
                                                                UsersRecord>();
                                                        _model.usersCount = (int?
                                                            var1) {
                                                          return (var1 != null)
                                                              ? var1
                                                              : 0;
                                                        }(_model
                                                            .refreshUserCount);
                                                        _model.lastUser = _model
                                                            .refreshUserList
                                                            ?.elementAtOrNull(
                                                                (int? var1) {
                                                          return (var1 != null)
                                                              ? (var1 - 1)
                                                              : -1;
                                                        }(_model.refreshUserList
                                                                    ?.length));
                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else {
                                            if (FFAppState()
                                                    .CurentUserLogin
                                                    .userRole ==
                                                Roles.Owner.name) {
                                              await showDialog(
                                                barrierColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          AddEmployeeFormWidget(
                                                        companyDoc:
                                                            _model.ownerCompnay,
                                                        dataRefresh: () async {
                                                          _model.refreshUserListOwner =
                                                              await queryUsersRecordOnce(
                                                            queryBuilder: (usersRecord) =>
                                                                usersRecord
                                                                    .where(
                                                                      'company_doc',
                                                                      isEqualTo: _model
                                                                          .ownerCompnay
                                                                          ?.companyDoc,
                                                                    )
                                                                    .orderBy(
                                                                        'users_created_time',
                                                                        descending:
                                                                            true),
                                                            limit: 11,
                                                          );
                                                          _model.refreshUserCountOwner =
                                                              await queryUsersRecordCount(
                                                            queryBuilder: (usersRecord) =>
                                                                usersRecord
                                                                    .where(
                                                                      'company_doc',
                                                                      isEqualTo: _model
                                                                          .ownerCompnay
                                                                          ?.companyDoc,
                                                                    )
                                                                    .orderBy(
                                                                        'users_created_time',
                                                                        descending:
                                                                            true),
                                                          );
                                                          _model.usersList = _model
                                                              .refreshUserListOwner!
                                                              .toList()
                                                              .cast<
                                                                  UsersRecord>();
                                                          _model.usersCount = (int?
                                                              var1) {
                                                            return (var1 !=
                                                                    null)
                                                                ? var1
                                                                : 0;
                                                          }(_model
                                                              .refreshUserCountOwner);
                                                          _model.lastUser = _model
                                                              .refreshUserListOwner
                                                              ?.elementAtOrNull(
                                                                  (int? var1) {
                                                            return (var1 !=
                                                                    null)
                                                                ? (var1 - 1)
                                                                : -1;
                                                          }(_model.refreshUserListOwner
                                                                      ?.length));
                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Unauthorized'),
                                                    content:
                                                        Text('Access denied.'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }
                                          }

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                        text: 'Add New',
                                        icon: Icon(
                                          Icons.add_rounded,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconColor: Colors.white,
                                          color: Color(0xFF6F61EF),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                final userList =
                                                    _model.usersList.toList();
                                                if (userList.isEmpty) {
                                                  return NoDataFoundWidget();
                                                }

                                                return FlutterFlowDataTable<
                                                    UsersRecord>(
                                                  controller: _model
                                                      .paginatedDataTableController,
                                                  data: userList,
                                                  numRows: (int? var1) {
                                                    return (var1 != null)
                                                        ? var1
                                                        : 0;
                                                  }(_model.usersCount),
                                                  columnsBuilder:
                                                      (onSortChanged) => [
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                'Emp ID',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Anwatrix_Font',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .tornado_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              size: 14.0,
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 10.0))
                                                              .around(SizedBox(
                                                                  width: 10.0)),
                                                        ),
                                                      ),
                                                      fixedWidth:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.07,
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Name',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Anwatrix_Font',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .tornado_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  size: 14.0,
                                                                ),
                                                              ),
                                                            ]
                                                                .divide(SizedBox(
                                                                    width:
                                                                        10.0))
                                                                .around(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                'Number',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Anwatrix_Font',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .tornado_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              size: 14.0,
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 10.0))
                                                              .around(SizedBox(
                                                                  width: 10.0)),
                                                        ),
                                                      ),
                                                      fixedWidth:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.1,
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                'Gender',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Anwatrix_Font',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .tornado_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              size: 14.0,
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 10.0))
                                                              .around(SizedBox(
                                                                  width: 10.0)),
                                                        ),
                                                      ),
                                                      fixedWidth:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.07,
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                'Branch',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Anwatrix_Font',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .tornado_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              size: 14.0,
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 10.0))
                                                              .around(SizedBox(
                                                                  width: 10.0)),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                'Department',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Anwatrix_Font',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .tornado_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              size: 14.0,
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 10.0))
                                                              .around(SizedBox(
                                                                  width: 10.0)),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                'Designation',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Anwatrix_Font',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .tornado_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              size: 14.0,
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 10.0))
                                                              .around(SizedBox(
                                                                  width: 10.0)),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                'Status',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Anwatrix_Font',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .tornado_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              size: 14.0,
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 10.0))
                                                              .around(SizedBox(
                                                                  width: 10.0)),
                                                        ),
                                                      ),
                                                      fixedWidth:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.1,
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Edit',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Anwatrix_Font',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ]
                                                                .divide(SizedBox(
                                                                    width:
                                                                        10.0))
                                                                .around(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                          ),
                                                        ),
                                                      ),
                                                      fixedWidth:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.05,
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Delete',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Anwatrix_Font',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ]
                                                                .divide(SizedBox(
                                                                    width:
                                                                        10.0))
                                                                .around(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                          ),
                                                        ),
                                                      ),
                                                      fixedWidth:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.05,
                                                    ),
                                                  ],
                                                  dataRowBuilder: (userListItem,
                                                          userListIndex,
                                                          selected,
                                                          onSelectChanged) =>
                                                      DataRow(
                                                    color: WidgetStateProperty
                                                        .all(
                                                      userListIndex % 2 == 0
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                    ),
                                                    cells: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                userListItem
                                                                    .employeeid,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Anwatrix_Font',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 10.0))
                                                              .around(SizedBox(
                                                                  width: 10.0)),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                userListItem
                                                                    .displayName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Anwatrix_Font',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 10.0))
                                                              .around(SizedBox(
                                                                  width: 10.0)),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                userListItem
                                                                    .phoneNumber,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Anwatrix_Font',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 10.0))
                                                              .around(SizedBox(
                                                                  width: 10.0)),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                userListItem
                                                                    .gender,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Anwatrix_Font',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 10.0))
                                                              .around(SizedBox(
                                                                  width: 10.0)),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                userListItem
                                                                    .userBranchName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Anwatrix_Font',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 10.0))
                                                              .around(SizedBox(
                                                                  width: 10.0)),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                userListItem
                                                                    .userDepartmentName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Anwatrix_Font',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 10.0))
                                                              .around(SizedBox(
                                                                  width: 10.0)),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                userListItem
                                                                    .userDesignationName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Anwatrix_Font',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 10.0))
                                                              .around(SizedBox(
                                                                  width: 10.0)),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                userListItem
                                                                    .userStatus,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Anwatrix_Font',
                                                                      color:
                                                                          () {
                                                                        if (userListItem.userStatus ==
                                                                            UsersStatus
                                                                                .Active.name) {
                                                                          return Color(
                                                                              0xFF0000FF);
                                                                        } else if (userListItem.userStatus ==
                                                                            UsersStatus
                                                                                .Inactive.name) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        } else if (userListItem.userStatus ==
                                                                            UsersStatus.Terminate.name) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .deleteAndCancle;
                                                                        } else {
                                                                          return Color(
                                                                              0x00000000);
                                                                        }
                                                                      }(),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 10.0))
                                                              .around(SizedBox(
                                                                  width: 10.0)),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) =>
                                                                      InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  var _shouldSetState =
                                                                      false;
                                                                  if (FFAppState()
                                                                          .CurentUserLogin
                                                                          .userRole ==
                                                                      Roles
                                                                          .Admin
                                                                          .name) {
                                                                    await showDialog(
                                                                      barrierColor:
                                                                          Colors
                                                                              .transparent,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                EditAdminAddEmployeeFormWidget(
                                                                              companyList: _model.adminCompanyList,
                                                                              userList: userListItem,
                                                                              dataRefresh: () async {
                                                                                _model.editUserListAdmin = await queryUsersRecordOnce(
                                                                                  queryBuilder: (usersRecord) => usersRecord.orderBy('users_created_time', descending: true),
                                                                                  limit: 11,
                                                                                );
                                                                                _model.editUserCountAdmin = await queryUsersRecordCount(
                                                                                  queryBuilder: (usersRecord) => usersRecord.orderBy('users_created_time', descending: true),
                                                                                );
                                                                                _model.usersList = _model.editUserListAdmin!.toList().cast<UsersRecord>();
                                                                                _model.lastUser = _model.editUserListAdmin?.elementAtOrNull((int? var1) {
                                                                                  return (var1 != null) ? (var1 - 1) : -1;
                                                                                }(_model.editUserListAdmin?.length));
                                                                                _model.usersCount = (int? var1) {
                                                                                  return (var1 != null) ? var1 : 0;
                                                                                }(_model.editUserCountAdmin);
                                                                                safeSetState(() {});
                                                                              },
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );

                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  } else {
                                                                    if (FFAppState()
                                                                            .CurentUserLogin
                                                                            .userRole ==
                                                                        Roles
                                                                            .Owner
                                                                            .name) {
                                                                      await showDialog(
                                                                        barrierColor:
                                                                            Colors.transparent,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: EditEmployeeFormWidget(
                                                                                companyDoc: _model.ownerCompnay,
                                                                                userList: userListItem,
                                                                                dataRefresh: () async {
                                                                                  _model.editUserListOwner = await queryUsersRecordOnce(
                                                                                    queryBuilder: (usersRecord) => usersRecord
                                                                                        .where(
                                                                                          'company_doc',
                                                                                          isEqualTo: _model.ownerCompnay?.companyDoc,
                                                                                        )
                                                                                        .orderBy('users_created_time', descending: true),
                                                                                    limit: 11,
                                                                                  );
                                                                                  _model.editUserCountOwner = await queryUsersRecordCount(
                                                                                    queryBuilder: (usersRecord) => usersRecord
                                                                                        .where(
                                                                                          'company_doc',
                                                                                          isEqualTo: _model.ownerCompnay?.companyDoc,
                                                                                        )
                                                                                        .orderBy('users_created_time', descending: true),
                                                                                  );
                                                                                  _model.usersList = _model.editUserListOwner!.toList().cast<UsersRecord>();
                                                                                  _model.lastUser = _model.editUserListOwner?.elementAtOrNull((int? var1) {
                                                                                    return (var1 != null) ? (var1 - 1) : -1;
                                                                                  }(_model.editUserListOwner?.length));
                                                                                  _model.usersCount = (int? var1) {
                                                                                    return (var1 != null) ? var1 : 0;
                                                                                  }(_model.editUserCountOwner);
                                                                                  safeSetState(() {});
                                                                                },
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );

                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                      return;
                                                                    } else {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Unauthorized'),
                                                                            content:
                                                                                Text('Access denied.'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                      return;
                                                                    }
                                                                  }

                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .edit_rounded,
                                                                  color: Color(
                                                                      0xFF39D2C0),
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 10.0))
                                                              .around(SizedBox(
                                                                  width: 10.0)),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Builder(
                                                          builder: (context) =>
                                                              InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          UserDeleteWidget(
                                                                        deleteDoc:
                                                                            userListItem.reference,
                                                                        deleteRefranceDoc:
                                                                            (deleteRefranceDoc) async {
                                                                          var _shouldSetState =
                                                                              false;
                                                                          if (FFAppState().CurentUserLogin.userRole ==
                                                                              Roles.Admin.name) {
                                                                            _model.deleteUser =
                                                                                await queryUsersRecordOnce(
                                                                              queryBuilder: (usersRecord) => usersRecord.orderBy('users_created_time', descending: true),
                                                                              limit: 11,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            _model.afterDeleteUserCount =
                                                                                await queryUsersRecordCount(
                                                                              queryBuilder: (usersRecord) => usersRecord.orderBy('users_created_time', descending: true),
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            _model.usersList =
                                                                                _model.deleteUser!.toList().cast<UsersRecord>();
                                                                            _model.usersCount =
                                                                                (int? var1) {
                                                                              return (var1 != null) ? var1 : 0;
                                                                            }(_model.afterDeleteUserCount);
                                                                            _model.lastUser =
                                                                                _model.deleteUser?.elementAtOrNull((int? var1) {
                                                                              return (var1 != null) ? (var1 - 1) : -1;
                                                                            }(_model.deleteUser?.length));
                                                                            safeSetState(() {});
                                                                            return;
                                                                          } else {
                                                                            if (FFAppState().CurentUserLogin.userRole ==
                                                                                Roles.Owner.name) {
                                                                              _model.deleteUserOwner = await queryUsersRecordOnce(
                                                                                queryBuilder: (usersRecord) => usersRecord
                                                                                    .where(
                                                                                      'company_doc',
                                                                                      isEqualTo: FFAppState().CurentUserLogin.companyDoc,
                                                                                    )
                                                                                    .orderBy('users_created_time', descending: true),
                                                                                limit: 11,
                                                                              );
                                                                              _shouldSetState = true;
                                                                              _model.afterDeleteUserCountOwner = await queryUsersRecordCount(
                                                                                queryBuilder: (usersRecord) => usersRecord
                                                                                    .where(
                                                                                      'company_doc',
                                                                                      isEqualTo: FFAppState().CurentUserLogin.companyDoc,
                                                                                    )
                                                                                    .orderBy('users_created_time', descending: true),
                                                                              );
                                                                              _shouldSetState = true;
                                                                              _model.usersList = _model.deleteUserOwner!.toList().cast<UsersRecord>();
                                                                              _model.usersCount = (int? var1) {
                                                                                return (var1 != null) ? var1 : 0;
                                                                              }(_model.afterDeleteUserCountOwner);
                                                                              _model.lastUser = _model.deleteUserOwner?.elementAtOrNull((int? var1) {
                                                                                return (var1 != null) ? (var1 - 1) : -1;
                                                                              }(_model.deleteUserOwner?.length));
                                                                              safeSetState(() {});
                                                                              return;
                                                                            } else {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    title: Text('Unauthorized'),
                                                                                    content: Text('Access denied.'),
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
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .delete_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .deleteAndCancle,
                                                                  size: 24.0,
                                                                ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      width:
                                                                          10.0))
                                                                  .around(SizedBox(
                                                                      width:
                                                                          10.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                        .map((c) => DataCell(c))
                                                        .toList(),
                                                  ),
                                                  emptyBuilder: () =>
                                                      NoDataFoundWidget(),
                                                  onPageChanged:
                                                      (currentRowIndex) async {
                                                    var _shouldSetState = false;
                                                    if (FFAppState()
                                                            .CurentUserLogin
                                                            .userRole ==
                                                        Roles.Admin.name) {
                                                      _model.newPageAdmin =
                                                          await queryUsersRecordOnce(
                                                        queryBuilder: (usersRecord) =>
                                                            usersRecord
                                                                .where(
                                                                  'users_created_time',
                                                                  isLessThan: _model
                                                                      .lastUser
                                                                      ?.usersCreatedTime,
                                                                )
                                                                .orderBy(
                                                                    'users_created_time',
                                                                    descending:
                                                                        true),
                                                        limit: 11,
                                                      );
                                                      _shouldSetState = true;
                                                      for (int loop1Index = 0;
                                                          loop1Index <=
                                                              _model
                                                                  .newPageAdmin!
                                                                  .length;
                                                          loop1Index++) {
                                                        final currentLoop1Item =
                                                            _model.newPageAdmin![
                                                                loop1Index];
                                                        _model.addToUsersList(
                                                            currentLoop1Item);
                                                        _model.lastUser = _model
                                                            .newPageAdmin
                                                            ?.elementAtOrNull(
                                                                (int? var1) {
                                                          return (var1 != null)
                                                              ? (var1 - 1)
                                                              : -1;
                                                        }(_model.newPageAdmin
                                                                    ?.length));
                                                        safeSetState(() {});
                                                      }
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    } else {
                                                      if (FFAppState()
                                                              .CurentUserLogin
                                                              .userRole ==
                                                          Roles.Owner.name) {
                                                        _model.newPageOwner =
                                                            await queryUsersRecordOnce(
                                                          queryBuilder: (usersRecord) =>
                                                              usersRecord
                                                                  .where(
                                                                    'users_created_time',
                                                                    isLessThan: _model
                                                                        .lastUser
                                                                        ?.usersCreatedTime,
                                                                  )
                                                                  .where(
                                                                    'company_doc',
                                                                    isEqualTo: FFAppState()
                                                                        .CurentUserLogin
                                                                        .companyDoc,
                                                                  )
                                                                  .orderBy(
                                                                      'users_created_time',
                                                                      descending:
                                                                          true),
                                                          limit: 11,
                                                        );
                                                        _shouldSetState = true;
                                                        for (int loop2Index = 0;
                                                            loop2Index <=
                                                                _model
                                                                    .newPageOwner!
                                                                    .length;
                                                            loop2Index++) {
                                                          final currentLoop2Item =
                                                              _model.newPageOwner![
                                                                  loop2Index];
                                                          _model.addToUsersList(
                                                              currentLoop2Item);
                                                          _model.lastUser = _model
                                                              .newPageOwner
                                                              ?.elementAtOrNull(
                                                                  (int? var1) {
                                                            return (var1 !=
                                                                    null)
                                                                ? (var1 - 1)
                                                                : -1;
                                                          }(_model.newPageOwner
                                                                      ?.length));
                                                          safeSetState(() {});
                                                        }
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Unauthorized'),
                                                              content: Text(
                                                                  'Access denied.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      }
                                                    }

                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                  },
                                                  paginated: true,
                                                  selectable: false,
                                                  hidePaginator: false,
                                                  showFirstLastButtons: true,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  minWidth: 1700.0,
                                                  headingRowHeight: 42.0,
                                                  dataRowHeight: 40.0,
                                                  columnSpacing: 10.0,
                                                  headingRowColor:
                                                      Color(0xFF6F61EF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  addHorizontalDivider: true,
                                                  addTopAndBottomDivider: false,
                                                  hideDefaultHorizontalDivider:
                                                      true,
                                                  horizontalDividerColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  horizontalDividerThickness:
                                                      1.0,
                                                  addVerticalDivider: false,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(height: 0.0))
                                        .around(SizedBox(height: 0.0)),
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
