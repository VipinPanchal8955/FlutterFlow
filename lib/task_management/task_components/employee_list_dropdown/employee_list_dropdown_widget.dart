import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/others/empty_loading/empty_loading_widget.dart';
import '/others/no_data_found/no_data_found_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'employee_list_dropdown_model.dart';
export 'employee_list_dropdown_model.dart';

class EmployeeListDropdownWidget extends StatefulWidget {
  const EmployeeListDropdownWidget({
    super.key,
    required this.selectedEmployee,
  });

  final Future Function(List<UsersRecord> employee)? selectedEmployee;

  @override
  State<EmployeeListDropdownWidget> createState() =>
      _EmployeeListDropdownWidgetState();
}

class _EmployeeListDropdownWidgetState
    extends State<EmployeeListDropdownWidget> {
  late EmployeeListDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmployeeListDropdownModel());

    _model.searchEmployeeTaskFomTextController ??= TextEditingController();
    _model.searchEmployeeTaskFomFocusNode ??= FocusNode();

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
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: 700.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: FlutterFlowTheme.of(context).secondaryText,
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _model.searchEmployeeTaskFomTextController,
                    focusNode: _model.searchEmployeeTaskFomFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.searchEmployeeTaskFomTextController',
                      Duration(milliseconds: 100),
                      () async {
                        _model.searchText =
                            _model.searchEmployeeTaskFomTextController.text;
                        safeSetState(() {});
                      },
                    ),
                    autofocus: false,
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: false,
                      labelText: 'Search Employee',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Anwatrix_Font',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      suffixIcon: _model.searchEmployeeTaskFomTextController!
                              .text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                _model.searchEmployeeTaskFomTextController
                                    ?.clear();
                                _model.searchText = _model
                                    .searchEmployeeTaskFomTextController.text;
                                safeSetState(() {});
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Anwatrix_Font',
                          letterSpacing: 0.0,
                        ),
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    validator: _model
                        .searchEmployeeTaskFomTextControllerValidator
                        .asValidator(context),
                    inputFormatters: [
                      if (!isAndroid && !isiOS)
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          return TextEditingValue(
                            selection: newValue.selection,
                            text: newValue.text
                                .toCapitalization(TextCapitalization.words),
                          );
                        }),
                    ],
                  ),
                  Divider(
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ].divide(SizedBox(height: 10.0)).around(SizedBox(height: 10.0)),
              ),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 600.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).secondary,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: PagedListView<DocumentSnapshot<Object?>?,
                        UsersRecord>.separated(
                      pagingController: _model.setListViewController(
                        UsersRecord.collection
                            .where(
                              'user_status',
                              isEqualTo: UsersStatus.Active.name,
                            )
                            .where(
                              'user_role',
                              isEqualTo: Roles.User.name,
                            )
                            .where(
                              'display_name',
                              isGreaterThanOrEqualTo: _model.searchText,
                            )
                            .where(
                              'display_name',
                              isLessThanOrEqualTo:
                                  '${_model.searchText}\\uf8ff',
                            ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      shrinkWrap: true,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (_, __) => SizedBox(height: 10.0),
                      builderDelegate: PagedChildBuilderDelegate<UsersRecord>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: Container(
                            width: 0.0,
                            height: 0.0,
                            child: EmptyLoadingWidget(),
                          ),
                        ),
                        // Customize what your widget looks like when it's loading another page.
                        newPageProgressIndicatorBuilder: (_) => Center(
                          child: Container(
                            width: 0.0,
                            height: 0.0,
                            child: EmptyLoadingWidget(),
                          ),
                        ),
                        noItemsFoundIndicatorBuilder: (_) => Center(
                          child: NoDataFoundWidget(),
                        ),
                        itemBuilder: (context, _, listViewIndex) {
                          final listViewUsersRecord = _model
                              .listViewPagingController!
                              .itemList![listViewIndex];
                          return Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: CircleBorder(),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValueMap[
                                        listViewUsersRecord] ??= false,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.checkboxValueMap[
                                              listViewUsersRecord] = newValue!);
                                    },
                                    side: (FlutterFlowTheme.of(context)
                                                .alternate !=
                                            null)
                                        ? BorderSide(
                                            width: 2,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          )
                                        : null,
                                    activeColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    checkColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                                Text(
                                  listViewUsersRecord.employeeid,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Anwatrix_Font',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  listViewUsersRecord.displayName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Anwatrix_Font',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).deleteAndCancle,
                        icon: Icon(
                          Icons.cancel_presentation_rounded,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.save_rounded,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await widget.selectedEmployee?.call(
                        _model.checkboxCheckedItems,
                      );
                      Navigator.pop(context);
                    },
                  ),
                ].divide(SizedBox(width: 10.0)).around(SizedBox(width: 10.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
