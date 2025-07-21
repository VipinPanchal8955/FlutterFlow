import '/backend/ai_agents/ai_agent.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/task_management/task_components/employee_list_dropdown/employee_list_dropdown_widget.dart';
import '/task_management/task_components/read_only_text_field_component/read_only_text_field_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'add_task_form_model.dart';
export 'add_task_form_model.dart';

class AddTaskFormWidget extends StatefulWidget {
  const AddTaskFormWidget({super.key});

  @override
  State<AddTaskFormWidget> createState() => _AddTaskFormWidgetState();
}

class _AddTaskFormWidgetState extends State<AddTaskFormWidget> {
  late AddTaskFormModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddTaskFormModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 50.0, 12.0, 0.0),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 700.0,
          maxHeight: 630.0,
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
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                              'Add Task Form',
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
                                'Please enter task details below to create their profile.',
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
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Select Employee',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Anwatrix_Font',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Builder(
                                              builder: (context) =>
                                                  FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                fillColor: Colors.transparent,
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
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
                                                        child: Container(
                                                          height: 700.0,
                                                          width: 300.0,
                                                          child:
                                                              EmployeeListDropdownWidget(
                                                            selectedEmployee:
                                                                (employee) async {
                                                              _model.selectedEmployee =
                                                                  employee
                                                                      .toList()
                                                                      .cast<
                                                                          UsersRecord>();
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(width: 10.0))
                                          .around(SizedBox(width: 10.0)),
                                    ),
                                  ),
                                  Container(
                                    height: 80.0,
                                    constraints: BoxConstraints(
                                      maxHeight: 300.0,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final selectedEmployeeData = _model
                                              .selectedEmployee
                                              .toList();

                                          return ListView.separated(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                selectedEmployeeData.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 10.0),
                                            itemBuilder: (context,
                                                selectedEmployeeDataIndex) {
                                              final selectedEmployeeDataItem =
                                                  selectedEmployeeData[
                                                      selectedEmployeeDataIndex];
                                              return Card(
                                                clipBehavior: Clip
                                                    .antiAliasWithSaveLayer,
                                                color: FlutterFlowTheme.of(
                                                        context)
                                                    .secondaryBackground,
                                                elevation: 2.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .readOnlyTextFieldComponentModels
                                                      .getModel(
                                                    selectedEmployeeDataItem
                                                        .usersDoc!.id,
                                                    selectedEmployeeDataIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  updateOnChange: true,
                                                  child:
                                                      ReadOnlyTextFieldComponentWidget(
                                                    key: Key(
                                                      'Keyghw_${selectedEmployeeDataItem.usersDoc!.id}',
                                                    ),
                                                    employeeID:
                                                        selectedEmployeeDataItem
                                                            .employeeid,
                                                    employeeName:
                                                        selectedEmployeeDataItem
                                                            .displayName,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.taskFrequencyValueController ??=
                                        FormFieldController<String>(null),
                                options: TaskFrequency.values
                                    .map((e) => e.name)
                                    .toList(),
                                onChanged: (val) => safeSetState(
                                    () => _model.taskFrequencyValue = val),
                                height: 52.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Anwatrix_Font',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Task_Frequency',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).secondary,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 52.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Text(
                                        () {
                                          if (_model.selectedDate == null) {
                                            return 'Select Task Start Date';
                                          } else if (_model.selectedDate !=
                                              null) {
                                            return dateTimeFormat("dd-MMM-yyyy",
                                                _model.selectedDate);
                                          } else {
                                            return '';
                                          }
                                        }(),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Anwatrix_Font',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 51.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).secondary,
                                icon: Icon(
                                  Icons.calendar_month,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  final _datePickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: getCurrentTimestamp,
                                    firstDate: getCurrentTimestamp,
                                    lastDate: DateTime(2050),
                                  );

                                  if (_datePickedDate != null) {
                                    safeSetState(() {
                                      _model.datePicked = DateTime(
                                        _datePickedDate.year,
                                        _datePickedDate.month,
                                        _datePickedDate.day,
                                      );
                                    });
                                  } else if (_model.datePicked != null) {
                                    safeSetState(() {
                                      _model.datePicked = getCurrentTimestamp;
                                    });
                                  }
                                  _model.selectedDate = _model.datePicked;
                                  safeSetState(() {});
                                },
                              ),
                            ]
                                .divide(SizedBox(width: 10.0))
                                .around(SizedBox(width: 10.0)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              constraints: BoxConstraints(
                                maxHeight: 300.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: false,
                                textCapitalization: TextCapitalization.words,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Assignee Task',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Anwatrix_Font',
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Anwatrix_Font',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
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
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Anwatrix_Font',
                                      letterSpacing: 0.0,
                                    ),
                                maxLines: null,
                                minLines: 1,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  if (!isAndroid && !isiOS)
                                    TextInputFormatter.withFunction(
                                        (oldValue, newValue) {
                                      return TextEditingValue(
                                        selection: newValue.selection,
                                        text: newValue.text.toCapitalization(
                                            TextCapitalization.words),
                                      );
                                    }),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Is Completion Photo Mandatory ?',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Anwatrix_Font',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: CircleBorder(),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                        ),
                                        child: Checkbox(
                                          value: _model.checkboxValue ??= false,
                                          onChanged:
                                              ((_model.taskFrequencyValue !=
                                                                  null &&
                                                              _model.taskFrequencyValue !=
                                                                  '') &&
                                                          (_model.textController
                                                                      .text !=
                                                                  '') &&
                                                          (_model.datePicked !=
                                                              null)
                                                      ? true
                                                      : false)
                                                  ? null
                                                  : (newValue) async {
                                                      safeSetState(() =>
                                                          _model.checkboxValue =
                                                              newValue!);
                                                    },
                                          side: (FlutterFlowTheme.of(context)
                                                      .alternate !=
                                                  null)
                                              ? BorderSide(
                                                  width: 2,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                )
                                              : null,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              ((_model.taskFrequencyValue !=
                                                                  null &&
                                                              _model.taskFrequencyValue !=
                                                                  '') &&
                                                          (_model.textController
                                                                      .text !=
                                                                  '') &&
                                                          (_model.datePicked !=
                                                              null)
                                                      ? true
                                                      : false)
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .info,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 52.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).secondary,
                                icon: Icon(
                                  Icons.save_rounded,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  _model.formValid = true;
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    safeSetState(
                                        () => _model.formValid = false);
                                    return;
                                  }
                                  if (_model.taskFrequencyValue == null) {
                                    _model.formValid = false;
                                    safeSetState(() {});
                                    return;
                                  }
                                  if (_model.datePicked == null) {
                                    _model.formValid = false;
                                    safeSetState(() {});
                                    return;
                                  }
                                  await callAiAgent(
                                    context: context,
                                    prompt: _model.textController.text,
                                    threadId: valueOrDefault<String>(
                                      FFAppState().CurentUserLogin.usersDoc?.id,
                                      'NA',
                                    ),
                                    agentCloudFunctionName:
                                        'taskTittleAndMessage',
                                    provider: 'GOOGLE',
                                    agentJson:
                                        "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"taskTittleAndMessage\",\"key\":\"hu39s\"},\"name\":\"Task Tittle And Message\",\"description\":\"EnglishGuru is a language refinement assistant. It receives raw or casually written task inputs (in any style or tone) from users, rewrites them into polished, easy‑to‑understand professional English, and generates a concise, professional English title for each task. Its goal is to simplify, clarify, and improve grammar while preserving the original meaning.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.0-flash\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":8192},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are **EnglishGuru** — a friendly language expert who rewrites casual or unstructured task inputs into clear, professional English for workplace use.\\n\\n❖ Guidelines\\n1. Use simple, polite wording; avoid jargon or complex phrases.  \\n2. Preserve the original meaning.  \\n3. Keep it short, clear, and friendly.  \\n4. Do not add comments or explanations — output only the result.\\n\\n❖ Return format (JSON only)\\n{\\n  \\\"title\\\": \\\"<Concise English title>\\\",\\n  \\\"message\\\": \\\"<Rephrased task in English>\\\"\\n}\\n\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"JSON\"}}",
                                    responseType: 'JSON',
                                  ).then((generatedText) {
                                    safeSetState(() => _model
                                        .englishGuruResponse = generatedText);
                                  });

                                  for (int loop1Index = 0;
                                      loop1Index <=
                                          _model.selectedEmployee.length;
                                      loop1Index++) {
                                    final currentLoop1Item =
                                        _model.selectedEmployee[loop1Index];

                                    var taskManagementRecordReference =
                                        TaskManagementRecord.collection.doc();
                                    await taskManagementRecordReference.set({
                                      ...createTaskManagementRecordData(
                                        employeeId: currentLoop1Item.employeeid,
                                        employeeName:
                                            currentLoop1Item.displayName,
                                        taskFrequency:
                                            _model.taskFrequencyValue,
                                        employeeTask: getJsonField(
                                          _model.englishGuruResponse,
                                          r'''$.message''',
                                        ).toString(),
                                        employeeNumber:
                                            currentLoop1Item.phoneNumber,
                                        usersDoc: currentLoop1Item.usersDoc,
                                        taskAssignedByName: FFAppState()
                                            .CurentUserLogin
                                            .displayName,
                                        taskAssignedByNumber: FFAppState()
                                            .CurentUserLogin
                                            .phoneNumber,
                                        companyName:
                                            currentLoop1Item.companyName,
                                        branchName:
                                            currentLoop1Item.userBranchName,
                                        departmentName:
                                            currentLoop1Item.userDepartmentName,
                                        designationName: currentLoop1Item
                                            .userDesignationName,
                                        taskImplementDate: _model.datePicked,
                                        companyDoc: currentLoop1Item.companyDoc,
                                        taskStatus: TaskStatus.Pending.name,
                                        userStatus: currentLoop1Item.userStatus,
                                        isTaskRequiredProof:
                                            _model.checkboxValue,
                                        taskTitle: getJsonField(
                                          _model.englishGuruResponse,
                                          r'''$.title''',
                                        ).toString(),
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'task_assigned_date':
                                              FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                    _model.taskAssigne = TaskManagementRecord
                                        .getDocumentFromData({
                                      ...createTaskManagementRecordData(
                                        employeeId: currentLoop1Item.employeeid,
                                        employeeName:
                                            currentLoop1Item.displayName,
                                        taskFrequency:
                                            _model.taskFrequencyValue,
                                        employeeTask: getJsonField(
                                          _model.englishGuruResponse,
                                          r'''$.message''',
                                        ).toString(),
                                        employeeNumber:
                                            currentLoop1Item.phoneNumber,
                                        usersDoc: currentLoop1Item.usersDoc,
                                        taskAssignedByName: FFAppState()
                                            .CurentUserLogin
                                            .displayName,
                                        taskAssignedByNumber: FFAppState()
                                            .CurentUserLogin
                                            .phoneNumber,
                                        companyName:
                                            currentLoop1Item.companyName,
                                        branchName:
                                            currentLoop1Item.userBranchName,
                                        departmentName:
                                            currentLoop1Item.userDepartmentName,
                                        designationName: currentLoop1Item
                                            .userDesignationName,
                                        taskImplementDate: _model.datePicked,
                                        companyDoc: currentLoop1Item.companyDoc,
                                        taskStatus: TaskStatus.Pending.name,
                                        userStatus: currentLoop1Item.userStatus,
                                        isTaskRequiredProof:
                                            _model.checkboxValue,
                                        taskTitle: getJsonField(
                                          _model.englishGuruResponse,
                                          r'''$.title''',
                                        ).toString(),
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'task_assigned_date': DateTime.now(),
                                        },
                                      ),
                                    }, taskManagementRecordReference);

                                    await _model.taskAssigne!.reference
                                        .update(createTaskManagementRecordData(
                                      taskDoc: _model.taskAssigne?.reference,
                                    ));
                                  }

                                  safeSetState(() {});
                                },
                              ),
                            ]
                                .divide(SizedBox(width: 10.0))
                                .around(SizedBox(width: 10.0)),
                          ),
                        ]
                            .divide(SizedBox(height: 5.0))
                            .around(SizedBox(height: 5.0)),
                      ),
                    ),
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
