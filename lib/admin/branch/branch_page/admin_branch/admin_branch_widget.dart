import '/admin/branch/branch_componentes/admind_add_branch_form/admind_add_branch_form_widget.dart';
import '/admin/branch/branch_componentes/owner_add_branch_form/owner_add_branch_form_widget.dart';
import '/alrt/branch_delete/branch_delete_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/component/web_navbar/web_navbar_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/others/no_data_found/no_data_found_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_branch_model.dart';
export 'admin_branch_model.dart';

class AdminBranchWidget extends StatefulWidget {
  const AdminBranchWidget({super.key});

  static String routeName = 'Admin_Branch';
  static String routePath = '/Branch';

  @override
  State<AdminBranchWidget> createState() => _AdminBranchWidgetState();
}

class _AdminBranchWidgetState extends State<AdminBranchWidget> {
  late AdminBranchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminBranchModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().CurentUserLogin.userRole == Roles.Admin.name) {
        _model.companiesListForAdmin = await queryCompaniesRecordOnce(
          queryBuilder: (companiesRecord) => companiesRecord
              .where(
                'companies_status',
                isEqualTo: CmpaniesStatus.Active.name,
              )
              .orderBy('companies_created_time', descending: true),
        );
        _model.brachListForAdmin = await queryCompaniesBranchesRecordOnce(
          queryBuilder: (companiesBranchesRecord) => companiesBranchesRecord
              .orderBy('branch_created_time', descending: true),
          limit: 11,
        );
        _model.brachListCount = await queryCompaniesBranchesRecordCount(
          queryBuilder: (companiesBranchesRecord) => companiesBranchesRecord
              .orderBy('branch_created_time', descending: true),
        );
        _model.countOfBranch = _model.brachListCount;
        safeSetState(() {});
        for (int loop1Index = 0;
            loop1Index <= _model.brachListForAdmin!.length;
            loop1Index++) {
          final currentLoop1Item = _model.brachListForAdmin![loop1Index];
          _model.companiesListPageState =
              _model.companiesListForAdmin!.toList().cast<CompaniesRecord>();
          _model.addToBranchListPageState(currentLoop1Item);
          _model.lastBranch =
              _model.brachListForAdmin?.elementAtOrNull((int? var1) {
            return (var1 != null) ? (var1 - 1) : -1;
          }(_model.brachListForAdmin?.length));
          safeSetState(() {});
        }
        return;
      } else {
        if (FFAppState().CurentUserLogin.userRole == Roles.Owner.name) {
          _model.compnaniesForCompnayOwner = await queryCompaniesRecordOnce(
            queryBuilder: (companiesRecord) => companiesRecord
                .where(
                  'company_doc',
                  isEqualTo: FFAppState().CurentUserLogin.companyDoc,
                )
                .orderBy('companies_created_time', descending: true),
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          _model.branchForCompnayOwner = await queryCompaniesBranchesRecordOnce(
            queryBuilder: (companiesBranchesRecord) => companiesBranchesRecord
                .where(
                  'company_doc',
                  isEqualTo: FFAppState().CurentUserLogin.companyDoc,
                )
                .orderBy('branch_created_time', descending: true),
            limit: 11,
          );
          _model.brachListCountOwner = await queryCompaniesBranchesRecordCount(
            queryBuilder: (companiesBranchesRecord) => companiesBranchesRecord
                .where(
                  'company_doc',
                  isEqualTo: FFAppState().CurentUserLogin.companyDoc,
                )
                .orderBy('branch_created_time', descending: true),
          );
          _model.countOfBranch = _model.brachListCountOwner;
          safeSetState(() {});
          for (int loop2Index = 0;
              loop2Index <= _model.branchForCompnayOwner!.length;
              loop2Index++) {
            final currentLoop2Item = _model.branchForCompnayOwner![loop2Index];
            _model.ownerCompany = _model.compnaniesForCompnayOwner;
            _model.addToBranchListPageState(currentLoop2Item);
            _model.lastBranch =
                _model.branchForCompnayOwner?.elementAtOrNull((int? var1) {
              return (var1 != null) ? (var1 - 1) : -1;
            }(_model.branchForCompnayOwner?.length));
            safeSetState(() {});
          }
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.webNavbarModel,
              updateCallback: () => safeSetState(() {}),
              updateOnChange: true,
              child: WebNavbarWidget(
                webNavSelected: 3,
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
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                      ))
                        Container(
                          width: double.infinity,
                          height: 24.0,
                          decoration: BoxDecoration(),
                        ),
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
                                color: FlutterFlowTheme.of(context).primaryText,
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
                                        'Branch Data',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                                        'Created Branch List below.',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.plusJakartaSans(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child:
                                                    AdmindAddBranchFormWidget(
                                                  companyList: _model
                                                      .companiesListPageState,
                                                  branchListUpdate: () async {
                                                    _model.refreshedBranches =
                                                        await queryCompaniesBranchesRecordOnce(
                                                      queryBuilder:
                                                          (companiesBranchesRecord) =>
                                                              companiesBranchesRecord
                                                                  .orderBy(
                                                                      'branch_created_time',
                                                                      descending:
                                                                          true),
                                                      limit: 11,
                                                    );
                                                    _model.addBranchCount =
                                                        await queryCompaniesBranchesRecordCount(
                                                      queryBuilder:
                                                          (companiesBranchesRecord) =>
                                                              companiesBranchesRecord
                                                                  .orderBy(
                                                                      'branch_created_time',
                                                                      descending:
                                                                          true),
                                                    );
                                                    _model.branchListPageState =
                                                        _model
                                                            .refreshedBranches!
                                                            .toList()
                                                            .cast<
                                                                CompaniesBranchesRecord>();
                                                    _model.countOfBranch =
                                                        (int var1) {
                                                      return (var1 != null)
                                                          ? var1
                                                          : 0;
                                                    }(_model.addBranchCount!);
                                                    _model.lastBranch = _model
                                                        .refreshedBranches
                                                        ?.elementAtOrNull(
                                                            (int? var1) {
                                                      return (var1 != null)
                                                          ? (var1 - 1)
                                                          : -1;
                                                    }(_model.refreshedBranches
                                                                ?.length));
                                                    safeSetState(() {});
                                                  },
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
                                                  child:
                                                      OwnerAddBranchFormWidget(
                                                    ownerCompany:
                                                        _model.ownerCompany,
                                                    branchlist: () async {
                                                      _model.ownerbranchrefresh =
                                                          await queryCompaniesBranchesRecordOnce(
                                                        queryBuilder: (companiesBranchesRecord) =>
                                                            companiesBranchesRecord
                                                                .where(
                                                                  'company_doc',
                                                                  isEqualTo: FFAppState()
                                                                      .CurentUserLogin
                                                                      .companyDoc,
                                                                )
                                                                .orderBy(
                                                                    'branch_created_time',
                                                                    descending:
                                                                        true),
                                                        limit: 11,
                                                      );
                                                      _model.ownerbranchrefreshCount =
                                                          await queryCompaniesBranchesRecordCount(
                                                        queryBuilder: (companiesBranchesRecord) =>
                                                            companiesBranchesRecord
                                                                .where(
                                                                  'company_doc',
                                                                  isEqualTo: FFAppState()
                                                                      .CurentUserLogin
                                                                      .companyDoc,
                                                                )
                                                                .orderBy(
                                                                    'branch_created_time',
                                                                    descending:
                                                                        true),
                                                      );
                                                      _model.branchListPageState =
                                                          _model
                                                              .ownerbranchrefresh!
                                                              .toList()
                                                              .cast<
                                                                  CompaniesBranchesRecord>();
                                                      _model.countOfBranch = (int?
                                                          var1) {
                                                        return (var1 != null)
                                                            ? var1
                                                            : 0;
                                                      }(_model
                                                          .ownerbranchrefreshCount);
                                                      _model.lastBranch = _model
                                                          .ownerbranchrefresh
                                                          ?.elementAtOrNull(
                                                              (int? var1) {
                                                        return (var1 != null)
                                                            ? (var1 - 1)
                                                            : -1;
                                                      }(_model.ownerbranchrefresh
                                                                  ?.length));
                                                      safeSetState(() {});
                                                    },
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        iconColor: Colors.white,
                                        color: Color(0xFF6F61EF),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.plusJakartaSans(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final branchListVariable = _model
                                                .branchListPageState
                                                .toList();
                                            if (branchListVariable.isEmpty) {
                                              return NoDataFoundWidget();
                                            }

                                            return FlutterFlowDataTable<
                                                CompaniesBranchesRecord>(
                                              controller: _model
                                                  .paginatedDataTableController,
                                              data: branchListVariable,
                                              numRows: (int? var1) {
                                                return (var1 != null)
                                                    ? var1
                                                    : 0;
                                              }(_model.countOfBranch),
                                              columnsBuilder: (onSortChanged) =>
                                                  [
                                                DataColumn2(
                                                  label: DefaultTextStyle.merge(
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
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            'Company Name',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Anwatrix_Font',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          ),
                                                        ),
                                                        if (FFAppState()
                                                                .CurentUserLogin
                                                                .userRole ==
                                                            Roles.Admin.name)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              fillColor: Colors
                                                                  .transparent,
                                                              icon: Icon(
                                                                Icons
                                                                    .tornado_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 14.0,
                                                              ),
                                                              onPressed: () {
                                                                print(
                                                                    'IconButton pressed ...');
                                                              },
                                                            ),
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
                                                  label: DefaultTextStyle.merge(
                                                    softWrap: true,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Branch Name',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Anwatrix_Font',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            fillColor: Colors
                                                                .transparent,
                                                            icon: Icon(
                                                              Icons
                                                                  .tornado_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              size: 14.0,
                                                            ),
                                                            onPressed: () {
                                                              print(
                                                                  'IconButton pressed ...');
                                                            },
                                                          ),
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
                                                  label: DefaultTextStyle.merge(
                                                    softWrap: true,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Created Date',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Anwatrix_Font',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
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
                                                  label: DefaultTextStyle.merge(
                                                    softWrap: true,
                                                    child: Align(
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
                                                          Text(
                                                            'Delete',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Anwatrix_Font',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          ),
                                                        ]
                                                            .divide(SizedBox(
                                                                width: 10.0))
                                                            .around(SizedBox(
                                                                width: 10.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              dataRowBuilder:
                                                  (branchListVariableItem,
                                                          branchListVariableIndex,
                                                          selected,
                                                          onSelectChanged) =>
                                                      DataRow(
                                                color:
                                                    WidgetStateProperty.all(
                                                  branchListVariableIndex % 2 ==
                                                          0
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                ),
                                                cells: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          () {
                                                            if (FFAppState()
                                                                    .CurentUserLogin
                                                                    .userRole ==
                                                                Roles.Admin
                                                                    .name) {
                                                              return _model
                                                                  .companiesListForAdmin
                                                                  ?.where((e) =>
                                                                      branchListVariableItem
                                                                          .companyDoc ==
                                                                      e.companyDoc)
                                                                  .toList()
                                                                  .firstOrNull
                                                                  ?.businessName;
                                                            } else if (FFAppState()
                                                                    .CurentUserLogin
                                                                    .userRole !=
                                                                Roles.Admin
                                                                    .name) {
                                                              return _model
                                                                  .compnaniesForCompnayOwner
                                                                  ?.businessName;
                                                            } else {
                                                              return '';
                                                            }
                                                          }(),
                                                          'Defult',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Anwatrix_Font',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w100,
                                                                ),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            width: 10.0))
                                                        .around(SizedBox(
                                                            width: 10.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        branchListVariableItem
                                                            .branchName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Anwatrix_Font',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w100,
                                                                ),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            width: 10.0))
                                                        .around(SizedBox(
                                                            width: 10.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        dateTimeFormat(
                                                            "dd-MMM-yyyy",
                                                            branchListVariableItem
                                                                .branchCreatedTime!),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Anwatrix_Font',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w100,
                                                                ),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            width: 10.0))
                                                        .around(SizedBox(
                                                            width: 10.0)),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) =>
                                                          InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showDialog(
                                                            barrierColor: Colors
                                                                .transparent,
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
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
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    BranchDeleteWidget(
                                                                  deleteBranchDoc:
                                                                      branchListVariableItem
                                                                          .reference,
                                                                  deleteRefranceDoc:
                                                                      (deleteRefranceDoc) async {
                                                                    var _shouldSetState =
                                                                        false;
                                                                    if (FFAppState()
                                                                            .CurentUserLogin
                                                                            .userRole ==
                                                                        Roles
                                                                            .Admin
                                                                            .name) {
                                                                      _model.deleteBranch =
                                                                          await queryCompaniesBranchesRecordOnce(
                                                                        queryBuilder: (companiesBranchesRecord) => companiesBranchesRecord.orderBy(
                                                                            'branch_created_time',
                                                                            descending:
                                                                                true),
                                                                        limit:
                                                                            11,
                                                                      );
                                                                      _shouldSetState =
                                                                          true;
                                                                      _model.afterDeleteBranchsCount =
                                                                          await queryCompaniesBranchesRecordCount(
                                                                        queryBuilder: (companiesBranchesRecord) => companiesBranchesRecord.orderBy(
                                                                            'branch_created_time',
                                                                            descending:
                                                                                true),
                                                                      );
                                                                      _shouldSetState =
                                                                          true;
                                                                      _model.branchListPageState = _model
                                                                          .deleteBranch!
                                                                          .toList()
                                                                          .cast<
                                                                              CompaniesBranchesRecord>();
                                                                      _model.countOfBranch = (int?
                                                                          var1) {
                                                                        return (var1 !=
                                                                                null)
                                                                            ? var1
                                                                            : 0;
                                                                      }(_model
                                                                          .afterDeleteBranchsCount);
                                                                      _model.lastBranch = _model.deleteBranch?.elementAtOrNull((int?
                                                                          var1) {
                                                                        return (var1 !=
                                                                                null)
                                                                            ? (var1 -
                                                                                1)
                                                                            : -1;
                                                                      }(_model
                                                                          .deleteBranch
                                                                          ?.length));
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
                                                                        _model.deleteBranchOwner =
                                                                            await queryCompaniesBranchesRecordOnce(
                                                                          queryBuilder: (companiesBranchesRecord) => companiesBranchesRecord
                                                                              .where(
                                                                                'company_doc',
                                                                                isEqualTo: FFAppState().CurentUserLogin.companyDoc,
                                                                              )
                                                                              .orderBy('branch_created_time', descending: true),
                                                                          limit:
                                                                              11,
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        _model.afterDeleteBranchsCountOwner =
                                                                            await queryCompaniesBranchesRecordCount(
                                                                          queryBuilder: (companiesBranchesRecord) => companiesBranchesRecord
                                                                              .where(
                                                                                'company_doc',
                                                                                isEqualTo: FFAppState().CurentUserLogin.companyDoc,
                                                                              )
                                                                              .orderBy('branch_created_time', descending: true),
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        _model.branchListPageState = _model
                                                                            .deleteBranchOwner!
                                                                            .toList()
                                                                            .cast<CompaniesBranchesRecord>();
                                                                        _model.countOfBranch = (int?
                                                                            var1) {
                                                                          return (var1 != null)
                                                                              ? var1
                                                                              : 0;
                                                                        }(_model
                                                                            .afterDeleteBranchsCountOwner);
                                                                        _model.lastBranch = _model.deleteBranchOwner?.elementAtOrNull((int?
                                                                            var1) {
                                                                          return (var1 != null)
                                                                              ? (var1 - 1)
                                                                              : -1;
                                                                        }(_model
                                                                            .deleteBranchOwner
                                                                            ?.length));
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
                                                              );
                                                            },
                                                          );

                                                          safeSetState(() {});
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .delete_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .deleteAndCancle,
                                                              size: 24.0,
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 10.0))
                                                              .around(SizedBox(
                                                                  width: 10.0)),
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
                                                      await queryCompaniesBranchesRecordOnce(
                                                    queryBuilder:
                                                        (companiesBranchesRecord) =>
                                                            companiesBranchesRecord
                                                                .where(
                                                                  'branch_created_time',
                                                                  isLessThan: _model
                                                                      .lastBranch
                                                                      ?.branchCreatedTime,
                                                                )
                                                                .orderBy(
                                                                    'branch_created_time',
                                                                    descending:
                                                                        true),
                                                    limit: 11,
                                                  );
                                                  _shouldSetState = true;
                                                  for (int loop1Index = 0;
                                                      loop1Index <=
                                                          _model.newPageAdmin!
                                                              .length;
                                                      loop1Index++) {
                                                    final currentLoop1Item =
                                                        _model.newPageAdmin![
                                                            loop1Index];
                                                    _model
                                                        .addToBranchListPageState(
                                                            currentLoop1Item);
                                                    _model.lastBranch = _model
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
                                                        await queryCompaniesBranchesRecordOnce(
                                                      queryBuilder:
                                                          (companiesBranchesRecord) =>
                                                              companiesBranchesRecord
                                                                  .where(
                                                                    'branch_created_time',
                                                                    isLessThan: _model
                                                                        .lastBranch
                                                                        ?.branchCreatedTime,
                                                                  )
                                                                  .where(
                                                                    'company_doc',
                                                                    isEqualTo: FFAppState()
                                                                        .CurentUserLogin
                                                                        .companyDoc,
                                                                  )
                                                                  .orderBy(
                                                                      'branch_created_time',
                                                                      descending:
                                                                          true),
                                                      limit: 11,
                                                    );
                                                    _shouldSetState = true;
                                                    for (int loop2Index = 0;
                                                        loop2Index <=
                                                            _model.newPageOwner!
                                                                .length;
                                                        loop2Index++) {
                                                      final currentLoop2Item =
                                                          _model.newPageOwner![
                                                              loop2Index];
                                                      _model
                                                          .addToBranchListPageState(
                                                              currentLoop2Item);
                                                      _model.lastBranch = _model
                                                          .newPageOwner
                                                          ?.elementAtOrNull(
                                                              (int? var1) {
                                                        return (var1 != null)
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
                                              paginated: true,
                                              selectable: false,
                                              hidePaginator: false,
                                              showFirstLastButtons: true,
                                              width: double.infinity,
                                              height: double.infinity,
                                              minWidth: 1200.0,
                                              headingRowHeight: 42.0,
                                              dataRowHeight: 40.0,
                                              columnSpacing: 15.0,
                                              headingRowColor:
                                                  Color(0xFF6F61EF),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              addHorizontalDivider: true,
                                              addTopAndBottomDivider: false,
                                              hideDefaultHorizontalDivider:
                                                  true,
                                              horizontalDividerColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              horizontalDividerThickness: 1.0,
                                              addVerticalDivider: false,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 10.0))
                                      .around(SizedBox(height: 10.0)),
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
    );
  }
}
