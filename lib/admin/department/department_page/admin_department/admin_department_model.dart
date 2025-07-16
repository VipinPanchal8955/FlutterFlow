import '/backend/backend.dart';
import '/component/web_navbar/web_navbar_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_department_widget.dart' show AdminDepartmentWidget;
import 'package:flutter/material.dart';

class AdminDepartmentModel extends FlutterFlowModel<AdminDepartmentWidget> {
  ///  Local state fields for this page.

  List<CompaniesDepartmentsRecord> departmentListPageState = [];
  void addToDepartmentListPageState(CompaniesDepartmentsRecord item) =>
      departmentListPageState.add(item);
  void removeFromDepartmentListPageState(CompaniesDepartmentsRecord item) =>
      departmentListPageState.remove(item);
  void removeAtIndexFromDepartmentListPageState(int index) =>
      departmentListPageState.removeAt(index);
  void insertAtIndexInDepartmentListPageState(
          int index, CompaniesDepartmentsRecord item) =>
      departmentListPageState.insert(index, item);
  void updateDepartmentListPageStateAtIndex(
          int index, Function(CompaniesDepartmentsRecord) updateFn) =>
      departmentListPageState[index] = updateFn(departmentListPageState[index]);

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

  CompaniesDepartmentsRecord? lastDepartment;

  int? countOfDepartment;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Department widget.
  List<CompaniesRecord>? companiesListForAdmin;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Department widget.
  List<CompaniesDepartmentsRecord>? departmentListForAdmin;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Department widget.
  int? departmentListCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Department widget.
  CompaniesRecord? compnaniesForCompnayOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Department widget.
  List<CompaniesDepartmentsRecord>? departmentForCompnayOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Department widget.
  int? departmentListCountOwner;
  // Model for Web_Navbar component.
  late WebNavbarModel webNavbarModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? addDepartmentCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CompaniesDepartmentsRecord>? refreshedDepartment;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? ownerAddDepartmentCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CompaniesDepartmentsRecord>? ownerRefreshedDepartment;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<CompaniesDepartmentsRecord>();
  // Stores action output result for [Firestore Query - Query a collection] action in PaginatedDataTable widget.
  List<CompaniesDepartmentsRecord>? newPageAdmin;
  // Stores action output result for [Firestore Query - Query a collection] action in PaginatedDataTable widget.
  List<CompaniesDepartmentsRecord>? newPageOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  int? afterDeleteDepartmentCountOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<CompaniesDepartmentsRecord>? deleteDepartmentOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  int? afterDeleteBranchsCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<CompaniesDepartmentsRecord>? deleteDepartment;

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
