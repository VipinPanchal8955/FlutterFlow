import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_employee_form_widget.dart' show EditEmployeeFormWidget;
import 'package:flutter/material.dart';

class EditEmployeeFormModel extends FlutterFlowModel<EditEmployeeFormWidget> {
  ///  Local state fields for this component.

  List<CompaniesBranchesRecord> branchList = [];
  void addToBranchList(CompaniesBranchesRecord item) => branchList.add(item);
  void removeFromBranchList(CompaniesBranchesRecord item) =>
      branchList.remove(item);
  void removeAtIndexFromBranchList(int index) => branchList.removeAt(index);
  void insertAtIndexInBranchList(int index, CompaniesBranchesRecord item) =>
      branchList.insert(index, item);
  void updateBranchListAtIndex(
          int index, Function(CompaniesBranchesRecord) updateFn) =>
      branchList[index] = updateFn(branchList[index]);

  List<CompaniesDepartmentsRecord> departmentList = [];
  void addToDepartmentList(CompaniesDepartmentsRecord item) =>
      departmentList.add(item);
  void removeFromDepartmentList(CompaniesDepartmentsRecord item) =>
      departmentList.remove(item);
  void removeAtIndexFromDepartmentList(int index) =>
      departmentList.removeAt(index);
  void insertAtIndexInDepartmentList(
          int index, CompaniesDepartmentsRecord item) =>
      departmentList.insert(index, item);
  void updateDepartmentListAtIndex(
          int index, Function(CompaniesDepartmentsRecord) updateFn) =>
      departmentList[index] = updateFn(departmentList[index]);

  List<CompaniesDesignationsRecord> designationList = [];
  void addToDesignationList(CompaniesDesignationsRecord item) =>
      designationList.add(item);
  void removeFromDesignationList(CompaniesDesignationsRecord item) =>
      designationList.remove(item);
  void removeAtIndexFromDesignationList(int index) =>
      designationList.removeAt(index);
  void insertAtIndexInDesignationList(
          int index, CompaniesDesignationsRecord item) =>
      designationList.insert(index, item);
  void updateDesignationListAtIndex(
          int index, Function(CompaniesDesignationsRecord) updateFn) =>
      designationList[index] = updateFn(designationList[index]);

  DateTime? selectedDate;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in Edit_Employee_form widget.
  List<CompaniesBranchesRecord>? companyBranch;
  // Stores action output result for [Firestore Query - Query a collection] action in Edit_Employee_form widget.
  List<CompaniesDepartmentsRecord>? companyDepartment;
  // Stores action output result for [Firestore Query - Query a collection] action in Edit_Employee_form widget.
  List<CompaniesDesignationsRecord>? companyDesignation;
  // Stores action output result for [Backend Call - Read Document] action in Edit_Employee_form widget.
  UsersRecord? editUserForCompany;
  // State field(s) for Employee_ID widget.
  FocusNode? employeeIDFocusNode;
  TextEditingController? employeeIDTextController;
  String? Function(BuildContext, String?)? employeeIDTextControllerValidator;
  String? _employeeIDTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Employee Code is required';
    }

    if (val.length < 1) {
      return 'Employee Code must be at least 1 character long.';
    }

    if (!RegExp('^\\d+\$').hasMatch(val)) {
      return 'Only numbers allowed.';
    }
    return null;
  }

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

  // State field(s) for Employee_Gender widget.
  String? employeeGenderValue;
  FormFieldController<String>? employeeGenderValueController;
  // State field(s) for Employee_Branch widget.
  String? employeeBranchValue;
  FormFieldController<String>? employeeBranchValueController;
  // State field(s) for Employee_Department widget.
  String? employeeDepartmentValue;
  FormFieldController<String>? employeeDepartmentValueController;
  // State field(s) for Employee_Designation widget.
  String? employeeDesignationValue;
  FormFieldController<String>? employeeDesignationValueController;
  // State field(s) for Employee_Role widget.
  String? employeeRoleValue;
  FormFieldController<String>? employeeRoleValueController;
  // State field(s) for Employee_Status widget.
  String? employeeStatusValue;
  FormFieldController<String>? employeeStatusValueController;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    employeeIDTextControllerValidator = _employeeIDTextControllerValidator;
    employeeNameTextControllerValidator = _employeeNameTextControllerValidator;
    employeeMobileNumberTextControllerValidator =
        _employeeMobileNumberTextControllerValidator;
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    employeeIDFocusNode?.dispose();
    employeeIDTextController?.dispose();

    employeeNameFocusNode?.dispose();
    employeeNameTextController?.dispose();

    employeeMobileNumberFocusNode?.dispose();
    employeeMobileNumberTextController?.dispose();
  }
}
