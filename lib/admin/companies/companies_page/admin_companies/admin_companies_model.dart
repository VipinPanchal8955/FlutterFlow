import '/backend/backend.dart';
import '/component/web_navbar/web_navbar_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_companies_widget.dart' show AdminCompaniesWidget;
import 'package:flutter/material.dart';

class AdminCompaniesModel extends FlutterFlowModel<AdminCompaniesWidget> {
  ///  Local state fields for this page.

  List<CompaniesRecord> companyList = [];
  void addToCompanyList(CompaniesRecord item) => companyList.add(item);
  void removeFromCompanyList(CompaniesRecord item) => companyList.remove(item);
  void removeAtIndexFromCompanyList(int index) => companyList.removeAt(index);
  void insertAtIndexInCompanyList(int index, CompaniesRecord item) =>
      companyList.insert(index, item);
  void updateCompanyListAtIndex(
          int index, Function(CompaniesRecord) updateFn) =>
      companyList[index] = updateFn(companyList[index]);

  CompaniesRecord? lastCompany;

  int? companyCount;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Companies widget.
  List<CompaniesRecord>? compniesList;
  // Stores action output result for [Firestore Query - Query a collection] action in Admin_Companies widget.
  int? compniesCount;
  // Model for Web_Navbar component.
  late WebNavbarModel webNavbarModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? addNewCompnayCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CompaniesRecord>? addNewCompnay;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<CompaniesRecord>();
  // Stores action output result for [Firestore Query - Query a collection] action in PaginatedDataTable widget.
  List<CompaniesRecord>? newPage;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  int? editCompnayCount;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<CompaniesRecord>? editCompnayQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  int? deleteCompanyCount;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<CompaniesRecord>? deleteCompany;

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
