import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'admin_add_employee_form_model.dart';
export 'admin_add_employee_form_model.dart';

class AdminAddEmployeeFormWidget extends StatefulWidget {
  const AdminAddEmployeeFormWidget({
    super.key,
    this.companyList,
    this.dataRefresh,
  });

  final List<CompaniesRecord>? companyList;
  final Future Function()? dataRefresh;

  @override
  State<AdminAddEmployeeFormWidget> createState() =>
      _AdminAddEmployeeFormWidgetState();
}

class _AdminAddEmployeeFormWidgetState
    extends State<AdminAddEmployeeFormWidget> {
  late AdminAddEmployeeFormModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminAddEmployeeFormModel());

    _model.employeeIDTextController ??= TextEditingController();
    _model.employeeIDFocusNode ??= FocusNode();

    _model.employeeNameTextController ??= TextEditingController();
    _model.employeeNameFocusNode ??= FocusNode();

    _model.employeeMobileNumberTextController ??= TextEditingController();
    _model.employeeMobileNumberFocusNode ??= FocusNode();

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 450.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x25090F13),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Container(
                        width: 60.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 44.0,
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add Employee Form',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                'Please enter employee details below to create their profile.',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Anwatrix_Font',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 24.0,
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.employeeCompanyValueController ??=
                              FormFieldController<String>(null),
                          options: widget.companyList!
                              .unique((e) => e.companyDoc!)
                              .map((e) => e.businessName)
                              .toList(),
                          onChanged: (val) async {
                            safeSetState(
                                () => _model.employeeCompanyValue = val);
                            _model.selectedCompany =
                                await queryCompaniesRecordOnce(
                              queryBuilder: (companiesRecord) => companiesRecord
                                  .where(
                                    'business_name',
                                    isEqualTo: _model.employeeCompanyValue,
                                  )
                                  .orderBy('companies_created_time',
                                      descending: true),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            _model.selectedCompnay = _model.selectedCompany;
                            safeSetState(() {});
                            _model.branchQuery =
                                await queryCompaniesBranchesRecordOnce(
                              queryBuilder: (companiesBranchesRecord) =>
                                  companiesBranchesRecord
                                      .where(
                                        'company_doc',
                                        isEqualTo:
                                            _model.selectedCompany?.companyDoc,
                                      )
                                      .orderBy('branch_created_time',
                                          descending: true),
                            );
                            _model.branchList = _model.branchQuery!
                                .toList()
                                .cast<CompaniesBranchesRecord>();
                            safeSetState(() {});
                            _model.departmentQuery =
                                await queryCompaniesDepartmentsRecordOnce(
                              queryBuilder: (companiesDepartmentsRecord) =>
                                  companiesDepartmentsRecord
                                      .where(
                                        'company_doc',
                                        isEqualTo:
                                            _model.selectedCompany?.companyDoc,
                                      )
                                      .orderBy('departments_created_time',
                                          descending: true),
                            );
                            _model.departmentList = _model.departmentQuery!
                                .toList()
                                .cast<CompaniesDepartmentsRecord>();
                            safeSetState(() {});
                            _model.designationQuery =
                                await queryCompaniesDesignationsRecordOnce(
                              queryBuilder: (companiesDesignationsRecord) =>
                                  companiesDesignationsRecord
                                      .where(
                                        'company_doc',
                                        isEqualTo:
                                            _model.selectedCompany?.companyDoc,
                                      )
                                      .orderBy('designations_created_time',
                                          descending: true),
                            );
                            _model.designationLIst = _model.designationQuery!
                                .toList()
                                .cast<CompaniesDesignationsRecord>();
                            safeSetState(() {});

                            safeSetState(() {});
                          },
                          width: 370.0,
                          height: 50.0,
                          searchHintTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          searchTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                  ),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          hintText: 'Compnay',
                          searchHintText: 'Select Department',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          elevation: 3.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 12.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: true,
                          isMultiSelect: false,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Container(
                          width: 370.0,
                          child: TextFormField(
                            controller: _model.employeeIDTextController,
                            focusNode: _model.employeeIDFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.employeeIDTextController',
                              Duration(milliseconds: 100),
                              () => safeSetState(() {}),
                            ),
                            autofocus: true,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelText: 'Employee Code',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Anwatrix_Font',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            maxLength: 15,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            keyboardType: TextInputType.number,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.employeeIDTextControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Container(
                          width: 370.0,
                          child: TextFormField(
                            controller: _model.employeeNameTextController,
                            focusNode: _model.employeeNameFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.employeeNameTextController',
                              Duration(milliseconds: 100),
                              () => safeSetState(() {}),
                            ),
                            autofocus: true,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelText: 'Employee Name',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Anwatrix_Font',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            maxLength: 30,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            keyboardType: TextInputType.name,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model
                                .employeeNameTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Container(
                          width: 370.0,
                          child: TextFormField(
                            controller:
                                _model.employeeMobileNumberTextController,
                            focusNode: _model.employeeMobileNumberFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.employeeMobileNumberTextController',
                              Duration(milliseconds: 100),
                              () => safeSetState(() {}),
                            ),
                            autofocus: true,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelText: 'Mobile Number',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Anwatrix_Font',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            maxLength: 10,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            keyboardType: TextInputType.phone,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model
                                .employeeMobileNumberTextControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.employeeGenderValueController ??=
                              FormFieldController<String>(null),
                          options: ['Male', 'Female'],
                          onChanged: (val) => safeSetState(
                              () => _model.employeeGenderValue = val),
                          width: 370.0,
                          height: 50.0,
                          searchHintTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          searchTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                  ),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          hintText: 'Gender',
                          searchHintText: 'Select Gender',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          elevation: 3.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 12.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: true,
                          isMultiSelect: false,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (_model.employeeCompanyValue != null &&
                              _model.employeeCompanyValue != '') {
                            return;
                          }

                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Company Selection Required'),
                                content: Text(
                                    'Please select a company before choosing a branch.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.employeeBranchValueController ??=
                                        FormFieldController<String>(null),
                                options: _model.branchList
                                    .unique((e) => e.branchDoc!)
                                    .map((e) => e.branchName)
                                    .toList(),
                                onChanged: (val) => safeSetState(
                                    () => _model.employeeBranchValue = val),
                                width: 370.0,
                                height: 50.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Anwatrix_Font',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                searchTextStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Anwatrix_Font',
                                      letterSpacing: 0.0,
                                    ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Anwatrix_Font',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                hintText: 'Branch',
                                searchHintText: 'Select Branch',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                elevation: 3.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 12.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: true,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (_model.employeeCompanyValue != null &&
                              _model.employeeCompanyValue != '') {
                            return;
                          }

                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Company Selection Required'),
                                content: Text(
                                    'Please select a company before choosing a department.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.employeeDepartmentValueController ??=
                                        FormFieldController<String>(null),
                                options: _model.departmentList
                                    .unique((e) => e.departmentsDoc!)
                                    .map((e) => e.departmentsName)
                                    .toList(),
                                onChanged: (val) => safeSetState(
                                    () => _model.employeeDepartmentValue = val),
                                width: 370.0,
                                height: 50.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Anwatrix_Font',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                searchTextStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Anwatrix_Font',
                                      letterSpacing: 0.0,
                                    ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Anwatrix_Font',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                hintText: 'Department',
                                searchHintText: 'Select Department',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                elevation: 3.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 12.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: true,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (_model.employeeCompanyValue != null &&
                              _model.employeeCompanyValue != '') {
                            return;
                          }

                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Company Selection Required'),
                                content: Text(
                                    'Please select a company before choosing a designation.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model
                                        .employeeDesignationValueController ??=
                                    FormFieldController<String>(null),
                                options: _model.designationLIst
                                    .unique((e) => e.designationsDoc!)
                                    .map((e) => e.designationsName)
                                    .toList(),
                                onChanged: (val) => safeSetState(() =>
                                    _model.employeeDesignationValue = val),
                                width: 370.0,
                                height: 50.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Anwatrix_Font',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                searchTextStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Anwatrix_Font',
                                      letterSpacing: 0.0,
                                    ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Anwatrix_Font',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                hintText: 'Designation',
                                searchHintText: 'Select Designation',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                elevation: 3.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 12.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: true,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 24.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (_model.employeeCompanyValue == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Please select a company.',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Anwatrix_Font',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                    return;
                                  }
                                  if (_model.employeeGenderValue == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Please select a gender',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Anwatrix_Font',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                    return;
                                  }
                                  if (_model.employeeBranchValue == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Branch can’t be empty.',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Anwatrix_Font',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                    return;
                                  }
                                  if (_model.employeeDepartmentValue == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Department can’t be empty.',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Anwatrix_Font',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                    return;
                                  }
                                  if (_model.employeeDesignationValue == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Designation can’t be empty.',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Anwatrix_Font',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                    return;
                                  }
                                  _model.userCollection =
                                      await queryUsersRecordOnce(
                                    queryBuilder: (usersRecord) => usersRecord
                                        .orderBy('users_created_time',
                                            descending: true),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  _shouldSetState = true;
                                  if (_model.userCollection?.phoneNumber !=
                                      _model.employeeMobileNumberTextController
                                          .text) {
                                    var usersRecordReference =
                                        UsersRecord.collection.doc();
                                    await usersRecordReference.set({
                                      ...createUsersRecordData(
                                        employeeid: _model
                                            .employeeIDTextController.text,
                                        displayName: _model
                                            .employeeNameTextController.text,
                                        phoneNumber: _model
                                            .employeeMobileNumberTextController
                                            .text,
                                        photoUrl: '\"\"',
                                        gender: _model.employeeGenderValue,
                                        usersCreatedByName: FFAppState()
                                            .CurentUserLogin
                                            .displayName,
                                        usersCreatedByNumber: FFAppState()
                                            .CurentUserLogin
                                            .phoneNumber,
                                        userRole: Roles.User.name,
                                        userBranchName:
                                            _model.employeeBranchValue,
                                        userDepartmentName:
                                            _model.employeeDepartmentValue,
                                        userDesignationName:
                                            _model.employeeDesignationValue,
                                        userStatus: UsersStatus.Active.name,
                                        companyDoc:
                                            _model.selectedCompnay?.companyDoc,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'users_created_time':
                                              FieldValue.serverTimestamp(),
                                          'users_last_active_time':
                                              FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                    _model.userCreateByAdmin =
                                        UsersRecord.getDocumentFromData({
                                      ...createUsersRecordData(
                                        employeeid: _model
                                            .employeeIDTextController.text,
                                        displayName: _model
                                            .employeeNameTextController.text,
                                        phoneNumber: _model
                                            .employeeMobileNumberTextController
                                            .text,
                                        photoUrl: '\"\"',
                                        gender: _model.employeeGenderValue,
                                        usersCreatedByName: FFAppState()
                                            .CurentUserLogin
                                            .displayName,
                                        usersCreatedByNumber: FFAppState()
                                            .CurentUserLogin
                                            .phoneNumber,
                                        userRole: Roles.User.name,
                                        userBranchName:
                                            _model.employeeBranchValue,
                                        userDepartmentName:
                                            _model.employeeDepartmentValue,
                                        userDesignationName:
                                            _model.employeeDesignationValue,
                                        userStatus: UsersStatus.Active.name,
                                        companyDoc:
                                            _model.selectedCompnay?.companyDoc,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'users_created_time': DateTime.now(),
                                          'users_last_active_time':
                                              DateTime.now(),
                                        },
                                      ),
                                    }, usersRecordReference);
                                    _shouldSetState = true;

                                    await _model.userCreateByAdmin!.reference
                                        .update(createUsersRecordData(
                                      usersDoc:
                                          _model.userCreateByAdmin?.reference,
                                    ));
                                    await widget.dataRefresh?.call();
                                    safeSetState(() {
                                      _model.employeeCompanyValueController
                                          ?.reset();
                                      _model.employeeGenderValueController
                                          ?.reset();
                                      _model.employeeBranchValueController
                                          ?.reset();
                                      _model.employeeDepartmentValueController
                                          ?.reset();
                                      _model.employeeDesignationValueController
                                          ?.reset();
                                    });
                                    safeSetState(() {
                                      _model.employeeIDTextController?.clear();
                                      _model.employeeNameTextController
                                          ?.clear();
                                      _model.employeeMobileNumberTextController
                                          ?.clear();
                                    });
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'The employee has been added to the company records.',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Anwatrix_Font',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                      ),
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('User Already Exists'),
                                          content: Text(
                                              'This mobile number is already registered.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                                text: 'Save',
                                icon: Icon(
                                  Icons.save_rounded,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: 150.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Anwatrix_Font',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                  hoverColor:
                                      FlutterFlowTheme.of(context).success,
                                  hoverBorderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  hoverTextColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  hoverElevation: 3.0,
                                ),
                              ),
                            ),
                          ],
                        ),
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
