import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_owner_form_widget.dart' show AddOwnerFormWidget;
import 'package:flutter/material.dart';

class AddOwnerFormModel extends FlutterFlowModel<AddOwnerFormWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Employee_Name widget.
  FocusNode? employeeNameFocusNode;
  TextEditingController? employeeNameTextController;
  String? Function(BuildContext, String?)? employeeNameTextControllerValidator;
  String? _employeeNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Employee Name is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }
    if (val.length > 50) {
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^[A-Za-z\\s]+\$').hasMatch(val)) {
      return 'Only letters (A–Z) and spaces are allowed.';
    }
    return null;
  }

  // State field(s) for Employee_Mobile_Number widget.
  FocusNode? employeeMobileNumberFocusNode;
  TextEditingController? employeeMobileNumberTextController;
  String? Function(BuildContext, String?)?
      employeeMobileNumberTextControllerValidator;
  String? _employeeMobileNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Mobile Number is required';
    }

    if (val.length < 10) {
      return 'Enter Valid 10 digits for mobile number';
    }
    if (val.length > 10) {
      return 'Enter Valid 10 digits for mobile number';
    }
    if (!RegExp('^[6-9]\\d{9}\$').hasMatch(val)) {
      return 'Enter Valid 10 digits for mobile number';
    }
    return null;
  }

  // State field(s) for Employee_Email widget.
  FocusNode? employeeEmailFocusNode;
  TextEditingController? employeeEmailTextController;
  String? Function(BuildContext, String?)? employeeEmailTextControllerValidator;
  String? _employeeEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email ID is required';
    }

    if (val.length < 6) {
      return '\tEmail must be at least 6 characters long.';
    }
    if (val.length > 254) {
      return 'Maximum 254 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}\$')
        .hasMatch(val)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  // State field(s) for Employee_Gender widget.
  String? employeeGenderValue;
  FormFieldController<String>? employeeGenderValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? compnayAdminForm;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? userQueary;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UsersRecord? companyAdminAccount;

  @override
  void initState(BuildContext context) {
    employeeNameTextControllerValidator = _employeeNameTextControllerValidator;
    employeeMobileNumberTextControllerValidator =
        _employeeMobileNumberTextControllerValidator;
    employeeEmailTextControllerValidator =
        _employeeEmailTextControllerValidator;
  }

  @override
  void dispose() {
    employeeNameFocusNode?.dispose();
    employeeNameTextController?.dispose();

    employeeMobileNumberFocusNode?.dispose();
    employeeMobileNumberTextController?.dispose();

    employeeEmailFocusNode?.dispose();
    employeeEmailTextController?.dispose();
  }
}
