import '/backend/backend.dart';
import '/component/web_navbar/web_navbar_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_designation_widget.dart' show AdminDesignationWidget;
import 'package:flutter/material.dart';

class AdminDesignationModel extends FlutterFlowModel<AdminDesignationWidget> {
  ///  Local state fields for this page.

  List<CompaniesDesignationsRecord> designationListPageState = [];
  void addToDesignationListPageState(CompaniesDesignationsRecord item) =>
      designationListPageState.add(item);
  void removeFromDesignationListPageState(CompaniesDesignationsRecord item) =>
      designationListPageState.remove(item);
  void removeAtIndexFromDesignationListPageState(int index) =>
      designationListPageState.removeAt(index);
  void insertAtIndexInDesignationListPageState(
          int index, CompaniesDesignationsRecord item) =>
      designationListPageState.insert(index, item);
  void updateDesignationListPageStateAtIndex(
          int index, Function(CompaniesDesignationsRecord) updateFn) =>
      designationListPageState[index] =
          updateFn(designationListPageState[index]);

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

  CompaniesDesignationsRecord? lastdesignation;

  int? countOfdesignation;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Designation widget.
  List<CompaniesRecord>? companiesListForAdmin;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Designation widget.
  List<CompaniesDesignationsRecord>? designationListForAdmin;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Designation widget.
  int? designationListCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Designation widget.
  CompaniesRecord? compnaniesForCompnayOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Designation widget.
  List<CompaniesDesignationsRecord>? designationForCompnayOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Designation widget.
  int? designationListCountOwner;
  // Model for Web_Navbar component.
  late WebNavbarModel webNavbarModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? addDesignationCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CompaniesDesignationsRecord>? refreshedDesignation;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? addDesignationCountOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CompaniesDesignationsRecord>? refreshedDesignationOwner;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<CompaniesDesignationsRecord>();
  // Stores action output result for [Firestore Query - Query a collection] action in PaginatedDataTable widget.
  List<CompaniesDesignationsRecord>? newPageAdmin;
  // Stores action output result for [Firestore Query - Query a collection] action in PaginatedDataTable widget.
  List<CompaniesDesignationsRecord>? newPageOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  int? afterDeleteDesignationCountOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<CompaniesDesignationsRecord>? deleteDesignationOwner;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  int? afterDeletedesignationCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<CompaniesDesignationsRecord>? deleteDesignation;

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
