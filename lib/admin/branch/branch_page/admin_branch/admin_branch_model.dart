import '/backend/backend.dart';
import '/component/web_navbar/web_navbar_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_branch_widget.dart' show AdminBranchWidget;
import 'package:flutter/material.dart';

class AdminBranchModel extends FlutterFlowModel<AdminBranchWidget> {
  ///  Local state fields for this page.

  List<CompaniesBranchesRecord> branchListPageState = [];
  void addToBranchListPageState(CompaniesBranchesRecord item) =>
      branchListPageState.add(item);
  void removeFromBranchListPageState(CompaniesBranchesRecord item) =>
      branchListPageState.remove(item);
  void removeAtIndexFromBranchListPageState(int index) =>
      branchListPageState.removeAt(index);
  void insertAtIndexInBranchListPageState(
          int index, CompaniesBranchesRecord item) =>
      branchListPageState.insert(index, item);
  void updateBranchListPageStateAtIndex(
          int index, Function(CompaniesBranchesRecord) updateFn) =>
      branchListPageState[index] = updateFn(branchListPageState[index]);

  List<CompaniesRecord> companiesListPageState = [];
  void addToCompaniesListPageState(CompaniesRecord item) =>
      companiesListPageState.add(item);
  void removeFromCompaniesListPageState(CompaniesRecord item) =>
      companiesListPageState.remove(item);
  void removeAtIndexFromCompaniesListPageState(int index) =>
      companiesListPageState.removeAt(index);
  void insertAtIndexInCompaniesListPageState(int index, CompaniesRecord item) =>
      companiesListPageState.insert(index, item);
  void updateCompaniesListPageStateAtIndex(
          int index, Function(CompaniesRecord) updateFn) =>
      companiesListPageState[index] = updateFn(companiesListPageState[index]);

  CompaniesRecord? ownerCompany;

  CompaniesBranchesRecord? lastBranch;

  int? countOfBranch;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Branch widget.
  List<CompaniesRecord>? companiesListForAdmin;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Branch widget.
  List<CompaniesBranchesRecord>? brachListForAdmin;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Branch widget.
  int? brachListCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Branch widget.
  CompaniesRecord? compnaniesForCompnayOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Branch widget.
  List<CompaniesBranchesRecord>? branchForCompnayOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Branch widget.
  int? brachListCountOwner;
  // Model for Web_Navbar component.
  late WebNavbarModel webNavbarModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? addBranchCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CompaniesBranchesRecord>? refreshedBranches;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? ownerbranchrefreshCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CompaniesBranchesRecord>? ownerbranchrefresh;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<CompaniesBranchesRecord>();
  // Stores action output result for [Firestore Query - Query a collection] action in PaginatedDataTable widget.
  List<CompaniesBranchesRecord>? newPageAdmin;
  // Stores action output result for [Firestore Query - Query a collection] action in PaginatedDataTable widget.
  List<CompaniesBranchesRecord>? newPageOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  int? afterDeleteBranchsCountOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<CompaniesBranchesRecord>? deleteBranchOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  int? afterDeleteBranchsCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<CompaniesBranchesRecord>? deleteBranch;

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
