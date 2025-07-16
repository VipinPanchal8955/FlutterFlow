import '/component/web_navbar/web_navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'company_dashboard_widget.dart' show CompanyDashboardWidget;
import 'package:flutter/material.dart';

class CompanyDashboardModel extends FlutterFlowModel<CompanyDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Web_Navbar component.
  late WebNavbarModel webNavbarModel;

  @override
  void initState(BuildContext context) {
    webNavbarModel = createModel(context, () => WebNavbarModel());
  }

  @override
  void dispose() {
    webNavbarModel.dispose();
  }
}
