import '/component/web_navbar/web_navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_task_widget.dart' show AdminTaskWidget;
import 'package:flutter/material.dart';

class AdminTaskModel extends FlutterFlowModel<AdminTaskWidget> {
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
