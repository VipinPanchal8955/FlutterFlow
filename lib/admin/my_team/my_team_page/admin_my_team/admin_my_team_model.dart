import '/backend/backend.dart';
import '/component/web_navbar/web_navbar_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_my_team_widget.dart' show AdminMyTeamWidget;
import 'package:flutter/material.dart';

class AdminMyTeamModel extends FlutterFlowModel<AdminMyTeamWidget> {
  ///  Local state fields for this page.

  List<UsersRecord> usersList = [];
  void addToUsersList(UsersRecord item) => usersList.add(item);
  void removeFromUsersList(UsersRecord item) => usersList.remove(item);
  void removeAtIndexFromUsersList(int index) => usersList.removeAt(index);
  void insertAtIndexInUsersList(int index, UsersRecord item) =>
      usersList.insert(index, item);
  void updateUsersListAtIndex(int index, Function(UsersRecord) updateFn) =>
      usersList[index] = updateFn(usersList[index]);

  UsersRecord? lastUser;

  int? usersCount;

  List<CompaniesRecord> adminCompanyList = [];
  void addToAdminCompanyList(CompaniesRecord item) =>
      adminCompanyList.add(item);
  void removeFromAdminCompanyList(CompaniesRecord item) =>
      adminCompanyList.remove(item);
  void removeAtIndexFromAdminCompanyList(int index) =>
      adminCompanyList.removeAt(index);
  void insertAtIndexInAdminCompanyList(int index, CompaniesRecord item) =>
      adminCompanyList.insert(index, item);
  void updateAdminCompanyListAtIndex(
          int index, Function(CompaniesRecord) updateFn) =>
      adminCompanyList[index] = updateFn(adminCompanyList[index]);

  CompaniesRecord? ownerCompnay;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Admin_MyTeam widget.
  List<CompaniesRecord>? companyList;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_MyTeam widget.
  List<UsersRecord>? ussrQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_MyTeam widget.
  int? ussrQueryCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_MyTeam widget.
  CompaniesRecord? ownerCompany;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_MyTeam widget.
  List<UsersRecord>? ussrQueryOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_MyTeam widget.
  int? ussrQueryCountOwner;
  // Model for Web_Navbar component.
  late WebNavbarModel webNavbarModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? refreshUserCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? refreshUserList;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? refreshUserCountOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? refreshUserListOwner;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<UsersRecord>();
  // Stores action output result for [Firestore Query - Query a collection] action in PaginatedDataTable widget.
  List<UsersRecord>? newPageAdmin;
  // Stores action output result for [Firestore Query - Query a collection] action in PaginatedDataTable widget.
  List<UsersRecord>? newPageOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  int? editUserCountAdmin;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<UsersRecord>? editUserListAdmin;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  int? editUserCountOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<UsersRecord>? editUserListOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  int? afterDeleteUserCountOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<UsersRecord>? deleteUserOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  int? afterDeleteUserCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<UsersRecord>? deleteUser;

  @override
  void initState(BuildContext context) {
    webNavbarModel = createModel(context, () => WebNavbarModel());
  }

  @override
  void dispose() {
    webNavbarModel.dispose();
    paginatedDataTableController.dispose();
  }
}
