import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'loding_page_widget.dart' show LodingPageWidget;
import 'package:flutter/material.dart';

class LodingPageModel extends FlutterFlowModel<LodingPageWidget> {
  ///  Local state fields for this page.

  DocumentReference? selectedCompanyDoc;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Loding_Page widget.
  UsersRecord? userQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in Loding_Page widget.
  CompaniesRecord? companyQuery;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
