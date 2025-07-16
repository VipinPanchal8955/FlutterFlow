import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'admind_add_designation_form_widget.dart'
    show AdmindAddDesignationFormWidget;
import 'package:flutter/material.dart';

class AdmindAddDesignationFormModel
    extends FlutterFlowModel<AdmindAddDesignationFormWidget> {
  ///  Local state fields for this component.

  List<CompaniesRecord> selectedCompnay = [];
  void addToSelectedCompnay(CompaniesRecord item) => selectedCompnay.add(item);
  void removeFromSelectedCompnay(CompaniesRecord item) =>
      selectedCompnay.remove(item);
  void removeAtIndexFromSelectedCompnay(int index) =>
      selectedCompnay.removeAt(index);
  void insertAtIndexInSelectedCompnay(int index, CompaniesRecord item) =>
      selectedCompnay.insert(index, item);
  void updateSelectedCompnayAtIndex(
          int index, Function(CompaniesRecord) updateFn) =>
      selectedCompnay[index] = updateFn(selectedCompnay[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<CompaniesRecord>? selectedCompnaniesQuery;
  // State field(s) for Company_Designation widget.
  FocusNode? companyDesignationFocusNode;
  TextEditingController? companyDesignationTextController;
  String? Function(BuildContext, String?)?
      companyDesignationTextControllerValidator;
  String? _companyDesignationTextControllerValidator(
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

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompaniesDesignationsRecord? adminCreatedDesignation;

  @override
  void initState(BuildContext context) {
    companyDesignationTextControllerValidator =
        _companyDesignationTextControllerValidator;
  }

  @override
  void dispose() {
    companyDesignationFocusNode?.dispose();
    companyDesignationTextController?.dispose();
  }
}
