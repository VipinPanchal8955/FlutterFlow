import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for MobileNumber widget.
  FocusNode? mobileNumberFocusNode;
  TextEditingController? mobileNumberTextController;
  String? Function(BuildContext, String?)? mobileNumberTextControllerValidator;
  String? _mobileNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Mobile Number is required.';
    }

    if (val.length < 10) {
      return 'Enter Valid 10 digits for mobile number.';
    }
    if (val.length > 10) {
      return 'Enter Valid 10 digits for mobile number';
    }
    if (!RegExp('^[6-9]\\d{9}\$').hasMatch(val)) {
      return 'Enter Valid 10 digits for mobile number.';
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? matchUser;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompaniesRecord? matchCompany;

  @override
  void initState(BuildContext context) {
    mobileNumberTextControllerValidator = _mobileNumberTextControllerValidator;
  }

  @override
  void dispose() {
    mobileNumberFocusNode?.dispose();
    mobileNumberTextController?.dispose();
  }
}
