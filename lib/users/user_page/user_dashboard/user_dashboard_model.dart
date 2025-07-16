import '/component/web_navbar/web_navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_dashboard_widget.dart' show UserDashboardWidget;
import 'package:flutter/material.dart';

class UserDashboardModel extends FlutterFlowModel<UserDashboardWidget> {
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
