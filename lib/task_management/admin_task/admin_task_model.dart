import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/web_navbar/web_navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_task_widget.dart' show AdminTaskWidget;
import 'package:flutter/material.dart';

class AdminTaskModel extends FlutterFlowModel<AdminTaskWidget> {
  ///  Local state fields for this page.

  List<AIAgentStruct> chatList = [];
  void addToChatList(AIAgentStruct item) => chatList.add(item);
  void removeFromChatList(AIAgentStruct item) => chatList.remove(item);
  void removeAtIndexFromChatList(int index) => chatList.removeAt(index);
  void insertAtIndexInChatList(int index, AIAgentStruct item) =>
      chatList.insert(index, item);
  void updateChatListAtIndex(int index, Function(AIAgentStruct) updateFn) =>
      chatList[index] = updateFn(chatList[index]);

  List<CompnayListStruct> companyListData = [];
  void addToCompanyListData(CompnayListStruct item) =>
      companyListData.add(item);
  void removeFromCompanyListData(CompnayListStruct item) =>
      companyListData.remove(item);
  void removeAtIndexFromCompanyListData(int index) =>
      companyListData.removeAt(index);
  void insertAtIndexInCompanyListData(int index, CompnayListStruct item) =>
      companyListData.insert(index, item);
  void updateCompanyListDataAtIndex(
          int index, Function(CompnayListStruct) updateFn) =>
      companyListData[index] = updateFn(companyListData[index]);

  List<UsersListStruct> usersListData = [];
  void addToUsersListData(UsersListStruct item) => usersListData.add(item);
  void removeFromUsersListData(UsersListStruct item) =>
      usersListData.remove(item);
  void removeAtIndexFromUsersListData(int index) =>
      usersListData.removeAt(index);
  void insertAtIndexInUsersListData(int index, UsersListStruct item) =>
      usersListData.insert(index, item);
  void updateUsersListDataAtIndex(
          int index, Function(UsersListStruct) updateFn) =>
      usersListData[index] = updateFn(usersListData[index]);

  List<BranchesListStruct> branchListData = [];
  void addToBranchListData(BranchesListStruct item) => branchListData.add(item);
  void removeFromBranchListData(BranchesListStruct item) =>
      branchListData.remove(item);
  void removeAtIndexFromBranchListData(int index) =>
      branchListData.removeAt(index);
  void insertAtIndexInBranchListData(int index, BranchesListStruct item) =>
      branchListData.insert(index, item);
  void updateBranchListDataAtIndex(
          int index, Function(BranchesListStruct) updateFn) =>
      branchListData[index] = updateFn(branchListData[index]);

  List<DepartmentsListStruct> departmentListData = [];
  void addToDepartmentListData(DepartmentsListStruct item) =>
      departmentListData.add(item);
  void removeFromDepartmentListData(DepartmentsListStruct item) =>
      departmentListData.remove(item);
  void removeAtIndexFromDepartmentListData(int index) =>
      departmentListData.removeAt(index);
  void insertAtIndexInDepartmentListData(
          int index, DepartmentsListStruct item) =>
      departmentListData.insert(index, item);
  void updateDepartmentListDataAtIndex(
          int index, Function(DepartmentsListStruct) updateFn) =>
      departmentListData[index] = updateFn(departmentListData[index]);

  List<DesignationsListStruct> designationListData = [];
  void addToDesignationListData(DesignationsListStruct item) =>
      designationListData.add(item);
  void removeFromDesignationListData(DesignationsListStruct item) =>
      designationListData.remove(item);
  void removeAtIndexFromDesignationListData(int index) =>
      designationListData.removeAt(index);
  void insertAtIndexInDesignationListData(
          int index, DesignationsListStruct item) =>
      designationListData.insert(index, item);
  void updateDesignationListDataAtIndex(
          int index, Function(DesignationsListStruct) updateFn) =>
      designationListData[index] = updateFn(designationListData[index]);

  String? lastagentcalled;

  String? lasttopic;

  String? lastlanguage;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (GET Companies Collection Admin)] action in Admin_Task widget.
  ApiCallResponse? gETCompaniesCollectionAdmin;
  // Stores action output result for [Backend Call - API (GET User Collection Admin)] action in Admin_Task widget.
  ApiCallResponse? gETUserCollectionAdmin;
  // Stores action output result for [Backend Call - API (GET Branch Collection Admin)] action in Admin_Task widget.
  ApiCallResponse? gETBranchCollectionAdmin;
  // Stores action output result for [Backend Call - API (GET Department Collection Admin)] action in Admin_Task widget.
  ApiCallResponse? gETDepartmentCollectionAdmin;
  // Stores action output result for [Backend Call - API (GET Designation Collection Admin)] action in Admin_Task widget.
  ApiCallResponse? gETDesignationCollectionAdmin;
  // Stores action output result for [Backend Call - API (GET Companies Collection Owner)] action in Admin_Task widget.
  ApiCallResponse? gETCompaniesCollectionOwner;
  // Stores action output result for [Backend Call - API (GET User Collection Owner)] action in Admin_Task widget.
  ApiCallResponse? gETUserCollectionOwner;
  // Stores action output result for [Backend Call - API (GET Branch Collection Owner)] action in Admin_Task widget.
  ApiCallResponse? gETBranchCollectionOwner;
  // Stores action output result for [Backend Call - API (GET Departments Collection Owner)] action in Admin_Task widget.
  ApiCallResponse? gETDepartmentsCollectionOwner;
  // Stores action output result for [Backend Call - API (GET Designations Collection Owner)] action in Admin_Task widget.
  ApiCallResponse? gETDesignationCollectionOwner;
  // Model for Web_Navbar component.
  late WebNavbarModel webNavbarModel;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for User_Text_Field widget.
  FocusNode? userTextFieldFocusNode;
  TextEditingController? userTextFieldTextController;
  String? Function(BuildContext, String?)? userTextFieldTextControllerValidator;
  // Stores action output result for [AI Agent - Send Message to Jarvis] action in IconButton widget.
  Map<String, dynamic>? jarvisResponse;
  // Stores action output result for [AI Agent - Send Message to Companies List AI] action in IconButton widget.
  Map<String, dynamic>? sophiaResponse;
  // Stores action output result for [AI Agent - Send Message to Branch List AI] action in IconButton widget.
  Map<String, dynamic>? elaraResponse;
  // Stores action output result for [AI Agent - Send Message to Department List AI] action in IconButton widget.
  Map<String, dynamic>? lyraResponse;
  // Stores action output result for [AI Agent - Send Message to Designation List AI] action in IconButton widget.
  Map<String, dynamic>? veraResponse;
  // Stores action output result for [AI Agent - Send Message to Employee List AI] action in IconButton widget.
  Map<String, dynamic>? akiraResponse;
  // Stores action output result for [AI Agent - Send Message to Task List AI] action in IconButton widget.
  Map<String, dynamic>? riyaResponse;
  // Stores action output result for [AI Agent - Send Message to Jarvis] action in IconButton widget.
  Map<String, dynamic>? jarvisAIResponse;

  @override
  void initState(BuildContext context) {
    webNavbarModel = createModel(context, () => WebNavbarModel());
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    webNavbarModel.dispose();
    listViewController?.dispose();
    userTextFieldFocusNode?.dispose();
    userTextFieldTextController?.dispose();
  }
}
