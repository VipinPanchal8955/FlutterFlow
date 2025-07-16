import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'owner_add_designation_form_model.dart';
export 'owner_add_designation_form_model.dart';

class OwnerAddDesignationFormWidget extends StatefulWidget {
  const OwnerAddDesignationFormWidget({
    super.key,
    this.ownerCompany,
    this.designationlist,
  });

  final CompaniesRecord? ownerCompany;
  final Future Function()? designationlist;

  @override
  State<OwnerAddDesignationFormWidget> createState() =>
      _OwnerAddDesignationFormWidgetState();
}

class _OwnerAddDesignationFormWidgetState
    extends State<OwnerAddDesignationFormWidget> {
  late OwnerAddDesignationFormModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OwnerAddDesignationFormModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selectedCompany = widget.ownerCompany;
      safeSetState(() {});
    });

    _model.companyDepartmentTextController ??= TextEditingController();
    _model.companyDepartmentFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            bottomLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
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
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add Designation',
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
                                'Please enter branch name below to create their designation profile.',
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 44.0,
                          icon: Icon(
                            Icons.cancel_presentation_rounded,
                            color: FlutterFlowTheme.of(context).deleteAndCancle,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
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
                        child: Container(
                          width: 370.0,
                          child: TextFormField(
                            controller: _model.companyDepartmentTextController,
                            focusNode: _model.companyDepartmentFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.companyDepartmentTextController',
                              Duration(milliseconds: 100),
                              () => safeSetState(() {}),
                            ),
                            autofocus: true,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelText: 'Designation',
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
                            maxLength: 50,
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
                                .companyDepartmentTextControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              if (!isAndroid && !isiOS)
                                TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                  return TextEditingValue(
                                    selection: newValue.selection,
                                    text: newValue.text.toCapitalization(
                                        TextCapitalization.characters),
                                  );
                                }),
                            ],
                          ),
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
                                  _model.ownerCompanyBranchForm = true;
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    safeSetState(() =>
                                        _model.ownerCompanyBranchForm = false);
                                    return;
                                  }

                                  var companiesDesignationsRecordReference =
                                      CompaniesDesignationsRecord.collection
                                          .doc();
                                  await companiesDesignationsRecordReference
                                      .set({
                                    ...createCompaniesDesignationsRecordData(
                                      designationsName: _model
                                          .companyDepartmentTextController.text,
                                      companyDoc:
                                          _model.selectedCompany?.companyDoc,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'designations_created_time':
                                            FieldValue.serverTimestamp(),
                                      },
                                    ),
                                  });
                                  _model.ownerDesignationCreated =
                                      CompaniesDesignationsRecord
                                          .getDocumentFromData({
                                    ...createCompaniesDesignationsRecordData(
                                      designationsName: _model
                                          .companyDepartmentTextController.text,
                                      companyDoc:
                                          _model.selectedCompany?.companyDoc,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'designations_created_time':
                                            DateTime.now(),
                                      },
                                    ),
                                  }, companiesDesignationsRecordReference);

                                  await _model
                                      .ownerDesignationCreated!.reference
                                      .update(
                                          createCompaniesDesignationsRecordData(
                                    designationsDoc: _model
                                        .ownerDesignationCreated?.reference,
                                  ));
                                  await widget.designationlist?.call();
                                  safeSetState(() {
                                    _model.companyDepartmentTextController
                                        ?.clear();
                                  });
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Designation has been successfully created!',
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
                                          FlutterFlowTheme.of(context).success,
                                    ),
                                  );

                                  safeSetState(() {});
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
                          ]
                              .divide(SizedBox(width: 10.0))
                              .around(SizedBox(width: 10.0)),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 10.0))
                        .around(SizedBox(height: 10.0)),
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
