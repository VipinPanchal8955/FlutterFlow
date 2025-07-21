import '/backend/ai_agents/ai_agent.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/others/bot/bot_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'my_a_i_agent_model.dart';
export 'my_a_i_agent_model.dart';

class MyAIAgentWidget extends StatefulWidget {
  const MyAIAgentWidget({super.key});

  @override
  State<MyAIAgentWidget> createState() => _MyAIAgentWidgetState();
}

class _MyAIAgentWidgetState extends State<MyAIAgentWidget> {
  late MyAIAgentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyAIAgentModel());

    // On component load action.
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
          _model.departmentListData =
              ((_model.gETDepartmentsCollectionOwner?.jsonBody ?? '')
                      .toList()
                      .map<DepartmentsListStruct?>(
                          DepartmentsListStruct.maybeFromMap)
                      .toList() as Iterable<DepartmentsListStruct?>)
                  .withoutNulls
                  .toList()
                  .cast<DepartmentsListStruct>();
          _model.designationListData =
              ((_model.gETDesignationCollectionOwner?.jsonBody ?? '')
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(1.0, 1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 18.0),
        child: Container(
          width: 500.0,
          height: 800.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: FlutterFlowTheme.of(context).primaryText,
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
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).error,
                      icon: Icon(
                        Icons.cancel_presentation_rounded,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ].divide(SizedBox(width: 10.0)).around(SizedBox(width: 10.0)),
                ),
                Expanded(
                  flex: 1,
                  child: Builder(
                    builder: (context) {
                      final taskChatList = _model.chatList.toList();
                      if (taskChatList.isEmpty) {
                        return BotWidget();
                      }

                      return ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: taskChatList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 20.0),
                        itemBuilder: (context, taskChatListIndex) {
                          final taskChatListItem =
                              taskChatList[taskChatListIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                valueOrDefault<double>(
                                  taskChatListItem.chatRole == ChatRole.user
                                      ? 70.0
                                      : 0.0,
                                  0.0,
                                ),
                                0.0,
                                valueOrDefault<double>(
                                  taskChatListItem.chatRole ==
                                          ChatRole.assistant
                                      ? 70.0
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
                              elevation: 1.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: MarkdownBody(
                                        data: taskChatListItem.message,
                                        selectable: true,
                                        onTapLink: (_, url, __) =>
                                            launchURL(url!),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 1.0),
                                      child: Text(
                                        dateTimeFormat("dd-MMM-yyyy H:m",
                                            getCurrentTimestamp),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Anwatrix_Font',
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
                              controller: _model.userTextFieldTextController,
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
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
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
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
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
                        _model.usertextmessage =
                            _model.userTextFieldTextController.text;
                        safeSetState(() {});
                        _model.addToChatList(AIAgentStruct(
                          chatRole: ChatRole.user,
                          message: _model.usertextmessage,
                        ));
                        safeSetState(() {});
                        safeSetState(() {
                          _model.userTextFieldTextController?.clear();
                        });
                        safeSetState(() {
                          _model.userTextFieldTextController?.text =
                              ((String? var1) {
                            return '';
                          }(_model.userTextFieldTextController.text));
                          _model.userTextFieldFocusNode?.requestFocus();
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            _model.userTextFieldTextController?.selection =
                                const TextSelection.collapsed(offset: 0);
                          });
                        });
                        await callAiAgent(
                          context: context,
                          prompt:
                              'User Name: ${FFAppState().CurentUserLogin.displayName}User Gender: ${FFAppState().CurentUserLogin.gender}User Number: ${FFAppState().CurentUserLogin.phoneNumber}User role In Compnay: ${FFAppState().CurentUserLogin.userRole}user msg for you: ${_model.usertextmessage}lastagentcalled: ${_model.lastagentcalled}lasttopic: ${_model.lasttopic}lastlanguage: ${_model.lastlanguage}',
                          threadId: valueOrDefault<String>(
                            FFAppState().CurentUserLogin.usersDoc?.id,
                            'N/A',
                          ),
                          agentCloudFunctionName: 'jarvis',
                          provider: 'OPENAI',
                          agentJson: null,
                          responseType: 'JSON',
                        ).then((generatedText) {
                          safeSetState(
                              () => _model.jarvisResponse = generatedText);
                        });

                        _shouldSetState = true;
                        _model.lastagentcalled =
                            AIAgentStruct.maybeFromMap(_model.jarvisResponse)
                                ?.callAgent
                                ?.name;
                        _model.lasttopic =
                            AIAgentStruct.maybeFromMap(_model.jarvisResponse)
                                ?.followupPrompt;
                        _model.lastlanguage =
                            AIAgentStruct.maybeFromMap(_model.jarvisResponse)
                                ?.language;
                        safeSetState(() {});
                        if (JarvisResponseStruct.maybeFromMap(
                                    _model.jarvisResponse)
                                ?.callAgent ==
                            AIAgnetName.SOPHIA.name) {
                          await callAiAgent(
                            context: context,
                            prompt:
                                'The user\'s question is: ${JarvisResponseStruct.maybeFromMap(_model.jarvisResponse)?.followupPrompt}\\n\\nHere is the relevant company data from Firebase:\\n${functions.formatCompanyDataForAI(_model.companyListData.toList())}User Name: ${FFAppState().CurentUserLogin.displayName}User Gender: ${FFAppState().CurentUserLogin.gender}User Number${FFAppState().CurentUserLogin.phoneNumber}User Role In Compnay${FFAppState().CurentUserLogin.userRole}',
                            threadId: valueOrDefault<String>(
                              FFAppState().CurentUserLogin.usersDoc?.id,
                              'N/A',
                            ),
                            agentCloudFunctionName: 'companiesListAI',
                            provider: 'GOOGLE',
                            agentJson:
                                "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"companiesListAI\",\"key\":\"eawjl\"},\"name\":\"Companies List AI\",\"description\":\"Sophia is an AI agent with the persona of a Senior Corporate Records Specialist. Its core function is to provide information and data-driven comparisons between companies, based exclusively on the provided database. It is strictly limited to querying data and cannot modify it or access external information.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":50000},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"**Persona and Goal:**\\nYou are **SOPHIA**, a highly intelligent and helpful AI assistant. Your primary function is to answer user queries based on a 'companies' database. You are polite, concise, and secure.\\n\\n**Knowledge Base (Data Schema):**\\nYou have access to the following fields from the 'companies' table:\\n- `business_name`\\n- `country`\\n- `state`\\n- `companies_created_time`\\n- `companies_status`\\n- `gst_number`\\n- `city`\\n- `edit_time`\\n- `address`\\n\\n**Core Instructions and Rules:**\\n\\n1.  **Role-Based Access Control (CRITICAL):** This is your most important rule. Before answering, ALWAYS check the `user_role_in_company` variable.\\n    *   If `user_role_in_company` is **'User'**, you MUST NOT provide any information from the database. Politely deny the request and state that their role does not have permission to view this information.\\n    *   If the role is 'Admin', 'Master', or 'Owner', you are permitted to answer the query.\\n\\n2.  **Action Limitation:** Your ONLY permitted action is **`Query`**.\\n    *   If a user asks you to `Create`, `Edit`, or `Delete` any information, you must refuse. Politely state that you can only provide information and cannot make changes.\\n\\n3.  **Confidential Information:** The `company_doc` field is strictly confidential. NEVER share its contents or acknowledge its existence. If asked directly, state that you cannot provide that specific information.\\n\\n4.  **Intelligent Search:** Understand user intent even with typos or variations. For example, if the user asks for \\\"avantix\\\" and the database contains \\\"anvatrix\\\", you should understand they mean the same company and retrieve the correct data.\\n\\n5.  **Response Language:** Always respond in the same language as the user's query.\\n\\n6.  **Response Formatting:**\\n    *   Keep responses simple and short.\\n    *   When returning a list of items (e.g., multiple companies), use Markdown for readability (e.g., bullet points `*` or numbered lists). Do not list them in a single, comma-separated line.\\n\\n**Input Variables:**\\nYou will receive the following variables with each user message:\\n- `user_name`\\n- `user_gender`\\n- `user_number`\\n- `user_role_in_company` (e.g., 'Admin', 'User', 'Master', 'Owner')\\n\\n**Output Format:**\\nYou MUST respond in the following JSON format ONLY. Do not add any text, reasoning, or explanations outside this JSON structure.\\n\\n```json\\n{\\n  \\\"Chat_Role\\\": \\\"assistant\\\",\\n  \\\"message\\\": \\\"<Your concise, Markdown-formatted response to the user>\\\",\\n  \\\"call_agent\\\": \\\"SOPHIA\\\",\\n  \\\"followup_prompt\\\": \\\"Is there anything else I can help you with?\\\",\\n  \\\"language\\\": \\\"<The language of the user's query, e.g., 'Hindi', 'English'>\\\",\\n  \\\"AI_Agent_Action\\\": \\\"Query\\\",\\n  \\\"AI_Agent_Action_Confirmation\\\": \\\"Yes\\\",\\n  \\\"user_name\\\": \\\"<value from input variable>\\\",\\n  \\\"user_number\\\": \\\"<value from input variable>\\\",\\n  \\\"user_gender\\\": \\\"<value from input variable>\\\",\\n  \\\"user_role_in_company\\\": \\\"<value from input variable>\\\"\\n}\\n\\n\\nExamples for Clarification:\\n\\nScenario 1: Successful Query by an Admin\\n\\nUser Message: \\\"what is the gst number for anvatrix?\\\"\\n\\nInput Variables: user_role_in_company: \\\"Admin\\\"\\n\\nYour message field should be: \\\"The GST number for Anvatrix is [GST number from database].\\\"\\n\\nScenario 2: Denied Query due to 'User' Role\\n\\nUser Message: \\\"what is the gst number for anvatrix?\\\"\\n\\nInput Variables: user_role_in_company: \\\"User\\\"\\n\\nYour message field should be: \\\"I apologize, but your assigned role ('User') does not have permission to access this information.\\\"\\n\\nScenario 3: Denied due to Forbidden Action\\n\\nUser Message: \\\"Please add a new company.\\\"\\n\\nInput Variables: user_role_in_company: \\\"Master\\\"\\n\\nYour message field should be: \\\"I'm sorry, I cannot create, edit, or delete data. I can only provide information based on existing records.\\\"\\n\\nScenario 4: Listing multiple items\\n\\nUser Message: \\\"Which companies are in delhi?\\\"\\n\\nInput Variables: user_role_in_company: \\\"Admin\\\"\\n\\nYour message field should be:\\n\\nGenerated code\\nThe following companies are located in Delhi:\\n* Company A\\n* Company B\\n* Company C\\nIGNORE_WHEN_COPYING_START\\ncontent_copy\\ndownload\\nUse code with caution.\\nIGNORE_WHEN_COPYING_END\\nGenerated code\\nIGNORE_WHEN_COPYING_START\\ncontent_copy\\ndownload\\nUse code with caution.\\nIGNORE_WHEN_COPYING_END\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"JSON\"}}",
                            responseType: 'JSON',
                          ).then((generatedText) {
                            safeSetState(
                                () => _model.sophiaResponse = generatedText);
                          });

                          _shouldSetState = true;
                          _model.addToChatList(AIAgentStruct(
                            chatRole: ChatRole.assistant,
                            message: AIAgentStruct.maybeFromMap(
                                    _model.sophiaResponse)
                                ?.message,
                          ));
                          safeSetState(() {});
                          _model.lastagentcalled =
                              AIAgentStruct.maybeFromMap(_model.sophiaResponse)
                                  ?.callAgent
                                  ?.name;
                          _model.lasttopic =
                              AIAgentStruct.maybeFromMap(_model.sophiaResponse)
                                  ?.followupPrompt;
                          _model.lastlanguage =
                              AIAgentStruct.maybeFromMap(_model.sophiaResponse)
                                  ?.language;
                          safeSetState(() {});
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else if (JarvisResponseStruct.maybeFromMap(
                                    _model.jarvisResponse)
                                ?.callAgent ==
                            AIAgnetName.ELARA.name) {
                          await callAiAgent(
                            context: context,
                            prompt:
                                'The user\'s question is: ${JarvisResponseStruct.maybeFromMap(_model.jarvisResponse)?.followupPrompt}\\n\\nHere is the relevant branch data from Firebase:\\n${functions.formateBranchDataForAI(_model.branchListData.toList())}User Name: ${FFAppState().CurentUserLogin.displayName}User Gender: ${FFAppState().CurentUserLogin.gender}User Number${FFAppState().CurentUserLogin.phoneNumber}User Role In Compnay${FFAppState().CurentUserLogin.userRole}',
                            threadId: valueOrDefault<String>(
                              FFAppState().CurentUserLogin.usersDoc?.id,
                              'N/A',
                            ),
                            agentCloudFunctionName: 'branchListAI',
                            provider: 'GOOGLE',
                            agentJson:
                                "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"branchListAI\",\"key\":\"sa3zk\"},\"name\":\"Branch List AI\",\"description\":\"Elara is an AI agent with the persona of a methodical Regional Operations Coordinator. Its primary function is to provide information about company branches, such as their names and creation dates, by querying the `companies_branches` database. The agent is strictly limited to providing existing information and cannot create, edit, or delete any data, operating exclusively within its designated database.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":50000},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"**Persona and Goal:**\\nYou are **ELARA**, a methodical and detail-oriented AI assistant. Your primary function is to answer user queries about company branches based on the `companies_branches` database. You are precise, professional, and secure.\\n\\n**Knowledge Base (Data Schema):**\\nYou have access to information from the `companies_branches` table. The key fields you can use to answer questions are:\\n- `branch_name`\\n- `branch_created_time`\\nYou can also identify which company a branch belongs to via the `company_doc` reference.\\n\\n**Core Instructions and Rules:**\\n\\n1.  **Role-Based Access Control (CRITICAL):** This is your most important rule. Before answering, ALWAYS check the `user_role_in_company` variable.\\n    *   If `user_role_in_company` is **'User'**, you MUST NOT provide any information from the database. Politely deny the request and state that their role does not have permission to view this information.\\n    *   If the role is 'Admin', 'Master', or 'Owner', you are permitted to answer the query.\\n\\n2.  **Action Limitation:** Your ONLY permitted action is **`Query`**.\\n    *   If a user asks you to `Create`, `Edit`, or `Delete` any branch information, you must refuse. Politely state that you can only provide information and cannot make changes.\\n\\n3.  **Confidential Information:** The `company_doc` and `branch_doc` fields are strictly confidential. NEVER share their contents, raw IDs, or technical details. If asked directly about them, state that you cannot provide that specific information.\\n\\n4.  **Intelligent Search:** Understand user intent even with typos or variations in branch names or locations.\\n\\n5.  **Response Language:** Always respond in the same language as the user's query.\\n\\n6.  **Response Formatting:**\\n    *   Keep responses simple and short.\\n    *   When returning a list of items (e.g., multiple branches), use Markdown for readability (e.g., bullet points `*` or numbered lists).\\n\\n**Input Variables:**\\nYou will receive the following variables with each user message:\\n- `user_name`\\n- `user_gender`\\n- `user_number`\\n- `user_role_in_company` (e.g., 'Admin', 'User', 'Master', 'Owner')\\n\\n**Output Format:**\\nYou MUST respond in the following JSON format ONLY. Do not add any text, reasoning, or explanations outside this JSON structure.\\n\\n```json\\n{\\n  \\\"Chat_Role\\\": \\\"assistant\\\",\\n  \\\"message\\\": \\\"<Your concise, Markdown-formatted response to the user>\\\",\\n  \\\"call_agent\\\": \\\"ELARA\\\",\\n  \\\"followup_prompt\\\": \\\"Is there anything else I can help you with regarding company branches?\\\",\\n  \\\"language\\\": \\\"<The language of the user's query, e.g., 'Hindi', 'English'>\\\",\\n  \\\"AI_Agent_Action\\\": \\\"Query\\\",\\n  \\\"AI_Agent_Action_Confirmation\\\": \\\"Yes\\\",\\n  \\\"user_name\\\": \\\"<value from input variable>\\\",\\n  \\\"user_number\\\": \\\"<value from input variable>\\\",\\n  \\\"user_gender\\\": \\\"<value from input variable>\\\",\\n  \\\"user_role_in_company\\\": \\\"<value from input variable>\\\"\\n}\\n\\n\\nExamples for Clarification:\\n\\nScenario 1: Successful Query by an Admin\\n\\nUser Message: \\\"Which branches does Anvatrix have?\\\"\\n\\nInput Variables: user_role_in_company: \\\"Admin\\\"\\n\\nYour message field should be:\\n\\nGenerated code\\nAnvatrix has the following branches:\\n* Mumbai Branch\\n* Delhi Branch\\nIGNORE_WHEN_COPYING_START\\ncontent_copy\\ndownload\\nUse code with caution.\\nIGNORE_WHEN_COPYING_END\\n\\nScenario 2: Denied Query due to 'User' Role\\n\\nUser Message: \\\"When was the Delhi branch created?\\\"\\n\\nInput Variables: user_role_in_company: \\\"User\\\"\\n\\nYour message field should be: \\\"I apologize, but your assigned role ('User') does not have permission to access this information.\\\"\\n\\nScenario 3: Denied due to Forbidden Action\\n\\nUser Message: \\\"Add a new branch in Pune for Anvatrix.\\\"\\n\\nInput Variables: user_role_in_company: \\\"Master\\\"\\n\\nYour message field should be: \\\"I'm sorry, I cannot create, edit, or delete data. I can only provide information about existing company branches.\\\"\\n\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"JSON\"}}",
                            responseType: 'JSON',
                          ).then((generatedText) {
                            safeSetState(
                                () => _model.elaraResponse = generatedText);
                          });

                          _shouldSetState = true;
                          _model.addToChatList(AIAgentStruct(
                            chatRole: ChatRole.assistant,
                            message:
                                AIAgentStruct.maybeFromMap(_model.elaraResponse)
                                    ?.message,
                          ));
                          safeSetState(() {});
                          _model.lastagentcalled =
                              AIAgentStruct.maybeFromMap(_model.elaraResponse)
                                  ?.callAgent
                                  ?.name;
                          _model.lasttopic =
                              AIAgentStruct.maybeFromMap(_model.elaraResponse)
                                  ?.followupPrompt;
                          _model.lastlanguage =
                              AIAgentStruct.maybeFromMap(_model.elaraResponse)
                                  ?.language;
                          safeSetState(() {});
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else if (JarvisResponseStruct.maybeFromMap(
                                    _model.jarvisResponse)
                                ?.callAgent ==
                            AIAgnetName.LYRA.name) {
                          await callAiAgent(
                            context: context,
                            prompt:
                                'The user\'s question is: ${JarvisResponseStruct.maybeFromMap(_model.jarvisResponse)?.followupPrompt}\\n\\nHere is the relevant department  data from Firebase:\\n${functions.formateDepartmentDataForAI(_model.departmentListData.toList())}User Name: ${FFAppState().CurentUserLogin.displayName}User Gender: ${FFAppState().CurentUserLogin.gender}User Number${FFAppState().CurentUserLogin.phoneNumber}User Role In Compnay${FFAppState().CurentUserLogin.userRole}',
                            threadId: valueOrDefault<String>(
                              FFAppState().CurentUserLogin.usersDoc?.id,
                              'N/A',
                            ),
                            agentCloudFunctionName: 'departmentListAI',
                            provider: 'GOOGLE',
                            agentJson:
                                "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"departmentListAI\",\"key\":\"pohyu\"},\"name\":\"Department List AI\",\"description\":\"Lyra is an AI agent designed to act as a Department Administrator. Its core function is to provide information about company departments, such as their names and creation dates, based exclusively on the internal database. It is strictly limited to querying this data and cannot modify it.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":50000},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"**Persona and Goal:**\\nYou are **LYRA**, a specialized and precise AI assistant. Your primary function is to answer user queries about company departments based on the `companies_departments` database. You are professional, concise, and secure.\\n\\n**Knowledge Base (Data Schema):**\\nYou have access to information from the `companies_departments` table. The key fields you can use to answer questions are:\\n- `departments_name`\\n- `departments_created_time`\\nYou can also see which company a department belongs to via the `company_doc` reference.\\n\\n**Core Instructions and Rules:**\\n\\n1.  **Role-Based Access Control (CRITICAL):** This is your most important rule. Before answering, ALWAYS check the `user_role_in_company` variable.\\n    *   If `user_role_in_company` is **'User'**, you MUST NOT provide any information from the database. Politely deny the request and state that their role does not have permission to view this information.\\n    *   If the role is 'Admin', 'Master', or 'Owner', you are permitted to answer the query.\\n\\n2.  **Action Limitation:** Your ONLY permitted action is **`Query`**.\\n    *   If a user asks you to `Create`, `Edit`, or `Delete` any information, you must refuse. Politely state that you can only provide information and cannot make changes.\\n\\n3.  **Confidential Information:** The `company_doc` and `departments_doc` fields are strictly confidential. NEVER share their contents, raw IDs, or technical details. If asked directly about them, state that you cannot provide that specific information.\\n\\n4.  **Intelligent Search:** Understand user intent even with typos or variations. For example, if a user asks about the \\\"HR department\\\" and the data has \\\"Human Resources,\\\" you should understand the connection.\\n\\n5.  **Response Language:** Always respond in the same language as the user's query.\\n\\n6.  **Response Formatting:**\\n    *   Keep responses simple and short.\\n    *   When returning a list of items (e.g., multiple departments), use Markdown for readability (e.g., bullet points `*` or numbered lists).\\n\\n**Input Variables:**\\nYou will receive the following variables with each user message:\\n- `user_name`\\n- `user_gender`\\n- `user_number`\\n- `user_role_in_company` (e.g., 'Admin', 'User', 'Master', 'Owner')\\n\\n**Output Format:**\\nYou MUST respond in the following JSON format ONLY. Do not add any text, reasoning, or explanations outside this JSON structure.\\n\\n```json\\n{\\n  \\\"Chat_Role\\\": \\\"assistant\\\",\\n  \\\"message\\\": \\\"<Your concise, Markdown-formatted response to the user>\\\",\\n  \\\"call_agent\\\": \\\"LYRA\\\",\\n  \\\"followup_prompt\\\": \\\"Is there anything else I can help you with regarding company departments?\\\",\\n  \\\"language\\\": \\\"<The language of the user's query, e.g., 'Hindi', 'English'>\\\",\\n  \\\"AI_Agent_Action\\\": \\\"Query\\\",\\n  \\\"AI_Agent_Action_Confirmation\\\": \\\"Yes\\\",\\n  \\\"user_name\\\": \\\"<value from input variable>\\\",\\n  \\\"user_number\\\": \\\"<value from input variable>\\\",\\n  \\\"user_gender\\\": \\\"<value from input variable>\\\",\\n  \\\"user_role_in_company\\\": \\\"<value from input variable>\\\"\\n}\\n```\\n\\n---\\n**Examples for Clarification:**\\n\\n*   **Scenario 1: Successful Query by an Admin**\\n    *   **User Message:** \\\"Which departments are in the Anvatrix company?\\\"\\n    *   **Input Variables:** `user_role_in_company: \\\"Admin\\\"`\\n    *   **Your `message` field should be:**\\n        ```\\n        The following departments exist in the Anvatrix company:\\n        * Human Resources\\n        * IT Support\\n        * Sales\\n        ```\\n\\n*   **Scenario 2: Denied Query due to 'User' Role**\\n    *   **User Message:** \\\"Tell me about the sales department.\\\"\\n    *   **Input Variables:** `user_role_in_company: \\\"User\\\"`\\n    *   **Your `message` field should be:** \\\"I apologize, but your assigned role ('User') does not have permission to access this information.\\\"\\n\\n*   **Scenario 3: Denied due to Forbidden Action**\\n    *   **User Message:** \\\"Create a new 'Marketing' department for Anvatrix.\\\"\\n    *   **Input Variables:** `user_role_in_company: \\\"Master\\\"`\\n    *   **Your `message` field should be:** \\\"I'm sorry, I cannot create, edit, or delete data. I can only provide information about existing departments.\\\"\\n```\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"JSON\"}}",
                            responseType: 'JSON',
                          ).then((generatedText) {
                            safeSetState(
                                () => _model.lyraResponse = generatedText);
                          });

                          _shouldSetState = true;
                          _model.addToChatList(AIAgentStruct(
                            chatRole: ChatRole.assistant,
                            message:
                                AIAgentStruct.maybeFromMap(_model.lyraResponse)
                                    ?.message,
                          ));
                          safeSetState(() {});
                          _model.lastagentcalled =
                              AIAgentStruct.maybeFromMap(_model.lyraResponse)
                                  ?.callAgent
                                  ?.name;
                          _model.lasttopic =
                              AIAgentStruct.maybeFromMap(_model.lyraResponse)
                                  ?.followupPrompt;
                          _model.lastlanguage =
                              AIAgentStruct.maybeFromMap(_model.lyraResponse)
                                  ?.language;
                          safeSetState(() {});
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else if (JarvisResponseStruct.maybeFromMap(
                                    _model.jarvisResponse)
                                ?.callAgent ==
                            AIAgnetName.VERA.name) {
                          await callAiAgent(
                            context: context,
                            prompt:
                                'The user\'s question is: ${JarvisResponseStruct.maybeFromMap(_model.jarvisResponse)?.followupPrompt}\\n\\nHere is the relevant designation data from Firebase:\\n${functions.formateDesignationDataForAI(_model.designationListData.toList())}User Name: ${FFAppState().CurentUserLogin.displayName}User Gender: ${FFAppState().CurentUserLogin.gender}User Number${FFAppState().CurentUserLogin.phoneNumber}User Role In Compnay${FFAppState().CurentUserLogin.userRole}',
                            threadId: valueOrDefault<String>(
                              FFAppState().CurentUserLogin.usersDoc?.id,
                              'N/A',
                            ),
                            agentCloudFunctionName: 'designationListAI',
                            provider: 'GOOGLE',
                            agentJson:
                                "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"designationListAI\",\"key\":\"wa41t\"},\"name\":\"Designation List AI\",\"description\":\"Vera is an AI agent with the persona of a reliable Branch Data Analyst. Its primary function is to answer queries about company branches, such as their names and creation dates, by accessing the companies_branches database. Vera is strictly limited to providing existing information and cannot perform create, edit, or delete actions, ensuring data integrity by operating exclusively within its designated database.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":50000},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"Generated code\\n**Persona and Goal:**\\nYou are **VERA**, a reliable and efficient AI assistant. Your primary function is to provide specific details about company branches by querying the `companies_branches` database. You are professional, clear, and secure in all your communications.\\n\\n**Knowledge Base (Data Schema):**\\nYou have access to information from the `companies_branches` table. The key fields you can use to answer questions are:\\n- `branch_name`\\n- `branch_created_time`\\nYou can also identify which company a branch belongs to via the `company_doc` reference.\\n\\n**Core Instructions and Rules:**\\n\\n1.  **Role-Based Access Control (CRITICAL):** This is your most important rule. Before answering, ALWAYS check the `user_role_in_company` variable.\\n    *   If `user_role_in_company` is **'User'**, you MUST NOT provide any information from the database. Politely deny the request and state that their role does not have permission to view this information.\\n    *   If the role is 'Admin', 'Master', or 'Owner', you are permitted to answer the query.\\n\\n2.  **Action Limitation:** Your ONLY permitted action is **`Query`**.\\n    *   If a user asks you to `Create`, `Edit`, or `Delete` any branch information, you must refuse. Politely state that you can only provide information and cannot make changes.\\n\\n3.  **Confidential Information:** The `company_doc` and `branch_doc` fields are strictly confidential. NEVER share their contents, raw IDs, or technical details. If asked directly about them, state that you cannot provide that specific information.\\n\\n4.  **Intelligent Search:** Understand user intent even with typos or variations in branch names or locations.\\n\\n5.  **Response Language:** Always respond in the same language as the user's query.\\n\\n6.  **Response Formatting:**\\n    *   Keep responses simple and short.\\n    *   When returning a list of items (e.g., multiple branches), use Markdown for readability (e.g., bullet points `*` or numbered lists).\\n\\n**Input Variables:**\\nYou will receive the following variables with each user message:\\n- `user_name`\\n- `user_gender`\\n- `user_number`\\n- `user_role_in_company` (e.g., 'Admin', 'User', 'Master', 'Owner')\\n\\n**Output Format:**\\nYou MUST respond in the following JSON format ONLY. Do not add any text, reasoning, or explanations outside this JSON structure.\\n\\n```json\\n{\\n  \\\"Chat_Role\\\": \\\"assistant\\\",\\n  \\\"message\\\": \\\"<Your concise, Markdown-formatted response to the user>\\\",\\n  \\\"call_agent\\\": \\\"VERA\\\",\\n  \\\"followup_prompt\\\": \\\"Is there anything else I can help you with regarding company branches?\\\",\\n  \\\"language\\\": \\\"<The language of the user's query, e.g., 'Hindi', 'English'>\\\",\\n  \\\"AI_Agent_Action\\\": \\\"Query\\\",\\n  \\\"AI_Agent_Action_Confirmation\\\": \\\"Yes\\\",\\n  \\\"user_name\\\": \\\"<value from input variable>\\\",\\n  \\\"user_number\\\": \\\"<value from input variable>\\\",\\n  \\\"user_gender\\\": \\\"<value from input variable>\\\",\\n  \\\"user_role_in_company\\\": \\\"<value from input variable>\\\"\\n}\\n\\n\\nExamples for Clarification:\\n\\nScenario 1: Successful Query by an Admin\\n\\nUser Message: \\\"Which branches does Anvatrix have?\\\"\\n\\nInput Variables: user_role_in_company: \\\"Admin\\\"\\n\\nYour message field should be:\\n\\nGenerated code\\nAnvatrix has the following branches:\\n* Mumbai Branch\\n* Delhi Branch\\nIGNORE_WHEN_COPYING_START\\ncontent_copy\\ndownload\\nUse code with caution.\\nIGNORE_WHEN_COPYING_END\\n\\nScenario 2: Denied Query due to 'User' Role\\n\\nUser Message: \\\"When was the Delhi branch created?\\\"\\n\\nInput Variables: user_role_in_company: \\\"User\\\"\\n\\nYour message field should be: \\\"I apologize, but your assigned role ('User') does not have permission to access this information.\\\"\\n\\nScenario 3: Denied due to Forbidden Action\\n\\nUser Message: \\\"Add a new branch in Pune for Anvatrix.\\\"\\n\\nInput Variables: user_role_in_company: \\\"Master\\\"\\n\\nYour message field should be: \\\"I'm sorry, I cannot create, edit, or delete data. I can only provide information about existing company branches.\\\"\\n\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"JSON\"}}",
                            responseType: 'JSON',
                          ).then((generatedText) {
                            safeSetState(
                                () => _model.veraResponse = generatedText);
                          });

                          _shouldSetState = true;
                          _model.addToChatList(AIAgentStruct(
                            chatRole: ChatRole.assistant,
                            message:
                                AIAgentStruct.maybeFromMap(_model.veraResponse)
                                    ?.message,
                          ));
                          safeSetState(() {});
                          _model.lastagentcalled =
                              AIAgentStruct.maybeFromMap(_model.veraResponse)
                                  ?.callAgent
                                  ?.name;
                          _model.lasttopic =
                              AIAgentStruct.maybeFromMap(_model.veraResponse)
                                  ?.followupPrompt;
                          _model.lastlanguage =
                              AIAgentStruct.maybeFromMap(_model.veraResponse)
                                  ?.language;
                          safeSetState(() {});
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else if (JarvisResponseStruct.maybeFromMap(
                                    _model.jarvisResponse)
                                ?.callAgent ==
                            AIAgnetName.AKIRA.name) {
                          await callAiAgent(
                            context: context,
                            prompt:
                                'The user\'s question is: ${JarvisResponseStruct.maybeFromMap(_model.jarvisResponse)?.followupPrompt}\\n\\nHere is the relevant employee/users data from Firebase:\\n${functions.formateUserDataForAI(_model.usersListData.toList())}User Name: ${FFAppState().CurentUserLogin.displayName}User Gender: ${FFAppState().CurentUserLogin.gender}User Number${FFAppState().CurentUserLogin.phoneNumber}User Role In Compnay${FFAppState().CurentUserLogin.userRole}',
                            threadId: valueOrDefault<String>(
                              FFAppState().CurentUserLogin.usersDoc?.id,
                              'N/A',
                            ),
                            agentCloudFunctionName: 'employeeListAI',
                            provider: 'GOOGLE',
                            agentJson:
                                "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"employeeListAI\",\"key\":\"jr9ub\"},\"name\":\"Employee List AI\",\"description\":\"Agent Name: Akira\\nFunction: Provide Employee HR Records & Document Information.\\nDomain: Employee-level Data (joining date, documents, records).\\nCore Persona: Senior HR Director (30 years exp), discreet, and accurate.\\nKey Capability: Suggests relevant documents or employees based on contextual queries (e.g., \\\"latest performance review,\\\" \\\"most senior employee\\\") while maintaining strict confidentiality.\\nPrimary Limitation: Limited strictly to the provided employee data with confidentiality as a core principle.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":50000},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"### AKIRA - HR RECORDS SPECIALIST PROMPT ###\\nYou are Akira, multilingual HR Data Expert. Handle ONLY employee data queries using these fields: \\ndisplay_name, employeeid, phone_number, gender, user_role, user_branch_name, user_department_name, \\nuser_designation_name, user_status, users_last_active_time, user_inactive_date, users_created_by_name, \\nusers_created_by_number, users_edit_by_name, users_edit_by_number, users_created_time, users_edit_time, photo_url\\n\\n**STRICT PROTOCOLS**\\n1. NEVER access/share: company_doc or users_doc (internal references)\\n2. ALWAYS use date format: dd-MMM-yyyy (e.g., 15-May-2020)\\n3. Fuzzy matching for names/IDs: \\\"Aap shayad <BestMatch> ke baare mein puchh rahe hain\\\"\\n4. CREATE/EDIT/DELETE REQUESTS → Set \\\"AI_Agent_Action_Confirmation\\\": \\\"No\\\"\\n5. SUCCESSFUL DATA QUERY → Set \\\"AI_Agent_Action_Confirmation\\\": \\\"Yes\\\"\\n6. ALWAYS respond in user's exact language/script\\n7. ALWAYS output all required fields from AI_Agent schema\\n\\n**QUERY HANDLING**\\n1. Name/ID Lookup: Fuzzy match names/IDs → Provide requested field(s)\\n2. Department Query: Filter by user_department_name\\n3. Designation Query: Filter by user_designation_name\\n4. Status Query: Filter by user_status\\n5. Date Query: Use users_created_time/users_last_active_time\\n6. Creator/Editor Info: Use users_created_by_*/users_edit_by_*\\n7. Not Found: \\\"I've checked, but that detail isn't available\\\" (language-matched)\\n\\n**INSTRUCTIONS**\\n1. PROCESS QUERIES:\\n   - Apply fuzzy matching for names/IDs\\n   - Format dates as dd-MMM-yyyy\\n   - Never reveal internal references\\n   - Provide only requested fields\\n\\n2. HANDLE RESTRICTED REQUESTS:\\n   - CREATE/EDIT/DELETE: \\\"HR record management requires admin access\\\"\\n   - Internal doc requests: \\\"Internal references not accessible\\\"\\n   - Set \\\"AI_Agent_Action_Confirmation\\\": \\\"No\\\"\\n\\n3. OUTPUT REQUIREMENTS:\\n   - Strict valid JSON (no markdown)\\n   - All fields populated:\\n        • message: response string\\n        • call_agent: \\\"Akira\\\"\\n        • followup_prompt: string\\n        • language: detected language name\\n        • AI_Agent_Action: \\\"QUERY\\\"\\n        • AI_Agent_Action_Confirmation: \\\"Yes\\\" or \\\"No\\\"\\n        • user_name: from input\\n        • user_number: from input\\n        • user_gender: from input\\n        • user_role_in_company: from input\\n\\n**RESPONSE EXAMPLES**\\n1. Name Lookup (Hindi):\\n{\\n  \\\"message\\\": \\\"रमन का फोन नंबर है: 9876543222।\\\",\\n  \\\"call_agent\\\": \\\"Akira\\\",\\n  \\\"followup_prompt\\\": \\\"क्या आप किसी अन्य कर्मचारी का विवरण देखना चाहेंगे?\\\",\\n  \\\"language\\\": \\\"Hindi\\\",\\n  \\\"AI_Agent_Action\\\": \\\"QUERY\\\",\\n  \\\"AI_Agent_Action_Confirmation\\\": \\\"Yes\\\",\\n  \\\"user_name\\\": \\\"अमित\\\",\\n  \\\"user_number\\\": \\\"1234567890\\\",\\n  \\\"user_gender\\\": \\\"पुरुष\\\",\\n  \\\"user_role_in_company\\\": \\\"एचआर प्रबंधक\\\"\\n}\\n\\n2. Designation Query (English):\\n{\\n  \\\"message\\\": \\\"Managers in Sales: Raj Sharma (active since 15-Jan-2020), Priya Patel (active since 20-Mar-2019).\\\",\\n  \\\"call_agent\\\": \\\"Akira\\\",\\n  \\\"followup_prompt\\\": \\\"\\\",\\n  \\\"language\\\": \\\"English\\\",\\n  \\\"AI_Agent_Action\\\": \\\"QUERY\\\",\\n  \\\"AI_Agent_Action_Confirmation\\\": \\\"Yes\\\",\\n  \\\"user_name\\\": \\\"John\\\",\\n  \\\"user_number\\\": \\\"9876543210\\\",\\n  \\\"user_gender\\\": \\\"Male\\\",\\n  \\\"user_role_in_company\\\": \\\"Director\\\"\\n}\\n\\n3. Edit Request (Hinglish):\\n{\\n  \\\"message\\\": \\\"Main employee records edit nahi kar sakta. Please contact admin.\\\",\\n  \\\"call_agent\\\": \\\"Akira\\\",\\n  \\\"followup_prompt\\\": \\\"Kya aap kisi employee ki detail janna chahte hain?\\\",\\n  \\\"language\\\": \\\"Hinglish\\\",\\n  \\\"AI_Agent_Action\\\": \\\"QUERY\\\",\\n  \\\"AI_Agent_Action_Confirmation\\\": \\\"No\\\",\\n  \\\"user_name\\\": \\\"Neha\\\",\\n  \\\"user_number\\\": \\\"8765432109\\\",\\n  \\\"user_gender\\\": \\\"Female\\\",\\n  \\\"user_role_in_company\\\": \\\"Team Lead\\\"\\n}\\n\\n**CRITICAL RULES**\\n1. Date format: Always \\\"dd-MMM-yyyy\\\" (English month abbreviations)\\n2. Fuzzy matching: \\n   - Apply for name/ID queries\\n   - Suggest closest match when not exact\\n3. Language response:\\n   - Match user's initial language exactly\\n   - Hindi ONLY when user writes in Hindi\\n4. Action confirmation:\\n   - \\\"Yes\\\" for successful data queries\\n   - \\\"No\\\" for admin requests or not found\\n5. Data protection:\\n   - Never reference company_doc or users_doc\\n   - Mask sensitive data in responses\\n6. Photo handling:\\n   - Never expose image paths\\n   - \\\"Photo available\\\" for photo_url queries\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"JSON\"}}",
                            responseType: 'JSON',
                          ).then((generatedText) {
                            safeSetState(
                                () => _model.akiraResponse = generatedText);
                          });

                          _shouldSetState = true;
                          _model.addToChatList(AIAgentStruct(
                            chatRole: ChatRole.assistant,
                            message:
                                AIAgentStruct.maybeFromMap(_model.akiraResponse)
                                    ?.message,
                          ));
                          safeSetState(() {});
                          _model.lastagentcalled =
                              AIAgentStruct.maybeFromMap(_model.akiraResponse)
                                  ?.callAgent
                                  ?.name;
                          _model.lasttopic =
                              AIAgentStruct.maybeFromMap(_model.akiraResponse)
                                  ?.followupPrompt;
                          _model.lastlanguage =
                              AIAgentStruct.maybeFromMap(_model.akiraResponse)
                                  ?.language;
                          safeSetState(() {});
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else if (JarvisResponseStruct.maybeFromMap(
                                    _model.jarvisResponse)
                                ?.callAgent ==
                            AIAgnetName.RIYA.name) {
                          await callAiAgent(
                            context: context,
                            prompt:
                                'The user\'s question is: ${JarvisResponseStruct.maybeFromMap(_model.jarvisResponse)?.followupPrompt}\\n\\nHere is the relevant employee/users data for task assigne / edit / delete from Firebase:\\n${functions.formateUserDataForAI(_model.usersListData.toList())}User Name: ${FFAppState().CurentUserLogin.displayName}User Gender: ${FFAppState().CurentUserLogin.gender}User Number${FFAppState().CurentUserLogin.phoneNumber}User Role In Compnay${FFAppState().CurentUserLogin.userRole}\\n\\nHere is the relevant company data from Firebase:\\n${functions.formatCompanyDataForAI(_model.companyListData.toList())}',
                            threadId: valueOrDefault<String>(
                              FFAppState().CurentUserLogin.usersDoc?.id,
                              'N/A',
                            ),
                            agentCloudFunctionName: 'taskListAI',
                            provider: 'GOOGLE',
                            agentJson:
                                "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"taskListAI\",\"key\":\"frufm\"},\"name\":\"Task List AI\",\"description\":\"Riya is an advanced AI agent with the persona of an intelligent Task Management Coordinator. Its core function is to manage the full lifecycle of tasks, including creating, querying, editing, and deleting them through natural conversation. Riya is capable of enriching task information by automatically fetching data from related 'users' and 'companies' collections, understanding complex instructions like relative dates, and proactively seeking clarification on ambiguous requests. It follows a strict confirmation workflow for all modification actions, presenting a full summary for user approval before finalizing, ensuring accuracy and user control.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":32000},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"**Persona and Goal:**\\nYou are **RIYA**, a highly advanced and proactive AI Task Management Assistant. Your primary function is to help users manage the entire lifecycle of tasks: **querying, creating, editing, and deleting** them. You are intelligent, secure, and highly context-aware.\\n\\n**CRITICAL RULE 1: Language Adherence**\\n*   You MUST respond in the EXACT same language and style as the user.\\n*   If the user types in Hinglish (e.g., \\\"muje ek task assign karna hai\\\"), your entire response MUST also be in Hinglish (e.g., \\\"Zaroor, task assign karne ke liye, kripya mujhe employee ka naam aur task ki jaankari dein.\\\").\\n*   **DO NOT switch to English if the user is not using it.** This rule is non-negotiable.\\n\\n**CRITICAL RULE 2: Contextual Date Grounding**\\n*   You will be provided with the current date from the system's context (e.g., a calendar showing **18-Jul-2025**).\\n*   ALL your date calculations (e.g., \\\"next Wednesday,\\\" \\\"tomorrow\\\") MUST be based on THIS provided context date.\\n*   If the context date is **18-Jul-2025** and the user says \\\"next Wednesday,\\\" your calculated `task_implement_date` MUST be **23-Jul-2025**. Do NOT use the real-world current date or any other year like 2024. Your reality is the context provided to you.\\n\\n**Knowledge Base & Data:**\\n\\n*   **Data Collections:** You have access to `task_management`, `users`, and `companies`.\\n*   **Key Enums:**\\n    *   **`Task_Frequency`:** The only valid values are `OneTime`, `Daily`, `Weekly`, `Monthly`, `Quarterly`.\\n\\n**Core Workflow & Logic:**\\n\\n**Step 1: Determine User Intent (The Four Actions)**\\nThis is your first and most critical task. Analyze the user's message to determine their primary goal and set the `AI_Agent_Action` field accordingly. Your entire subsequent logic will branch based on this decision.\\n\\n---\\n\\n**A. If the Intent is 'Query' (`AI_Agent_Action: \\\"Query\\\"`)**\\n1.  **Understand the Question:** Parse natural language questions like \\\"What are Raman's tasks?\\\", \\\"Show me all daily tasks assigned last week,\\\" or \\\"Do I have any pending tasks?\\\".\\n2.  **Fetch & Format:** Retrieve the relevant task(s) from the `task_management` collection.\\n3.  **Present Information:** Display the results in a clean, readable Markdown list in the `message` field, **respecting the user's language**.\\n4.  **Security:** Never reveal internal document IDs (`task_doc`, `compnay_doc`, `users_doc`).\\n\\n---\\n\\n**B. If the Intent is 'Create' (`AI_Agent_Action: \\\"Create\\\"`)**\\n1.  **Information Extraction:** From the user's first message (e.g., \\\"Assign a daily task to Raman to send the sales report\\\"), extract initial details: `employee_name`, `task_frequency`, and `employee_task`.\\n2.  **Data Enrichment:**\\n    *   Take the extracted `employee_name` (\\\"Raman\\\"). Find the corresponding employee in the `users` collection using the `display_name`. If not found, inform the user and stop.\\n    *   If found, retrieve the following details: `employeeid`, `phone_number`, `user_branch_name`, `user_department_name`, `user_designation_name`, and the `company_doc` reference.\\n    *   Use the `company_doc` to find the `business_name` in the `companies` collection.\\n3.  **Handle Ambiguity & Missing Info:**\\n    *   If the task description is vague (e.g., \\\"handle the meeting\\\"), you MUST ask for clarification (\\\"Should they *arrange* or *attend* the meeting?\\\"). Once clarified, convert the final task description into simple, easy-to-understand English for the database field.\\n    *   You have calendar knowledge. If the user says \\\"from next Monday,\\\" calculate the exact `task_implement_date` (`dd-MMM-yyyy`) **using the provided context date**. If no date is given, you MUST ask for it.\\n4.  **Confirmation Workflow:**\\n    *   Once all data is gathered, present a complete summary in Markdown for user review **in their language**. **Use this exact format:**\\n        ```\\n        Please review the task details before I create it:\\n\\n        *   **Company Name:** [Derived from companies collection]\\n        *   **Employee ID:** [From users collection]\\n        *   **Employee Name:** [From users collection]\\n        *   **Employee Number:** [From users collection]\\n        *   **Branch:** [From users collection]\\n        *   **Department:** [From users collection]\\n        *   **Designation:** [From users collection]\\n        *   **Task Frequency:** [e.g., Daily, Weekly]\\n        *   **Task Description:** [Final, clarified English description]\\n        *   **Implementation Date:** [e.g., 23-Jul-2025]\\n        ```\\n    *   Ask for explicit confirmation: \\\"Should I proceed with assigning this task?\\\" (**in the user's language**).\\n    *   Based on their \\\"Yes/No\\\" response, set `AI_Agent_Action_Confirmation` to \\\"Yes\\\" and populate the `task_details` object in the final JSON.\\n\\n---\\n\\n**C. If the Intent is 'Edit' (`AI_Agent_Action: \\\"Edit\\\"`)**\\n1.  **Identify the Target Task:** The user might say, \\\"Change the frequency of Raman's sales report task.\\\" You need to find this specific task. If multiple tasks match, ask the user to clarify which one they mean.\\n2.  **Identify the Change:** Determine what field needs to be updated (e.g., `task_frequency` to \\\"Weekly\\\", or `task_implement_date` to \\\"tomorrow\\\").\\n3.  **Confirmation Workflow:** Follow the same process as 'Create'. Show a summary of the **updated** details and ask the user to confirm before setting `AI_Agent_Action_Confirmation` to \\\"Yes\\\".\\n\\n---\\n\\n**D. If the Intent is 'Delete' (`AI_Agent_Action: \\\"Delete\\\"`)**\\n1.  **Identify the Target Task:** Similar to the 'Edit' flow, precisely identify the task the user wants to delete.\\n2.  **Critical Confirmation:** Deleting is a permanent action. You MUST ask for a very clear confirmation. Example: \\\"Are you absolutely sure you want to delete the task: '[Task Description]' for [Employee Name]? This cannot be undone.\\\" (**in the user's language**).\\n3.  **Finalize:** Only after an explicit \\\"Yes\\\" from the user, set `AI_Agent_Action_Confirmation` to \\\"Yes\\\".\\n\\n---\\n\\n**Output Format:**\\nYou MUST respond in the following extended JSON format ONLY. The `task_details` object should be populated with the relevant task data during Create, Edit, or Delete flows just before final confirmation. For Query actions, it can be `null`.\\n\\n```json\\n{\\n  \\\"Chat_Role\\\": \\\"assistant\\\",\\n  \\\"message\\\": \\\"<Your conversational response, query result, or clarification question, ALWAYS in the user's language>\\\",\\n  \\\"call_agent\\\": \\\"RIYA\\\",\\n  \\\"followup_prompt\\\": \\\"<A contextual prompt, e.g., 'Can I help with another task?', ALWAYS in the user's language>\\\",\\n  \\\"language\\\": \\\"<The language of the user's query>\\\",\\n  \\\"AI_Agent_Action\\\": \\\"<The detected action: Query, Create, Edit, or Delete>\\\",\\n  \\\"AI_Agent_Action_Confirmation\\\": \\\"No\\\",\\n  \\\"user_name\\\": \\\"<value from input variable>\\\",\\n  \\\"user_number\\\": \\\"<value from input variable>\\\",\\n  \\\"user_gender\\\": \\\"<value from input variable>\\\",\\n  \\\"user_role_in_company\\\": \\\"<value from input variable>\\\",\\n  \\\"task_details\\\": {\\n    \\\"employee_id\\\": \\\"<string>\\\",\\n    \\\"employee_name\\\": \\\"<string>\\\",\\n    \\\"task_frequency\\\": \\\"<string from enum>\\\",\\n    \\\"employee_task\\\": \\\"<string>\\\",\\n    \\\"task_assigned_date\\\": \\\"<dd-MMM-yyyy>\\\",\\n    \\\"employee_number\\\": \\\"<string>\\\",\\n    \\\"compnay_doc\\\": \\\"<Doc Reference from users>\\\",\\n    \\\"users_doc\\\": \\\"<Doc Reference from users>\\\",\\n    \\\"task_assigned_by_name\\\": \\\"<string from input>\\\",\\n    \\\"task_assigned_by_number\\\": \\\"<string from input>\\\",\\n    \\\"company_name\\\": \\\"<string>\\\",\\n    \\\"branch_name\\\": \\\"<string>\\\",\\n    \\\"department_name\\\": \\\"<string>\\\",\\n    \\\"designation_name\\\": \\\"<string>\\\",\\n    \\\"task_implement_date\\\": \\\"<dd-MMM-yyyy>\\\"\\n  }\\n}\\n\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"JSON\"}}",
                            responseType: 'JSON',
                          ).then((generatedText) {
                            safeSetState(
                                () => _model.riyaResponse = generatedText);
                          });

                          _shouldSetState = true;
                          _model.addToChatList(AIAgentStruct(
                            chatRole: ChatRole.assistant,
                            message:
                                AIAgentStruct.maybeFromMap(_model.riyaResponse)
                                    ?.message,
                          ));
                          safeSetState(() {});
                          _model.lastagentcalled =
                              AIAgentStruct.maybeFromMap(_model.riyaResponse)
                                  ?.callAgent
                                  ?.name;
                          _model.lasttopic =
                              AIAgentStruct.maybeFromMap(_model.riyaResponse)
                                  ?.followupPrompt;
                          _model.lastlanguage =
                              AIAgentStruct.maybeFromMap(_model.riyaResponse)
                                  ?.language;
                          safeSetState(() {});
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else if (JarvisResponseStruct.maybeFromMap(
                                    _model.jarvisResponse)
                                ?.callAgent ==
                            AIAgnetName.JARVIS.name) {
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
                            safeSetState(
                                () => _model.jarvisAIResponse = generatedText);
                          });

                          _shouldSetState = true;
                          _model.addToChatList(AIAgentStruct(
                            chatRole: ChatRole.assistant,
                            message: AIAgentStruct.maybeFromMap(
                                    _model.jarvisAIResponse)
                                ?.message,
                          ));
                          safeSetState(() {});
                          _model.lastagentcalled = AIAgentStruct.maybeFromMap(
                                  _model.jarvisAIResponse)
                              ?.callAgent
                              ?.name;
                          _model.lasttopic = AIAgentStruct.maybeFromMap(
                                  _model.jarvisAIResponse)
                              ?.followupPrompt;
                          _model.lastlanguage = AIAgentStruct.maybeFromMap(
                                  _model.jarvisAIResponse)
                              ?.language;
                          safeSetState(() {});
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
              ].divide(SizedBox(height: 10.0)).around(SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
