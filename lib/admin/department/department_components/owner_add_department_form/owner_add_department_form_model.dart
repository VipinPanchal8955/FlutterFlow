import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'owner_add_department_form_widget.dart'
    show OwnerAddDepartmentFormWidget;
import 'package:flutter/material.dart';

class OwnerAddDepartmentFormModel
    extends FlutterFlowModel<OwnerAddDepartmentFormWidget> {
  ///  Local state fields for this component.

  CompaniesRecord? selectedCompany;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Company_Department widget.
  FocusNode? companyDepartmentFocusNode;
  TextEditingController? companyDepartmentTextController;
  String? Function(BuildContext, String?)?
      companyDepartmentTextControllerValidator;
  String? _companyDepartmentTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Company Name is required';
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

  // Stores action output result for [Validate Form] action in Button widget.
  bool? ownerCompanyBranchForm;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompaniesDepartmentsRecord? ownerDepartmentCreated;

  @override
  void initState(BuildContext context) {
    companyDepartmentTextControllerValidator =
        _companyDepartmentTextControllerValidator;
  }

  @override
  void dispose() {
    companyDepartmentFocusNode?.dispose();
    companyDepartmentTextController?.dispose();
  }
}
