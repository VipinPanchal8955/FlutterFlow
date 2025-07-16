import '/backend/ai_agents/ai_agent.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/component/web_navbar/web_navbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().CurentUserLogin.userRole == Roles.Admin.name) {
        await Future.wait([
          Future(() async {
            _model.gETCompaniesCollectionAdmin =
                await FirebaseCollectionAPIForAdminGroup
                    .gETCompaniesCollectionAdminCall
                    .call();
          }),
          Future(() async {
            _model.gETUserCollectionAdmin =
                await FirebaseCollectionAPIForAdminGroup
                    .gETUserCollectionAdminCall
                    .call();
          }),
          Future(() async {
            _model.gETBranchCollectionAdmin =
                await FirebaseCollectionAPIForAdminGroup
                    .gETBranchCollectionAdminCall
                    .call();
          }),
          Future(() async {
            _model.gETDepartmentCollectionAdmin =
                await FirebaseCollectionAPIForAdminGroup
                    .gETDepartmentCollectionAdminCall
                    .call();
          }),
          Future(() async {
            _model.gETDesignationCollectionAdmin =
                await FirebaseCollectionAPIForAdminGroup
                    .gETDesignationCollectionAdminCall
                    .call();
          }),
        ]);
        if ((_model.gETCompaniesCollectionAdmin?.succeeded ?? true) &&
            (_model.gETUserCollectionAdmin?.succeeded ?? true) &&
            (_model.gETBranchCollectionAdmin?.succeeded ?? true) &&
            (_model.gETDepartmentCollectionAdmin?.succeeded ?? true) &&
            (_model.gETDesignationCollectionAdmin?.succeeded ?? true)) {
          _model.companyListData =
              ((_model.gETCompaniesCollectionAdmin?.jsonBody ?? '')
                      .toList()
                      .map<CompnayListStruct?>(CompnayListStruct.maybeFromMap)
                      .toList() as Iterable<CompnayListStruct?>)
                  .withoutNulls
                  .toList()
                  .cast<CompnayListStruct>();
          _model.usersListData =
              ((_model.gETUserCollectionAdmin?.jsonBody ?? '')
                      .toList()
                      .map<UsersListStruct?>(UsersListStruct.maybeFromMap)
                      .toList() as Iterable<UsersListStruct?>)
                  .withoutNulls
                  .toList()
                  .cast<UsersListStruct>();
          _model.branchListData =
              ((_model.gETBranchCollectionAdmin?.jsonBody ?? '')
                      .toList()
                      .map<BranchesListStruct?>(BranchesListStruct.maybeFromMap)
                      .toList() as Iterable<BranchesListStruct?>)
                  .withoutNulls
                  .toList()
                  .cast<BranchesListStruct>();
          _model.departmentListData =
              ((_model.gETDepartmentCollectionAdmin?.jsonBody ?? '')
                      .toList()
                      .map<DepartmentsListStruct?>(
                          DepartmentsListStruct.maybeFromMap)
                      .toList() as Iterable<DepartmentsListStruct?>)
                  .withoutNulls
                  .toList()
                  .cast<DepartmentsListStruct>();
          _model.designationListData =
              ((_model.gETDesignationCollectionAdmin?.jsonBody ?? '')
                      .toList()
                      .map<DesignationsListStruct?>(
                          DesignationsListStruct.maybeFromMap)
                      .toList() as Iterable<DesignationsListStruct?>)
                  .withoutNulls
                  .toList()
                  .cast<DesignationsListStruct>();
          safeSetState(() {});
          return;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'An unexpected error occurred. Please refresh the page or try again.',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Anwatrix_Font',
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      letterSpacing: 0.0,
                    ),
                textAlign: TextAlign.center,
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).deleteAndCancle,
            ),
          );
          return;
        }
      } else if (FFAppState().CurentUserLogin.userRole == Roles.Owner.name) {
        await Future.wait([
          Future(() async {
            _model.gETCompaniesCollectionOwner =
                await FirebaseCollectionAPIForOwnerGroup
                    .gETCompaniesCollectionOwnerCall
                    .call(
              companyDoc: FFAppState().CurentUserLogin.companyDoc?.id,
            );
          }),
          Future(() async {
            _model.gETUserCollectionOwner =
                await FirebaseCollectionAPIForOwnerGroup
                    .gETUserCollectionOwnerCall
                    .call(
              companyDoc: FFAppState().CurentUserLogin.companyDoc?.id,
            );
          }),
          Future(() async {
            _model.gETBranchCollectionOwner =
                await FirebaseCollectionAPIForOwnerGroup
                    .gETBranchCollectionOwnerCall
                    .call(
              companyDoc: FFAppState().CurentUserLogin.companyDoc?.id,
            );
          }),
          Future(() async {
            _model.gETDepartmentsCollectionOwner =
                await FirebaseCollectionAPIForOwnerGroup
                    .gETDepartmentsCollectionOwnerCall
                    .call(
              companyDoc: FFAppState().CurentUserLogin.companyDoc?.id,
            );
          }),
          Future(() async {
            _model.gETDesignationCollectionOwner =
                await FirebaseCollectionAPIForOwnerGroup
                    .gETDesignationsCollectionOwnerCall
                    .call(
              companyDoc: FFAppState().CurentUserLogin.companyDoc?.id,
            );
          }),
        ]);
        if ((_model.gETCompaniesCollectionOwner?.succeeded ?? true) &&
            (_model.gETUserCollectionOwner?.succeeded ?? true) &&
            (_model.gETBranchCollectionOwner?.succeeded ?? true) &&
            (_model.gETDepartmentsCollectionOwner?.succeeded ?? true) &&
            (_model.gETDesignationCollectionOwner?.succeeded ?? true)) {
          _model.companyListData =
              ((_model.gETCompaniesCollectionOwner?.jsonBody ?? '')
                      .toList()
                      .map<CompnayListStruct?>(CompnayListStruct.maybeFromMap)
                      .toList() as Iterable<CompnayListStruct?>)
                  .withoutNulls
                  .toList()
                  .cast<CompnayListStruct>();
          _model.usersListData =
              ((_model.gETUserCollectionOwner?.jsonBody ?? '')
                      .toList()
                      .map<UsersListStruct?>(UsersListStruct.maybeFromMap)
                      .toList() as Iterable<UsersListStruct?>)
                  .withoutNulls
                  .toList()
                  .cast<UsersListStruct>();
          _model.branchListData =
              ((_model.gETBranchCollectionOwner?.jsonBody ?? '')
                      .toList()
                      .map<BranchesListStruct?>(BranchesListStruct.maybeFromMap)
                      .toList() as Iterable<BranchesListStruct?>)
                  .withoutNulls
                  .toList()
                  .cast<BranchesListStruct>();
          _model.designationListData =
              ((_model.gETDesignationCollectionOwner?.jsonBody ?? '')
                      .toList()
                      .map<DesignationsListStruct?>(
                          DesignationsListStruct.maybeFromMap)
                      .toList() as Iterable<DesignationsListStruct?>)
                  .withoutNulls
                  .toList()
                  .cast<DesignationsListStruct>();
          _model.departmentListData =
              ((_model.gETDepartmentsCollectionOwner?.jsonBody ?? '')
                      .toList()
                      .map<DepartmentsListStruct?>(
                          DepartmentsListStruct.maybeFromMap)
                      .toList() as Iterable<DepartmentsListStruct?>)
                  .withoutNulls
                  .toList()
                  .cast<DepartmentsListStruct>();
          safeSetState(() {});
          return;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'An unexpected error occurred. Please refresh the page or try again.',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Anwatrix_Font',
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      letterSpacing: 0.0,
                    ),
                textAlign: TextAlign.center,
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).deleteAndCancle,
            ),
          );
          return;
        }
      } else {
        return;
      }
    });

    _model.userTextFieldTextController ??= TextEditingController();
    _model.userTextFieldFocusNode ??= FocusNode();

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
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final taskChatList = _model.chatList.toList();

                              return ListView.separated(
                                padding: EdgeInsets.symmetric(vertical: 20.0),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: taskChatList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 20.0),
                                itemBuilder: (context, taskChatListIndex) {
                                  final taskChatListItem =
                                      taskChatList[taskChatListIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        valueOrDefault<double>(
                                          taskChatListItem.chatRole ==
                                                  ChatRole.user
                                              ? 250.0
                                              : 0.0,
                                          0.0,
                                        ),
                                        0.0,
                                        valueOrDefault<double>(
                                          taskChatListItem.chatRole ==
                                                  ChatRole.assistant
                                              ? 250.0
                                              : 0.0,
                                          0.0,
                                        ),
                                        0.0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: () {
                                        if (taskChatListItem.chatRole ==
                                            ChatRole.user) {
                                          return Color(0xFFF0FFFF);
                                        } else if (taskChatListItem.chatRole ==
                                            ChatRole.assistant) {
                                          return Color(0xFFF5F5F5);
                                        } else {
                                          return Color(0x00000000);
                                        }
                                      }(),
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: MarkdownBody(
                                                data: taskChatListItem.message,
                                                selectable: true,
                                                onTapLink: (_, url, __) =>
                                                    launchURL(url!),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: Text(
                                                dateTimeFormat(
                                                    "dd-MMM-yyyy H:m",
                                                    getCurrentTimestamp),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Anwatrix_Font',
                                                          fontSize: 9.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 25.0)),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                controller: _model.listViewController,
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 100.0,
                                  maxHeight: 250.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                                child: Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller:
                                          _model.userTextFieldTextController,
                                      focusNode: _model.userTextFieldFocusNode,
                                      autofocus: true,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Anwatrix_Font',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Write Your Message',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Anwatrix_Font',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                                      keyboardType: TextInputType.multiline,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .userTextFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).active,
                              icon: Icon(
                                Icons.send_rounded,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                var _shouldSetState = false;
                                _model.addToChatList(AIAgentStruct(
                                  chatRole: ChatRole.user,
                                  message:
                                      _model.userTextFieldTextController.text,
                                ));
                                safeSetState(() {});
                                await callAiAgent(
                                  context: context,
                                  prompt:
                                      'User Name: ${FFAppState().CurentUserLogin.displayName}User Gener: ${FFAppState().CurentUserLogin.gender}User Number: ${FFAppState().CurentUserLogin.phoneNumber}User role In Compnay: ${FFAppState().CurentUserLogin.userRole}user msg for you: ${_model.userTextFieldTextController.text}lastagentcalled: ${_model.lastagentcalled}lasttopic: ${_model.lasttopic}lasttopic: ${_model.lastlanguage}',
                                  threadId: valueOrDefault<String>(
                                    FFAppState().CurentUserLogin.usersDoc?.id,
                                    'N/A',
                                  ),
                                  agentCloudFunctionName: 'jarvis',
                                  provider: 'OPENAI',
                                  agentJson: null,
                                  responseType: 'JSON',
                                ).then((generatedText) {
                                  safeSetState(() =>
                                      _model.jarvisResponse = generatedText);
                                });

                                _shouldSetState = true;
                                await _model.listViewController?.animateTo(
                                  _model.listViewController!.position
                                      .maxScrollExtent,
                                  duration: Duration(milliseconds: 100),
                                  curve: Curves.ease,
                                );
                                safeSetState(() {
                                  _model.userTextFieldTextController?.clear();
                                });
                                safeSetState(() {
                                  _model.userTextFieldTextController?.text =
                                      ((String? var1) {
                                    return '';
                                  }(_model.userTextFieldTextController.text));
                                  _model.userTextFieldFocusNode?.requestFocus();
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    _model.userTextFieldTextController
                                            ?.selection =
                                        const TextSelection.collapsed(
                                            offset: 0);
                                  });
                                });
                                _model.lastagentcalled =
                                    JarvisResponseStruct.maybeFromMap(
                                            _model.jarvisResponse)
                                        ?.callAgent;
                                _model.lasttopic =
                                    JarvisResponseStruct.maybeFromMap(
                                            _model.jarvisResponse)
                                        ?.followupPrompt;
                                _model.lastlanguage =
                                    JarvisResponseStruct.maybeFromMap(
                                            _model.jarvisResponse)
                                        ?.language;
                                safeSetState(() {});
                                if (JarvisResponseStruct.maybeFromMap(
                                            _model.jarvisResponse)
                                        ?.callAgent ==
                                    'Sophia') {
                                  await callAiAgent(
                                    context: context,
                                    prompt:
                                        'The user\'s question is: ${JarvisResponseStruct.maybeFromMap(_model.jarvisResponse)?.followupPrompt}\\n\\nHere is the relevant company data from Firebase:\\n${functions.formatCompanyDataForAI(_model.companyListData.toList())}',
                                    threadId: valueOrDefault<String>(
                                      FFAppState().CurentUserLogin.usersDoc?.id,
                                      'N/A',
                                    ),
                                    agentCloudFunctionName: 'companiesListAI',
                                    provider: 'GOOGLE',
                                    agentJson:
                                        "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"companiesListAI\",\"key\":\"eawjl\"},\"name\":\"Companies List AI\",\"description\":\"Sophia is a sharp, friendly AI assistant who answers questions about company data. She responds only using the provided dataset, always matches the user's language, and replies warmly and professionally. If a detail isn't available, Sophia politely lets the user know.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":50000},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are Sophia: a warm, friendly, and highly professional specialist. Your only job is to answer questions about company data, using ONLY the company data provided in the prompt (via followup_prompt or context). You cannot use any outside knowledge.\\n\\n---\\nGOLDEN RULES\\n\\n- The Data is Your World: Only answer using the provided company data. Never guess or use outside knowledge.\\n- Speak Their Language: Always reply in the language of the user's last message or as instructed in followup_prompt.  \\n    - If the user requests or mentions \\\"Hinglish\\\", \\\"mix language\\\", \\\"Roman Hindi\\\", or \\\"English + Hindi\\\", **reply in Hinglish** (simple English + Roman Hindi mix).\\n    - Example:  \\n      - User: \\\"Sorry, Hinglish me batao\\\"  \\n      - Sophia: \\\"Namaste! Mera naam Sophia hai, aur main aapki company data specialist hoon. Mere paas company ki details ready hain. Yaha vo companies hain: 1. KLG AND CO 2. ANAVATRIX. Shuru karne ke liye, aap serial number likh do ya koi bhi question pooch lo.\\\"\\n    - If the user requests any specific language, always reply in that language—even if it's mixed or non-standard.\\n- Handling What's Not There: If the answer cannot be found in the data, respond with:\\n  - English: \\\"That's a great question. I've looked through the information I have, but unfortunately, I don't have that specific detail.\\\"\\n  - Hindi: \\\"यह एक अच्छा सवाल है। मैंने दी गई जानकारी को जांच लिया है, लेकिन दुर्भाग्य से, मेरे पास यह विशेष जानकारी नहीं है।\\\"\\n  - Hinglish: \\\"Good question! Mainne company ki info check kar li, lekin yeh detail mere paas nahi hai.\\\"\\n  - For any other language, translate and reply politely.\\n- Data Presentation Rule: If any field in the provided company data is marked as N/A, NA, or blank, do NOT include it in your reply.\\n- Confidential Fields Rule: Never share internal reference fields like doc_id, company_doc, branch_doc, or any document references, even if present in the data.\\n- Never reply with only `{}` or `[]`. Always reply with a friendly, human message if data is missing.\\n\\n---\\nINTERACTION FLOW\\n\\nOn the user’s FIRST message:\\n- Greet and introduce yourself in the user’s language.\\n  - Example (English): \\\"Hello! My name is Sophia, and I'm your company data specialist. I have specific company information ready and would love to answer your questions.\\\"\\n  - Example (Hinglish): \\\"Namaste! Mera naam Sophia hai, aur main aapki company data specialist hoon. Mere paas company ki details ready hain, aap serial number ya question bhej sakte ho.\\\"\\n- Show a numbered list of all available companies from the data (in the same language).\\n  - Format: Sr. No: Company Name\\n- Guide the user: \\\"To get started, you can reply with the serial number for a company overview, or ask me a specific question.\\\" (Translate as needed)\\n\\nOn ALL subsequent messages:\\n- If the user gives a serial number: “Of course! Here is the information on [Company Name]…” then show details in their language.\\n- If the user asks a direct or comparative question: Find the answer using the data and reply conversationally, in their language.\\n- If they ask for the company list again, show it in their language.\\n- If the answer isn’t available, use the missing-data message in their language.\\n- If user ever requests a different language, immediately switch and politely confirm.\\n\\n---\\nOUTPUT FORMAT (for internal system use only):\\n\\n{\\n  \\\"message\\\": \\\"<Sophia's reply here, always human-like and never just {} or []>\\\",\\n  \\\"call_agent\\\": \\\"Sophia\\\",\\n  \\\"followup_prompt\\\": \\\"<next user's expected intent, question, or topic>\\\",\\n  \\\"language\\\": \\\"<reply language>\\\"\\n}\\n\\nShow only the `message` value to the user.  \\nUse the other fields for workflow only.\\n\\n---\\n**Golden Rules:**  \\n> - Always reply in the same language as the user’s message or as requested (you can answer in any language the user wants).  \\n> - If the followup_prompt or Jarvis indicates a specific language, reply in that language.\\n> - Never mention internal technical details, JSON, or code to the user.  \\n> - Always greet and personalize as per the user's name and language.\\n\\nNever mention JSON, code, or technical details to the user.  \\nNever reply with just `{}` or `[]`—always send a human message in the right language.  \\nYou are Sophia. Stay warm, human, and company-data only!\\n\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"JSON\"}}",
                                    responseType: 'JSON',
                                  ).then((generatedText) {
                                    safeSetState(() =>
                                        _model.sophiaResponse = generatedText);
                                  });

                                  _shouldSetState = true;
                                  _model.addToChatList(AIAgentStruct(
                                    chatRole: ChatRole.assistant,
                                    message: AIAgentStruct.maybeFromMap(
                                            _model.sophiaResponse)
                                        ?.message,
                                  ));
                                  _model.lastagentcalled =
                                      AIAgentStruct.maybeFromMap(
                                              _model.sophiaResponse)
                                          ?.callAgent;
                                  _model.lasttopic = AIAgentStruct.maybeFromMap(
                                          _model.sophiaResponse)
                                      ?.followupPrompt;
                                  _model.lastlanguage =
                                      AIAgentStruct.maybeFromMap(
                                              _model.sophiaResponse)
                                          ?.language;
                                  safeSetState(() {});
                                  await _model.listViewController?.animateTo(
                                    _model.listViewController!.position
                                        .maxScrollExtent,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.ease,
                                  );
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else if (JarvisResponseStruct.maybeFromMap(
                                            _model.jarvisResponse)
                                        ?.callAgent ==
                                    'Elara') {
                                  await callAiAgent(
                                    context: context,
                                    prompt:
                                        'The user\'s question is: ${JarvisResponseStruct.maybeFromMap(_model.jarvisResponse)?.followupPrompt}\\n\\nHere is the relevant branch data from Firebase:\\n${functions.formateBranchDataForAI(_model.branchListData.toList())}',
                                    threadId: valueOrDefault<String>(
                                      FFAppState().CurentUserLogin.usersDoc?.id,
                                      'N/A',
                                    ),
                                    agentCloudFunctionName: 'branchListAI',
                                    provider: 'GOOGLE',
                                    agentJson:
                                        "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"branchListAI\",\"key\":\"sa3zk\"},\"name\":\"Branch List AI\",\"description\":\"Elara is a smart and dependable AI assistant built to manage, retrieve, and guide users about all company branches and their information. She always communicates in a friendly, human-like manner—not like a robot. Elara answers only from the provided data, responds in the user's language, and politely lets the user know if any information is unavailable.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":50000},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are Elara: a warm, friendly, and highly professional specialist. Your only job is to answer questions about branch data, using ONLY the branch data provided in the prompt (via followup_prompt or context). You cannot use any outside knowledge.\\n\\n---\\nGOLDEN RULES\\n\\n- The Data is Your World: Only answer using the provided branch data. Never guess or use outside knowledge.\\n- Speak Their Language: Always reply in the language of the user's last message or as indicated in followup_prompt.\\n    - If the user requests any specific language (e.g., \\\"Punjabi me reply karo\\\", \\\"Kannada me batao\\\"), reply in that language. Elara can answer in any language in the world.\\n- Handling What's Not There: If the answer cannot be found in the data, respond with:\\n    - English: \\\"That's a good question. I've checked the branch information available, but unfortunately, I don't have that particular detail.\\\"\\n    - Hindi: \\\"यह एक अच्छा सवाल है। मैंने उपलब्ध शाखा जानकारी की जांच कर ली है, लेकिन दुर्भाग्य से, मेरे पास यह विशेष जानकारी नहीं है।\\\"\\n    - Hinglish: \\\"Good question! Maine saari branch info check kar li hai, lekin yeh detail mere paas nahi hai.\\\"\\n    - **Other language:** Politely translate and reply in that language.\\n- Data Presentation Rule: If any field in the branch data is N/A, NA, or blank, do NOT include it in your reply.\\n- Confidential Fields Rule: Never share internal reference fields like doc_id, document ID, branch_doc, or document references—even if present in the data. Only share branch codes/IDs if they are *explicitly* user-facing.\\n- Never reply with only `{}` or `[]`. Always reply with a friendly, human message if data is missing.\\n\\n---\\nINTERACTION FLOW\\n\\nOn the user’s FIRST message:\\n- Greet and introduce yourself in the user's language.\\n    - Example (English): \\\"Hello! My name is Elara, and I'm here to help you with your company's branches. I have specific branch records and would love to answer your questions.\\\"\\n    - Example (Hindi): \\\"नमस्ते! मेरा नाम एलारा है, और मैं आपकी कंपनी की शाखाओं के बारे में जानकारी देने के लिए यहाँ हूँ।\\\"\\n    - Example (Punjabi): \\\"ਸਤ ਸ੍ਰੀ ਅਕਾਲ! ਮੇਰਾ ਨਾਮ ਇਲਾਰਾ ਹੈ, ਮੈਂ ਤੁਹਾਡੀ ਕੰਪਨੀ ਦੀਆਂ ਸ਼ਾਖਾਵਾਂ ਬਾਰੇ ਜਾਣਕਾਰੀ ਲਈ ਇੱਥੇ ਹਾਂ।\\\"\\n    - If the user requests a specific language, reply in that language.\\n- Show a numbered list of all available branches from the data (same language).\\n    - Format: Sr. No: Branch Name\\n- Guide the user: \\\"To begin, you can reply with the serial number for a branch overview, or ask me about a specific branch or requirement.\\\" (translate as per user language)\\n\\nOn ALL subsequent messages:\\n- If user gives a serial number: \\\"Of course! Here is the information for [Branch Name]...\\\" (details in their language).\\n- If user asks a direct or comparative question: Find the answer in the data and reply conversationally, in the same language.\\n- If user asks for the branch list again, show it in the same language.\\n- If answer isn’t available, use the missing-data message above.\\n- If user ever requests a different language, immediately switch and politely confirm.\\n\\n---\\nOUTPUT FORMAT (for internal system use only):\\n\\n{\\n  \\\"message\\\": \\\"<Elara's reply here, always human-like and never just {} or []>\\\",\\n  \\\"call_agent\\\": \\\"Elara\\\",\\n  \\\"followup_prompt\\\": \\\"<next user's expected intent, question, or topic>\\\",\\n  \\\"language\\\": \\\"<reply language>\\\"\\n}\\n\\nShow only the `message` value to the user.  \\nUse the other fields for workflow only.\\n\\n---\\n**Golden Rules:**  \\n> - Always reply in the same language as the user’s message or as requested (you can answer in any language the user wants).  \\n> - If the followup_prompt or Jarvis indicates a specific language, reply in that language.\\n> - Never mention internal technical details, JSON, or code to the user.  \\n> - Always greet and personalize as per the user's name and language.\\n\\nNever mention JSON, code, or technical details to the user.  \\nNever reply with just `{}` or `[]`—always send a human message in the right language.  \\nYou are Elara. Stay warm, human, and branch-data only!\\n\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"JSON\"}}",
                                    responseType: 'JSON',
                                  ).then((generatedText) {
                                    safeSetState(() =>
                                        _model.elaraResponse = generatedText);
                                  });

                                  _shouldSetState = true;
                                  _model.addToChatList(AIAgentStruct(
                                    chatRole: ChatRole.assistant,
                                    message: AIAgentStruct.maybeFromMap(
                                            _model.elaraResponse)
                                        ?.message,
                                  ));
                                  _model.lastagentcalled =
                                      AIAgentStruct.maybeFromMap(
                                              _model.elaraResponse)
                                          ?.callAgent;
                                  _model.lasttopic = AIAgentStruct.maybeFromMap(
                                          _model.elaraResponse)
                                      ?.followupPrompt;
                                  _model.lastlanguage =
                                      AIAgentStruct.maybeFromMap(
                                              _model.elaraResponse)
                                          ?.language;
                                  safeSetState(() {});
                                  await _model.listViewController?.animateTo(
                                    _model.listViewController!.position
                                        .maxScrollExtent,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.ease,
                                  );
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else if (JarvisResponseStruct.maybeFromMap(
                                            _model.jarvisResponse)
                                        ?.callAgent ==
                                    'Lyra') {
                                  await callAiAgent(
                                    context: context,
                                    prompt:
                                        'The user\'s question is: ${JarvisResponseStruct.maybeFromMap(_model.jarvisResponse)?.followupPrompt}\\n\\nHere is the relevant department data from Firebase:\\n${functions.formateDepartmentDataForAI(_model.departmentListData.toList())}',
                                    threadId: valueOrDefault<String>(
                                      FFAppState().CurentUserLogin.usersDoc?.id,
                                      'N/A',
                                    ),
                                    agentCloudFunctionName: 'departmentListAI',
                                    provider: 'GOOGLE',
                                    agentJson:
                                        "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"departmentListAI\",\"key\":\"pohyu\"},\"name\":\"Department List AI\",\"description\":\"Mira is a smart, friendly AI assistant designed to help users manage, retrieve, and answer questions about company departments. She always responds in a warm, human-like way, only uses the given dataset, and communicates in the user's language. If any department information is missing, Lyra politely informs the user.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":50000},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are Lyra: a warm, friendly, and highly professional specialist. Your only job is to answer questions about company departments, using ONLY the department data provided in the prompt (via followup_prompt or context). You cannot use any outside knowledge.\\n\\n---\\nGOLDEN RULES\\n\\n- The Data is Your World: Only answer using the provided department data. Never guess or use outside knowledge.\\n- Speak Their Language: Always reply in the language of the user's last message or as instructed in followup_prompt.  \\n    - If the user requests or mentions \\\"Hinglish\\\", \\\"mix language\\\", \\\"Roman Hindi\\\", or \\\"English + Hindi\\\", **reply in Hinglish** (simple English + Roman Hindi mix).\\n    - Example:  \\n      - User: \\\"Sorry, Hinglish me batao\\\"  \\n      - Lyra: \\\"Namaste! Mera naam Lyra hai, aur main aapki company department specialist hoon. Mere paas departments ki details ready hain. Yaha vo departments hain: 1. Sales 2. HR. Shuru karne ke liye, aap serial number likh do ya koi bhi question pooch lo.\\\"\\n    - If the user requests any specific language, always reply in that language—even if it's mixed or non-standard.\\n- Handling What's Not There: If the answer cannot be found in the data, respond with:\\n  - English: \\\"That's a good question. I've checked the department information available, but unfortunately, I don't have that particular detail.\\\"\\n  - Hindi: \\\"यह एक अच्छा सवाल है। मैंने उपलब्ध विभाग जानकारी की जांच कर ली है, लेकिन दुर्भाग्य से, मेरे पास यह विशेष जानकारी नहीं है।\\\"\\n  - Hinglish: \\\"Good question! Mainne department ki info check kar li, lekin yeh detail mere paas nahi hai.\\\"\\n  - For any other language, translate and reply politely.\\n- Data Presentation Rule: If any field in the provided department data is marked as N/A, NA, or blank, do NOT include it in your reply.\\n- Confidential Fields Rule: Never share internal reference fields like doc_id, department_doc, or any document references, even if present in the data.\\n- Never reply with only `{}` or `[]`. Always reply with a friendly, human message if data is missing.\\n\\n---\\nINTERACTION FLOW\\n\\nOn the user’s FIRST message:\\n- Greet and introduce yourself in the user’s language.\\n  - Example (English): \\\"Hello! My name is Lyra, and I'm your department data specialist. I have specific department information ready and would love to answer your questions.\\\"\\n  - Example (Hinglish): \\\"Namaste! Mera naam Lyra hai, aur main aapki company department specialist hoon. Mere paas departments ki details ready hain, aap serial number ya question bhej sakte ho.\\\"\\n- Show a numbered list of all available departments from the data (in the same language).\\n  - Format: Sr. No: Department Name\\n- Guide the user: \\\"To get started, you can reply with the serial number for a department overview, or ask me a specific question.\\\" (Translate as needed)\\n\\nOn ALL subsequent messages:\\n- If the user gives a serial number: “Of course! Here is the information on [Department Name]…” then show details in their language.\\n- If the user asks a direct or comparative question: Find the answer using the data and reply conversationally, in their language.\\n- If they ask for the department list again, show it in their language.\\n- If the answer isn’t available, use the missing-data message in their language.\\n- If user ever requests a different language, immediately switch and politely confirm.\\n\\n---\\nOUTPUT FORMAT (for internal system use only):\\n\\n{\\n  \\\"message\\\": \\\"<Lyra's reply here, always human-like and never just {} or []>\\\",\\n  \\\"call_agent\\\": \\\"Lyra\\\",\\n  \\\"followup_prompt\\\": \\\"<next user's expected intent, question, or topic>\\\",\\n  \\\"language\\\": \\\"<reply language>\\\"\\n}\\n\\nShow only the `message` value to the user.  \\nUse the other fields for workflow only.\\n\\n---\\n**Golden Rules:**  \\n> - Always reply in the same language as the user’s message or as requested (you can answer in any language the user wants).  \\n> - If the followup_prompt or Jarvis indicates a specific language, reply in that language.\\n> - Never mention internal technical details, JSON, or code to the user.  \\n> - Always greet and personalize as per the user's name and language.\\n\\nNever mention JSON, code, or technical details to the user.  \\nNever reply with just `{}` or `[]`—always send a human message in the right language.  \\nYou are Lyra. Stay warm, human, and department-data only!\\n\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"JSON\"}}",
                                    responseType: 'JSON',
                                  ).then((generatedText) {
                                    safeSetState(() =>
                                        _model.lyraResponse = generatedText);
                                  });

                                  _shouldSetState = true;
                                  _model.addToChatList(AIAgentStruct(
                                    chatRole: ChatRole.assistant,
                                    message: AIAgentStruct.maybeFromMap(
                                            _model.lyraResponse)
                                        ?.message,
                                  ));
                                  _model.lastagentcalled =
                                      AIAgentStruct.maybeFromMap(
                                              _model.lyraResponse)
                                          ?.callAgent;
                                  _model.lasttopic = AIAgentStruct.maybeFromMap(
                                          _model.lyraResponse)
                                      ?.followupPrompt;
                                  _model.lastlanguage =
                                      AIAgentStruct.maybeFromMap(
                                              _model.lyraResponse)
                                          ?.language;
                                  safeSetState(() {});
                                  await _model.listViewController?.animateTo(
                                    _model.listViewController!.position
                                        .maxScrollExtent,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.ease,
                                  );
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else if (JarvisResponseStruct.maybeFromMap(
                                            _model.jarvisResponse)
                                        ?.callAgent ==
                                    'Vera') {
                                  await callAiAgent(
                                    context: context,
                                    prompt:
                                        'The user\'s question is: ${JarvisResponseStruct.maybeFromMap(_model.jarvisResponse)?.followupPrompt}\\n\\nHere is the relevant designation data from Firebase:\\n${functions.formateDesignationDataForAI(_model.designationListData.toList())}',
                                    threadId: valueOrDefault<String>(
                                      FFAppState().CurentUserLogin.usersDoc?.id,
                                      'N/A',
                                    ),
                                    agentCloudFunctionName: 'designationListAI',
                                    provider: 'GOOGLE',
                                    agentJson:
                                        "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"designationListAI\",\"key\":\"wa41t\"},\"name\":\"Designation List AI\",\"description\":\"Vera is a smart, friendly AI assistant built to help users manage, retrieve, and answer questions about company designations. She always responds in a warm, human-like way, only uses the given dataset, and communicates in the user's language. If any designation information is missing, Vera politely informs the user.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":50000},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are Vera: a warm, friendly, and highly professional specialist. Your only job is to answer questions about designation data, using ONLY the designation data provided in the prompt (via followup_prompt or context). You cannot use any outside knowledge.\\n\\n---\\nGOLDEN RULES\\n\\n- The Data is Your World: Only answer using the provided designation data. Never guess or use outside knowledge.\\n- Speak Their Language: Always reply in the language of the user's last message or as indicated in followup_prompt.\\n    - If the user requests any specific language (e.g., \\\"Punjabi me reply karo\\\", \\\"French me answer do\\\"), reply in that language. Vera can answer in any language in the world.\\n- Handling What's Not There: If the answer cannot be found in the data, respond with:\\n    - English: \\\"That's a good question. I've checked the designation information available, but unfortunately, I don't have that particular detail.\\\"\\n    - Hindi: \\\"यह एक अच्छा सवाल है। मैंने उपलब्ध पद जानकारी की जांच कर ली है, लेकिन दुर्भाग्य से, मेरे पास यह विशेष जानकारी नहीं है।\\\"\\n    - Hinglish: \\\"Good question! Maine designation records check kar liye hain, lekin yeh detail mere paas nahi hai.\\\"\\n    - **Other language:** Politely translate and reply in that language.\\n- Data Presentation Rule: If any field in the designation data is N/A, NA, or blank, do NOT include it in your reply.\\n- Confidential Fields Rule: Never share internal reference fields like doc_id, document ID, designation_doc, or document references—even if present in the data. Only share designation code/ID if it is *explicitly* user-facing.\\n- Never reply with only `{}` or `[]`. Always reply with a friendly, human message if data is missing.\\n\\n---\\nINTERACTION FLOW\\n\\nOn the user’s FIRST message:\\n- Greet and introduce yourself in the user's language.\\n    - Example (English): \\\"Hello! My name is Vera, and I'm here to help you with your company's designations. I have specific designation records and would love to answer your questions.\\\"\\n    - Example (Hindi): \\\"नमस्ते! मेरा नाम वेरा है, और मैं आपकी कंपनी के पदों के बारे में जानकारी देने के लिए यहाँ हूँ।\\\"\\n    - Example (Punjabi): \\\"ਸਤ ਸ੍ਰੀ ਅਕਾਲ! ਮੇਰਾ ਨਾਮ ਵੈਰਾ ਹੈ, ਮੈਂ ਤੁਹਾਡੀ ਕੰਪਨੀ ਦੇ ਡਿਜ਼ਾਈਨੇਸ਼ਨ ਬਾਰੇ ਜਾਣਕਾਰੀ ਲਈ ਇੱਥੇ ਹਾਂ।\\\"\\n    - If the user requests a specific language, reply in that language.\\n- Show a numbered list of all available designations from the data (same language).\\n    - Format: Sr. No: Designation Name\\n- Guide the user: \\\"To begin, you can reply with the serial number for a designation overview, or ask me about a specific designation or requirement.\\\" (translate as per user language)\\n\\nOn ALL subsequent messages:\\n- If user gives a serial number: \\\"Of course! Here is the information for [Designation Name]...\\\" (details in their language).\\n- If user asks a direct or comparative question: Find the answer in the data and reply conversationally, in the same language.\\n- If user asks for the designation list again, show it in the same language.\\n- If answer isn’t available, use the missing-data message above.\\n- If user ever requests a different language, immediately switch and politely confirm.\\n\\n---\\nOUTPUT FORMAT (for internal system use only):\\n\\n{\\n  \\\"message\\\": \\\"<Vera's reply here, always human-like and never just {} or []>\\\",\\n  \\\"call_agent\\\": \\\"Vera\\\",\\n  \\\"followup_prompt\\\": \\\"<next user's expected intent, question, or topic>\\\",\\n  \\\"language\\\": \\\"<reply language>\\\"\\n}\\n\\nShow only the `message` value to the user.  \\nUse the other fields for workflow only.\\n\\n---\\n**Golden Rules:**  \\n> - Always reply in the same language as the user’s message or as requested (you can answer in any language the user wants).  \\n> - If the followup_prompt or Jarvis indicates a specific language, reply in that language.\\n> - Never mention internal technical details, JSON, or code to the user.  \\n> - Always greet and personalize as per the user's name and language.\\n\\nNever mention JSON, code, or technical details to the user.  \\nNever reply with just `{}` or `[]`—always send a human message in the right language.  \\nYou are Vera. Stay warm, human, and designation-data only!\\n\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"JSON\"}}",
                                    responseType: 'JSON',
                                  ).then((generatedText) {
                                    safeSetState(() =>
                                        _model.veraResponse = generatedText);
                                  });

                                  _shouldSetState = true;
                                  _model.addToChatList(AIAgentStruct(
                                    chatRole: ChatRole.assistant,
                                    message: AIAgentStruct.maybeFromMap(
                                            _model.veraResponse)
                                        ?.message,
                                  ));
                                  _model.lastagentcalled =
                                      AIAgentStruct.maybeFromMap(
                                              _model.veraResponse)
                                          ?.callAgent;
                                  _model.lasttopic = AIAgentStruct.maybeFromMap(
                                          _model.veraResponse)
                                      ?.followupPrompt;
                                  _model.lastlanguage =
                                      AIAgentStruct.maybeFromMap(
                                              _model.veraResponse)
                                          ?.language;
                                  safeSetState(() {});
                                  await _model.listViewController?.animateTo(
                                    _model.listViewController!.position
                                        .maxScrollExtent,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.ease,
                                  );
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else if (JarvisResponseStruct.maybeFromMap(
                                            _model.jarvisResponse)
                                        ?.callAgent ==
                                    'Akira') {
                                  await callAiAgent(
                                    context: context,
                                    prompt:
                                        'The user\'s question is: ${JarvisResponseStruct.maybeFromMap(_model.jarvisResponse)?.followupPrompt}\\n\\nHere is the relevant user and employee data from Firebase:\\n${functions.formateUserDataForAI(_model.usersListData.toList())}',
                                    threadId: valueOrDefault<String>(
                                      FFAppState().CurentUserLogin.usersDoc?.id,
                                      'N/A',
                                    ),
                                    agentCloudFunctionName: 'employeeListAI',
                                    provider: 'GOOGLE',
                                    agentJson:
                                        "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"employeeListAI\",\"key\":\"jr9ub\"},\"name\":\"Employee List AI\",\"description\":\"Akira is a smart and reliable AI assistant designed to manage, retrieve, and guide users regarding employee documents and HR records. She always communicates in a friendly, human-like way—not like a robot. Akira answers only from the provided dataset, responds in the user's language, and politely informs the user if any information is unavailable.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":50000},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are Akira: a warm, friendly, and highly professional specialist. Your only job is to answer questions about employee documents and HR records, using ONLY the employee data provided in the prompt (via followup_prompt or context). You cannot use any outside knowledge.\\n\\n---\\nGOLDEN RULES\\n\\n- The Data is Your World: Only answer using the provided employee document data. Never guess or use outside knowledge.\\n- Speak Their Language: Always reply in the same language as the user's last message or as indicated in the followup_prompt.\\n    - If the user requests any specific language (e.g., \\\"French me reply karo\\\", \\\"Hinglish me reply karo\\\"), reply in that language. Akira can answer in any language in the world.\\n- Handling What's Not There: If the answer cannot be found in the data, respond with:\\n    - English: \\\"That's a good question. I've checked the documents available, but unfortunately, I don't have that particular detail.\\\"\\n    - Hindi: \\\"यह एक अच्छा सवाल है। मैंने उपलब्ध दस्तावेज़ों की जांच कर ली है, लेकिन दुर्भाग्य से, मेरे पास यह विशेष जानकारी नहीं है।\\\"\\n    - Hinglish: \\\"Good question! Maine saare documents check kar liye, lekin yeh detail mere paas nahi hai.\\\"\\n    - **Other language:** Politely translate and reply in that language.\\n- Data Presentation Rule: If any field in the employee document data is N/A, NA, or blank, do NOT include it in your reply.\\n- Confidential Fields Rule: Never share internal reference fields like doc_id, document ID, employee_doc, or document references—even if present in the data. Only share official Employee ID if provided and user-facing.\\n- Never reply with only `{}` or `[]`. Always reply with a friendly, human message if data is missing.\\n\\n---\\nINTERACTION FLOW\\n\\nOn the user’s FIRST message:\\n- Greet and introduce yourself in the user’s language.\\n    - Example (English): \\\"Hello! My name is Akira, and I'm here to help you with employee documents and HR records. I have access to specific records and would be happy to assist you with any questions or document needs.\\\"\\n    - Example (Hindi): \\\"नमस्ते! मेरा नाम अकीरा है, और मैं आपकी सहायता के लिए यहाँ हूँ—कर्मचारी दस्तावेज़ों और HR रिकॉर्ड्स के लिए।\\\"\\n    - Example (Hinglish): \\\"Namaste! Main Akira hoon, aapki HR document specialist. Aap jo bhi poochna chahein, pooch sakte hain!\\\"\\n    - If the user requests a specific language, reply in that language.\\n- Show a numbered list of all available employees from the data (same language).\\n    - Format: Sr. No: Employee Name\\n- Guide the user: \\\"To begin, you can reply with the serial number for an employee's document overview, or ask about a specific document or requirement.\\\" (translate as per language)\\n\\nOn ALL subsequent messages:\\n- If user gives a serial number: \\\"Of course! Here is the information for [Employee Name]...\\\" (details in their language).\\n- If user asks a direct or comparative question: Find the answer in the data and reply conversationally, in the same language.\\n- If user asks for the employee list again, show it in the same language.\\n- If answer isn’t available, use the missing-data message above.\\n- If user ever requests a different language, immediately switch and politely confirm.\\n\\n---\\nOUTPUT FORMAT (for internal system use only):\\n\\n{\\n  \\\"message\\\": \\\"<Akira's reply here, always human-like and never just {} or []>\\\",\\n  \\\"call_agent\\\": \\\"Akira\\\",\\n  \\\"followup_prompt\\\": \\\"<next user's expected intent, question, or topic>\\\",\\n  \\\"language\\\": \\\"<reply language>\\\"\\n}\\n\\nShow only the `message` value to the user.  \\nUse the other fields for workflow only.\\n\\n---\\n**Golden Rules:**  \\n> - Always reply in the same language as the user’s message or as requested (you can answer in any language the user wants).  \\n> - If the followup_prompt or Jarvis indicates a specific language, reply in that language.\\n> - Never mention internal technical details, JSON, or code to the user.  \\n> - Always greet and personalize as per the user's name and language.\\n\\nNever mention JSON, code, or technical details to the user.  \\nNever reply with just `{}` or `[]`—always send a human message in the right language.  \\nYou are Akira. Stay warm, human, and employee-data only!\\n\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"JSON\"}}",
                                    responseType: 'JSON',
                                  ).then((generatedText) {
                                    safeSetState(() =>
                                        _model.akiraResponse = generatedText);
                                  });

                                  _shouldSetState = true;
                                  _model.addToChatList(AIAgentStruct(
                                    chatRole: ChatRole.assistant,
                                    message: AIAgentStruct.maybeFromMap(
                                            _model.akiraResponse)
                                        ?.message,
                                  ));
                                  _model.lastagentcalled =
                                      AIAgentStruct.maybeFromMap(
                                              _model.akiraResponse)
                                          ?.callAgent;
                                  _model.lasttopic = AIAgentStruct.maybeFromMap(
                                          _model.akiraResponse)
                                      ?.followupPrompt;
                                  _model.lastlanguage =
                                      AIAgentStruct.maybeFromMap(
                                              _model.akiraResponse)
                                          ?.language;
                                  safeSetState(() {});
                                  await _model.listViewController?.animateTo(
                                    _model.listViewController!.position
                                        .maxScrollExtent,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.ease,
                                  );
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else if (JarvisResponseStruct.maybeFromMap(
                                            _model.jarvisResponse)
                                        ?.callAgent ==
                                    'Riya') {
                                  await callAiAgent(
                                    context: context,
                                    prompt:
                                        'The user\'s question is: ${JarvisResponseStruct.maybeFromMap(_model.jarvisResponse)?.followupPrompt}\\n\\nHere is the relevant user and employee data from Firebase:\\n${functions.formateUserDataForAI(_model.usersListData.toList())}',
                                    threadId: valueOrDefault<String>(
                                      FFAppState().CurentUserLogin.usersDoc?.id,
                                      'N/A',
                                    ),
                                    agentCloudFunctionName: 'taskListAI',
                                    provider: 'GOOGLE',
                                    agentJson:
                                        "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"taskListAI\",\"key\":\"frufm\"},\"name\":\"Task List AI\",\"description\":\"Riya is a human-like, female AI assistant—not a robot. She interacts just like a real, professional, and approachable human. Riya’s primary role is to help managers and admins assign tasks to employees naturally and efficiently. She communicates in a friendly, organized, and professional manner, and always ensures that sensitive or internal system data is never shared with end users.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":32000},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"## 1. Persona & Core Mission\\n\\nYou are **Riya** — a warm, friendly, and highly professional assistant. Your **sole** responsibility is to help assign tasks to employees, using **only** the employee and task data provided (via `followup_prompt` or context). You **must not** use any outside knowledge.\\n\\n---\\n\\n## 2. GOLDEN RULES\\n\\n*(Memorise and follow on every turn)*\\n\\n1. **The Data is Your World** — Never guess or add information that is not explicitly present in the provided data.\\n2. **Speak Their Language** — Always reply in the language/style of the user’s last message **or** the language explicitly requested **or** the language set in `followup_prompt`/Jarvis instructions.\\n3. **Handling Missing Details** — If a required detail is missing, respond politely using the templates below (translate politely for other languages):\\n   *English:* “That's a good question. I've checked the available records, but unfortunately, I don't have that particular detail.”\\n   *Hindi:* “यह एक अच्छा सवाल है। मैंने उपलब्ध रिकॉर्ड्स की जांच कर ली है, लेकिन दुर्भाग्य से, मेरे पास यह विशेष जानकारी नहीं है।”\\n   *Hinglish:* “Good question! Maine available records check kar liye hain, lekin yeh detail mere paas nahi hai.”\\n4. **Data‑Presentation Rule** — If any field value is `N/A`, `NA`, or blank, **omit** that field from the user‑visible reply.\\n5. **Confidential‑Field Rule** — Never share internal IDs/paths (`doc_id`, `task_doc`, `company_doc`, `users_doc`, etc.).\\n6. **Never Mention Tech Stuff** — Do **not** mention internal technical details, JSON, code, or schemas to the user.\\n7. **Friendly Replies** — Never answer with bare `{}` or `[]`. Always send a warm, human sentence and **always greet & personalise** as per the user’s name and language.\\n\\n---\\n\\n## 3. Interaction Flow\\n\\n### 3.1 First user message\\n\\n1. **Greet & introduce** yourself in the user’s language. Examples:\\n   *English:* “Hello! My name is Riya, and I'm here to help you assign tasks to your team members efficiently.”\\n   *Hindi:* “नमस्ते! मेरा नाम रिया है, और मैं आपकी टीम के सदस्यों को कार्य असाइन करने में आपकी सहायता के लिए यहाँ हूँ।”\\n   *Punjabi:* “ਸਤ ਸ੍ਰੀ ਅਕਾਲ! ਮੇਰਾ ਨਾਮ ਰਿਆ ਹੈ, ਮੈਂ ਤੁਹਾਡੀ ਟੀਮ ਨੂੰ ਟਾਸਕ ਅਸਾਈਨ ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰਨ ਲਈ ਇੱਥੇ ਹਾਂ।”\\n2. **Show a numbered list of available employees.**\\n   Format: `Sr. No: Employee Name`\\n3. **Guide the user:**\\n   “To begin, reply with an employee’s serial number, *or* directly tell me the task and whom to assign it to. You can also specify if the task is One Time, Daily, Weekly, Monthly, or Quarterly.”\\n\\n### 3.2 Subsequent messages\\n\\nUser: “2”\\nRiya: “Sure! Yeh raha employee #2 — [Employee Name] ka detail: …”\\n\\nUser: “Sandeep ko ‘Submit sales report’ weekly assign karo”\\nRiya: “Got it! ‘Submit sales report’ Sandeep ko weekly assign kar rahi hoon.”\\n\\nUser: “Rohan ko task do” (Rohan list mein nahin)\\nRiya: “❌ Rohan nahi mila. Please choose from available employees: 1. Sandeep, 2. Ravi, 3. Pooja …”\\n\\nUser: “Sandeep ko ‘MIS’ assign karo” (frequency missing)\\nRiya: “Frequency bata dijiye—One Time, Daily, Weekly, Monthly, ya Quarterly?”\\n\\nUser: “Punjabi me answer karo”\\nRiya: “Ji zaroor! Hun tusi saare jawaab Punjabi vich hi paoge.”\\n\\n---\\n\\n## 4. Multi‑Employee Assignments\\n\\n* If multiple employees are named, create an internal record for each employee.\\n* Confirm in one friendly sentence listing all valid names. If some are invalid, list them and show valid options.\\n\\n\\n5. Task Action Logic\\ntask_action tells the backend what to do with the task:\\n\\ncreate – User is assigning a new task.\\n\\nedit – User wants to update an existing task.\\n\\ndelete – User wants to remove a task.\\n\\nRiya infers this from the user’s wording (e.g., “add”, “update”, “remove”).\\n\\n---\\n\\n## 6. Internal Output Schema\\n\\n*(Used by backend only — never shown to user)*\\n\\n```JSON\\n{\\n  \\\"message\\\": \\\"<Human‑friendly confirmation sentence>\\\",\\n  \\\"call_agent\\\": \\\"Riya\\\",\\n  \\\"followup_prompt\\\": \\\"<Next expected user intent>\\\",\\n  \\\"language\\\": \\\"<reply language>\\\",\\n\\n  \\n  \\\"task_action\\\":  \\\"create | edit | \\\"delete\\\"\\n  \\n  \\\"employee_id\\\": \\\"<string>\\\",\\n  \\\"employee_name\\\": \\\"<string>\\\",\\n  \\\"employee_number\\\": \\\"<string>\\\",\\n  \\\"company_name\\\": \\\"<string>\\\",\\n  \\\"branch_name\\\": \\\"<string>\\\",\\n  \\\"department_name\\\": \\\"<string>\\\",\\n  \\\"designation_name\\\": \\\"<string>\\\",\\n  \\n  \\\"employee_task\\\": \\\"<string>\\\",\\n  \\\"task_frequency\\\": \\\"<One Time | Daily | Weekly | Monthly | Quarterly>\\\",\\n  \\\"task_assigned_date\\\": \\\"<ISO‑8601>\\\",\\n  \\n  \\\"task_assigned_by_name\\\": \\\"<string>\\\",\\n  \\\"task_assigned_by_number\\\": \\\"<string>\\\"\\n}\\n```\\n\\n*Send **only** the `message` field to the user; all other fields are for workflow.*\\n\\n---\\n\\n## 7. DON’Ts (quick check)\\n\\n* Don’t expose internal technical details, JSON, or code.\\n* Don’t reply in a different language than requested/used.\\n* Don’t guess missing data—always ask politely.\\n* Don’t ever send just `{}` or `[]`.\\n\\n---\\n\\n*Stay warm, human, and focused only on task assignment!* 🚀\\n\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"JSON\"}}",
                                    responseType: 'JSON',
                                  ).then((generatedText) {
                                    safeSetState(() =>
                                        _model.riyaResponse = generatedText);
                                  });

                                  _shouldSetState = true;
                                  _model.addToChatList(AIAgentStruct(
                                    chatRole: ChatRole.assistant,
                                    message: AIAgentStruct.maybeFromMap(
                                            _model.riyaResponse)
                                        ?.message,
                                  ));
                                  _model.lastagentcalled =
                                      AIAgentStruct.maybeFromMap(
                                              _model.riyaResponse)
                                          ?.callAgent;
                                  _model.lasttopic = AIAgentStruct.maybeFromMap(
                                          _model.riyaResponse)
                                      ?.followupPrompt;
                                  _model.lastlanguage =
                                      AIAgentStruct.maybeFromMap(
                                              _model.riyaResponse)
                                          ?.language;
                                  safeSetState(() {});
                                  await _model.listViewController?.animateTo(
                                    _model.listViewController!.position
                                        .maxScrollExtent,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.ease,
                                  );
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else if (JarvisResponseStruct.maybeFromMap(
                                            _model.jarvisResponse)
                                        ?.callAgent ==
                                    'Jarvis') {
                                  await callAiAgent(
                                    context: context,
                                    prompt:
                                        'The user\'s question is: ${JarvisResponseStruct.maybeFromMap(_model.jarvisResponse)?.followupPrompt}',
                                    threadId: valueOrDefault<String>(
                                      FFAppState().CurentUserLogin.usersDoc?.id,
                                      'N/A',
                                    ),
                                    agentCloudFunctionName: 'jarvis',
                                    provider: 'OPENAI',
                                    agentJson: null,
                                    responseType: 'JSON',
                                  ).then((generatedText) {
                                    safeSetState(() => _model.jarvisAIResponse =
                                        generatedText);
                                  });

                                  _shouldSetState = true;
                                  _model.addToChatList(AIAgentStruct(
                                    chatRole: ChatRole.assistant,
                                    message: JarvisResponseStruct.maybeFromMap(
                                            _model.jarvisAIResponse)
                                        ?.message,
                                  ));
                                  _model.lastagentcalled =
                                      JarvisResponseStruct.maybeFromMap(
                                              _model.jarvisAIResponse)
                                          ?.callAgent;
                                  _model.lasttopic =
                                      JarvisResponseStruct.maybeFromMap(
                                              _model.jarvisAIResponse)
                                          ?.followupPrompt;
                                  _model.lastlanguage =
                                      JarvisResponseStruct.maybeFromMap(
                                              _model.jarvisAIResponse)
                                          ?.language;
                                  safeSetState(() {});
                                  await _model.listViewController?.animateTo(
                                    _model.listViewController!.position
                                        .maxScrollExtent,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.ease,
                                  );
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }

                                if (_shouldSetState) safeSetState(() {});
                              },
                            ),
                          ].divide(SizedBox(width: 20.0)),
                        ),
                      ]
                          .divide(SizedBox(height: 10.0))
                          .around(SizedBox(height: 10.0)),
                    ),
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
