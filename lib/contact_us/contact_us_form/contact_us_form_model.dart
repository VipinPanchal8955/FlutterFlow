import '/flutter_flow/flutter_flow_util.dart';
import 'contact_us_form_widget.dart' show ContactUsFormWidget;
import 'package:flutter/material.dart';

class ContactUsFormModel extends FlutterFlowModel<ContactUsFormWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for Mobilenumber widget.
  FocusNode? mobilenumberFocusNode;
  TextEditingController? mobilenumberTextController;
  String? Function(BuildContext, String?)? mobilenumberTextControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    mobilenumberFocusNode?.dispose();
    mobilenumberTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
