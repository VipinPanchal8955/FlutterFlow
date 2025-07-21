// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskManagementStruct extends FFFirebaseStruct {
  TaskManagementStruct({
    String? employeeId,
    String? employeeName,
    TaskFrequency? taskFrequency,
    String? employeeTask,
    String? taskAssignedDate,
    String? employeeNumber,
    String? taskDoc,
    String? compnayDoc,
    String? usersDoc,
    String? taskAssignedByName,
    String? taskAssignedByNumber,
    String? companyName,
    String? branchName,
    String? departmentName,
    String? designationName,
    String? taskImplementDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _employeeId = employeeId,
        _employeeName = employeeName,
        _taskFrequency = taskFrequency,
        _employeeTask = employeeTask,
        _taskAssignedDate = taskAssignedDate,
        _employeeNumber = employeeNumber,
        _taskDoc = taskDoc,
        _compnayDoc = compnayDoc,
        _usersDoc = usersDoc,
        _taskAssignedByName = taskAssignedByName,
        _taskAssignedByNumber = taskAssignedByNumber,
        _companyName = companyName,
        _branchName = branchName,
        _departmentName = departmentName,
        _designationName = designationName,
        _taskImplementDate = taskImplementDate,
        super(firestoreUtilData);

  // "employee_id" field.
  String? _employeeId;
  String get employeeId => _employeeId ?? '';
  set employeeId(String? val) => _employeeId = val;

  bool hasEmployeeId() => _employeeId != null;

  // "employee_name" field.
  String? _employeeName;
  String get employeeName => _employeeName ?? '';
  set employeeName(String? val) => _employeeName = val;

  bool hasEmployeeName() => _employeeName != null;

  // "task_frequency" field.
  TaskFrequency? _taskFrequency;
  TaskFrequency? get taskFrequency => _taskFrequency;
  set taskFrequency(TaskFrequency? val) => _taskFrequency = val;

  bool hasTaskFrequency() => _taskFrequency != null;

  // "employee_task" field.
  String? _employeeTask;
  String get employeeTask => _employeeTask ?? '';
  set employeeTask(String? val) => _employeeTask = val;

  bool hasEmployeeTask() => _employeeTask != null;

  // "task_assigned_date" field.
  String? _taskAssignedDate;
  String get taskAssignedDate => _taskAssignedDate ?? '';
  set taskAssignedDate(String? val) => _taskAssignedDate = val;

  bool hasTaskAssignedDate() => _taskAssignedDate != null;

  // "employee_number" field.
  String? _employeeNumber;
  String get employeeNumber => _employeeNumber ?? '';
  set employeeNumber(String? val) => _employeeNumber = val;

  bool hasEmployeeNumber() => _employeeNumber != null;

  // "task_doc" field.
  String? _taskDoc;
  String get taskDoc => _taskDoc ?? '';
  set taskDoc(String? val) => _taskDoc = val;

  bool hasTaskDoc() => _taskDoc != null;

  // "compnay_doc" field.
  String? _compnayDoc;
  String get compnayDoc => _compnayDoc ?? '';
  set compnayDoc(String? val) => _compnayDoc = val;

  bool hasCompnayDoc() => _compnayDoc != null;

  // "users_doc" field.
  String? _usersDoc;
  String get usersDoc => _usersDoc ?? '';
  set usersDoc(String? val) => _usersDoc = val;

  bool hasUsersDoc() => _usersDoc != null;

  // "task_assigned_by_name" field.
  String? _taskAssignedByName;
  String get taskAssignedByName => _taskAssignedByName ?? '';
  set taskAssignedByName(String? val) => _taskAssignedByName = val;

  bool hasTaskAssignedByName() => _taskAssignedByName != null;

  // "task_assigned_by_number" field.
  String? _taskAssignedByNumber;
  String get taskAssignedByNumber => _taskAssignedByNumber ?? '';
  set taskAssignedByNumber(String? val) => _taskAssignedByNumber = val;

  bool hasTaskAssignedByNumber() => _taskAssignedByNumber != null;

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  set companyName(String? val) => _companyName = val;

  bool hasCompanyName() => _companyName != null;

  // "branch_name" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  set branchName(String? val) => _branchName = val;

  bool hasBranchName() => _branchName != null;

  // "department_name" field.
  String? _departmentName;
  String get departmentName => _departmentName ?? '';
  set departmentName(String? val) => _departmentName = val;

  bool hasDepartmentName() => _departmentName != null;

  // "designation_name" field.
  String? _designationName;
  String get designationName => _designationName ?? '';
  set designationName(String? val) => _designationName = val;

  bool hasDesignationName() => _designationName != null;

  // "task_implement_date" field.
  String? _taskImplementDate;
  String get taskImplementDate => _taskImplementDate ?? '';
  set taskImplementDate(String? val) => _taskImplementDate = val;

  bool hasTaskImplementDate() => _taskImplementDate != null;

  static TaskManagementStruct fromMap(Map<String, dynamic> data) =>
      TaskManagementStruct(
        employeeId: data['employee_id'] as String?,
        employeeName: data['employee_name'] as String?,
        taskFrequency: data['task_frequency'] is TaskFrequency
            ? data['task_frequency']
            : deserializeEnum<TaskFrequency>(data['task_frequency']),
        employeeTask: data['employee_task'] as String?,
        taskAssignedDate: data['task_assigned_date'] as String?,
        employeeNumber: data['employee_number'] as String?,
        taskDoc: data['task_doc'] as String?,
        compnayDoc: data['compnay_doc'] as String?,
        usersDoc: data['users_doc'] as String?,
        taskAssignedByName: data['task_assigned_by_name'] as String?,
        taskAssignedByNumber: data['task_assigned_by_number'] as String?,
        companyName: data['company_name'] as String?,
        branchName: data['branch_name'] as String?,
        departmentName: data['department_name'] as String?,
        designationName: data['designation_name'] as String?,
        taskImplementDate: data['task_implement_date'] as String?,
      );

  static TaskManagementStruct? maybeFromMap(dynamic data) => data is Map
      ? TaskManagementStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'employee_id': _employeeId,
        'employee_name': _employeeName,
        'task_frequency': _taskFrequency?.serialize(),
        'employee_task': _employeeTask,
        'task_assigned_date': _taskAssignedDate,
        'employee_number': _employeeNumber,
        'task_doc': _taskDoc,
        'compnay_doc': _compnayDoc,
        'users_doc': _usersDoc,
        'task_assigned_by_name': _taskAssignedByName,
        'task_assigned_by_number': _taskAssignedByNumber,
        'company_name': _companyName,
        'branch_name': _branchName,
        'department_name': _departmentName,
        'designation_name': _designationName,
        'task_implement_date': _taskImplementDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'employee_id': serializeParam(
          _employeeId,
          ParamType.String,
        ),
        'employee_name': serializeParam(
          _employeeName,
          ParamType.String,
        ),
        'task_frequency': serializeParam(
          _taskFrequency,
          ParamType.Enum,
        ),
        'employee_task': serializeParam(
          _employeeTask,
          ParamType.String,
        ),
        'task_assigned_date': serializeParam(
          _taskAssignedDate,
          ParamType.String,
        ),
        'employee_number': serializeParam(
          _employeeNumber,
          ParamType.String,
        ),
        'task_doc': serializeParam(
          _taskDoc,
          ParamType.String,
        ),
        'compnay_doc': serializeParam(
          _compnayDoc,
          ParamType.String,
        ),
        'users_doc': serializeParam(
          _usersDoc,
          ParamType.String,
        ),
        'task_assigned_by_name': serializeParam(
          _taskAssignedByName,
          ParamType.String,
        ),
        'task_assigned_by_number': serializeParam(
          _taskAssignedByNumber,
          ParamType.String,
        ),
        'company_name': serializeParam(
          _companyName,
          ParamType.String,
        ),
        'branch_name': serializeParam(
          _branchName,
          ParamType.String,
        ),
        'department_name': serializeParam(
          _departmentName,
          ParamType.String,
        ),
        'designation_name': serializeParam(
          _designationName,
          ParamType.String,
        ),
        'task_implement_date': serializeParam(
          _taskImplementDate,
          ParamType.String,
        ),
      }.withoutNulls;

  static TaskManagementStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskManagementStruct(
        employeeId: deserializeParam(
          data['employee_id'],
          ParamType.String,
          false,
        ),
        employeeName: deserializeParam(
          data['employee_name'],
          ParamType.String,
          false,
        ),
        taskFrequency: deserializeParam<TaskFrequency>(
          data['task_frequency'],
          ParamType.Enum,
          false,
        ),
        employeeTask: deserializeParam(
          data['employee_task'],
          ParamType.String,
          false,
        ),
        taskAssignedDate: deserializeParam(
          data['task_assigned_date'],
          ParamType.String,
          false,
        ),
        employeeNumber: deserializeParam(
          data['employee_number'],
          ParamType.String,
          false,
        ),
        taskDoc: deserializeParam(
          data['task_doc'],
          ParamType.String,
          false,
        ),
        compnayDoc: deserializeParam(
          data['compnay_doc'],
          ParamType.String,
          false,
        ),
        usersDoc: deserializeParam(
          data['users_doc'],
          ParamType.String,
          false,
        ),
        taskAssignedByName: deserializeParam(
          data['task_assigned_by_name'],
          ParamType.String,
          false,
        ),
        taskAssignedByNumber: deserializeParam(
          data['task_assigned_by_number'],
          ParamType.String,
          false,
        ),
        companyName: deserializeParam(
          data['company_name'],
          ParamType.String,
          false,
        ),
        branchName: deserializeParam(
          data['branch_name'],
          ParamType.String,
          false,
        ),
        departmentName: deserializeParam(
          data['department_name'],
          ParamType.String,
          false,
        ),
        designationName: deserializeParam(
          data['designation_name'],
          ParamType.String,
          false,
        ),
        taskImplementDate: deserializeParam(
          data['task_implement_date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TaskManagementStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaskManagementStruct &&
        employeeId == other.employeeId &&
        employeeName == other.employeeName &&
        taskFrequency == other.taskFrequency &&
        employeeTask == other.employeeTask &&
        taskAssignedDate == other.taskAssignedDate &&
        employeeNumber == other.employeeNumber &&
        taskDoc == other.taskDoc &&
        compnayDoc == other.compnayDoc &&
        usersDoc == other.usersDoc &&
        taskAssignedByName == other.taskAssignedByName &&
        taskAssignedByNumber == other.taskAssignedByNumber &&
        companyName == other.companyName &&
        branchName == other.branchName &&
        departmentName == other.departmentName &&
        designationName == other.designationName &&
        taskImplementDate == other.taskImplementDate;
  }

  @override
  int get hashCode => const ListEquality().hash([
        employeeId,
        employeeName,
        taskFrequency,
        employeeTask,
        taskAssignedDate,
        employeeNumber,
        taskDoc,
        compnayDoc,
        usersDoc,
        taskAssignedByName,
        taskAssignedByNumber,
        companyName,
        branchName,
        departmentName,
        designationName,
        taskImplementDate
      ]);
}

TaskManagementStruct createTaskManagementStruct({
  String? employeeId,
  String? employeeName,
  TaskFrequency? taskFrequency,
  String? employeeTask,
  String? taskAssignedDate,
  String? employeeNumber,
  String? taskDoc,
  String? compnayDoc,
  String? usersDoc,
  String? taskAssignedByName,
  String? taskAssignedByNumber,
  String? companyName,
  String? branchName,
  String? departmentName,
  String? designationName,
  String? taskImplementDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TaskManagementStruct(
      employeeId: employeeId,
      employeeName: employeeName,
      taskFrequency: taskFrequency,
      employeeTask: employeeTask,
      taskAssignedDate: taskAssignedDate,
      employeeNumber: employeeNumber,
      taskDoc: taskDoc,
      compnayDoc: compnayDoc,
      usersDoc: usersDoc,
      taskAssignedByName: taskAssignedByName,
      taskAssignedByNumber: taskAssignedByNumber,
      companyName: companyName,
      branchName: branchName,
      departmentName: departmentName,
      designationName: designationName,
      taskImplementDate: taskImplementDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TaskManagementStruct? updateTaskManagementStruct(
  TaskManagementStruct? taskManagement, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    taskManagement
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTaskManagementStructData(
  Map<String, dynamic> firestoreData,
  TaskManagementStruct? taskManagement,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (taskManagement == null) {
    return;
  }
  if (taskManagement.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && taskManagement.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final taskManagementData =
      getTaskManagementFirestoreData(taskManagement, forFieldValue);
  final nestedData =
      taskManagementData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = taskManagement.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTaskManagementFirestoreData(
  TaskManagementStruct? taskManagement, [
  bool forFieldValue = false,
]) {
  if (taskManagement == null) {
    return {};
  }
  final firestoreData = mapToFirestore(taskManagement.toMap());

  // Add any Firestore field values
  taskManagement.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTaskManagementListFirestoreData(
  List<TaskManagementStruct>? taskManagements,
) =>
    taskManagements
        ?.map((e) => getTaskManagementFirestoreData(e, true))
        .toList() ??
    [];
