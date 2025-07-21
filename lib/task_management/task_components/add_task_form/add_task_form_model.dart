import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/task_management/task_components/read_only_text_field_component/read_only_text_field_component_widget.dart';
import 'add_task_form_widget.dart' show AddTaskFormWidget;
import 'package:flutter/material.dart';

class AddTaskFormModel extends FlutterFlowModel<AddTaskFormWidget> {
  ///  Local state fields for this component.

  DateTime? selectedDate;

  List<UsersRecord> selectedEmployee = [];
  void addToSelectedEmployee(UsersRecord item) => selectedEmployee.add(item);
  void removeFromSelectedEmployee(UsersRecord item) =>
      selectedEmployee.remove(item);
  void removeAtIndexFromSelectedEmployee(int index) =>
      selectedEmployee.removeAt(index);
  void insertAtIndexInSelectedEmployee(int index, UsersRecord item) =>
      selectedEmployee.insert(index, item);
  void updateSelectedEmployeeAtIndex(
          int index, Function(UsersRecord) updateFn) =>
      selectedEmployee[index] = updateFn(selectedEmployee[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Models for ReadOnlyTextFieldComponent dynamic component.
  late FlutterFlowDynamicModels<ReadOnlyTextFieldComponentModel>
      readOnlyTextFieldComponentModels;
  // State field(s) for Task_Frequency widget.
  String? taskFrequencyValue;
  FormFieldController<String>? taskFrequencyValueController;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Assignee Task is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 500) {
      return 'Maximum 500 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Validate Form] action in IconButton widget.
  bool? formValid;
  // Stores action output result for [AI Agent - Send Message to Task Tittle And Message] action in IconButton widget.
  Map<String, dynamic>? englishGuruResponse;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  TaskManagementRecord? taskAssigne;

  @override
  void initState(BuildContext context) {
    readOnlyTextFieldComponentModels =
        FlutterFlowDynamicModels(() => ReadOnlyTextFieldComponentModel());
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    readOnlyTextFieldComponentModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
