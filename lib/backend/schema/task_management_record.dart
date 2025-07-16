import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskManagementRecord extends FirestoreRecord {
  TaskManagementRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "employee_id" field.
  String? _employeeId;
  String get employeeId => _employeeId ?? '';
  bool hasEmployeeId() => _employeeId != null;

  // "employee_name" field.
  String? _employeeName;
  String get employeeName => _employeeName ?? '';
  bool hasEmployeeName() => _employeeName != null;

  // "task_frequency" field.
  String? _taskFrequency;
  String get taskFrequency => _taskFrequency ?? '';
  bool hasTaskFrequency() => _taskFrequency != null;

  // "employee_task" field.
  String? _employeeTask;
  String get employeeTask => _employeeTask ?? '';
  bool hasEmployeeTask() => _employeeTask != null;

  // "task_assigned_date" field.
  DateTime? _taskAssignedDate;
  DateTime? get taskAssignedDate => _taskAssignedDate;
  bool hasTaskAssignedDate() => _taskAssignedDate != null;

  // "employee_number" field.
  String? _employeeNumber;
  String get employeeNumber => _employeeNumber ?? '';
  bool hasEmployeeNumber() => _employeeNumber != null;

  // "task_doc" field.
  DocumentReference? _taskDoc;
  DocumentReference? get taskDoc => _taskDoc;
  bool hasTaskDoc() => _taskDoc != null;

  // "compnay_doc" field.
  DocumentReference? _compnayDoc;
  DocumentReference? get compnayDoc => _compnayDoc;
  bool hasCompnayDoc() => _compnayDoc != null;

  // "users_doc" field.
  DocumentReference? _usersDoc;
  DocumentReference? get usersDoc => _usersDoc;
  bool hasUsersDoc() => _usersDoc != null;

  // "task_assigned_by_name" field.
  String? _taskAssignedByName;
  String get taskAssignedByName => _taskAssignedByName ?? '';
  bool hasTaskAssignedByName() => _taskAssignedByName != null;

  // "task_assigned_by_number" field.
  String? _taskAssignedByNumber;
  String get taskAssignedByNumber => _taskAssignedByNumber ?? '';
  bool hasTaskAssignedByNumber() => _taskAssignedByNumber != null;

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "branch_name" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  bool hasBranchName() => _branchName != null;

  // "department_name" field.
  String? _departmentName;
  String get departmentName => _departmentName ?? '';
  bool hasDepartmentName() => _departmentName != null;

  // "designation_name" field.
  String? _designationName;
  String get designationName => _designationName ?? '';
  bool hasDesignationName() => _designationName != null;

  void _initializeFields() {
    _employeeId = snapshotData['employee_id'] as String?;
    _employeeName = snapshotData['employee_name'] as String?;
    _taskFrequency = snapshotData['task_frequency'] as String?;
    _employeeTask = snapshotData['employee_task'] as String?;
    _taskAssignedDate = snapshotData['task_assigned_date'] as DateTime?;
    _employeeNumber = snapshotData['employee_number'] as String?;
    _taskDoc = snapshotData['task_doc'] as DocumentReference?;
    _compnayDoc = snapshotData['compnay_doc'] as DocumentReference?;
    _usersDoc = snapshotData['users_doc'] as DocumentReference?;
    _taskAssignedByName = snapshotData['task_assigned_by_name'] as String?;
    _taskAssignedByNumber = snapshotData['task_assigned_by_number'] as String?;
    _companyName = snapshotData['company_name'] as String?;
    _branchName = snapshotData['branch_name'] as String?;
    _departmentName = snapshotData['department_name'] as String?;
    _designationName = snapshotData['designation_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('task_management');

  static Stream<TaskManagementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TaskManagementRecord.fromSnapshot(s));

  static Future<TaskManagementRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TaskManagementRecord.fromSnapshot(s));

  static TaskManagementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TaskManagementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TaskManagementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TaskManagementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TaskManagementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TaskManagementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTaskManagementRecordData({
  String? employeeId,
  String? employeeName,
  String? taskFrequency,
  String? employeeTask,
  DateTime? taskAssignedDate,
  String? employeeNumber,
  DocumentReference? taskDoc,
  DocumentReference? compnayDoc,
  DocumentReference? usersDoc,
  String? taskAssignedByName,
  String? taskAssignedByNumber,
  String? companyName,
  String? branchName,
  String? departmentName,
  String? designationName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'employee_id': employeeId,
      'employee_name': employeeName,
      'task_frequency': taskFrequency,
      'employee_task': employeeTask,
      'task_assigned_date': taskAssignedDate,
      'employee_number': employeeNumber,
      'task_doc': taskDoc,
      'compnay_doc': compnayDoc,
      'users_doc': usersDoc,
      'task_assigned_by_name': taskAssignedByName,
      'task_assigned_by_number': taskAssignedByNumber,
      'company_name': companyName,
      'branch_name': branchName,
      'department_name': departmentName,
      'designation_name': designationName,
    }.withoutNulls,
  );

  return firestoreData;
}

class TaskManagementRecordDocumentEquality
    implements Equality<TaskManagementRecord> {
  const TaskManagementRecordDocumentEquality();

  @override
  bool equals(TaskManagementRecord? e1, TaskManagementRecord? e2) {
    return e1?.employeeId == e2?.employeeId &&
        e1?.employeeName == e2?.employeeName &&
        e1?.taskFrequency == e2?.taskFrequency &&
        e1?.employeeTask == e2?.employeeTask &&
        e1?.taskAssignedDate == e2?.taskAssignedDate &&
        e1?.employeeNumber == e2?.employeeNumber &&
        e1?.taskDoc == e2?.taskDoc &&
        e1?.compnayDoc == e2?.compnayDoc &&
        e1?.usersDoc == e2?.usersDoc &&
        e1?.taskAssignedByName == e2?.taskAssignedByName &&
        e1?.taskAssignedByNumber == e2?.taskAssignedByNumber &&
        e1?.companyName == e2?.companyName &&
        e1?.branchName == e2?.branchName &&
        e1?.departmentName == e2?.departmentName &&
        e1?.designationName == e2?.designationName;
  }

  @override
  int hash(TaskManagementRecord? e) => const ListEquality().hash([
        e?.employeeId,
        e?.employeeName,
        e?.taskFrequency,
        e?.employeeTask,
        e?.taskAssignedDate,
        e?.employeeNumber,
        e?.taskDoc,
        e?.compnayDoc,
        e?.usersDoc,
        e?.taskAssignedByName,
        e?.taskAssignedByNumber,
        e?.companyName,
        e?.branchName,
        e?.departmentName,
        e?.designationName
      ]);

  @override
  bool isValidKey(Object? o) => o is TaskManagementRecord;
}
