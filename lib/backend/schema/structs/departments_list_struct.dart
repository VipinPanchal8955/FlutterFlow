// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DepartmentsListStruct extends FFFirebaseStruct {
  DepartmentsListStruct({
    String? departmentsName,
    String? departmentsCreatedTime,
    String? companyDoc,
    String? departmentsDoc,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _departmentsName = departmentsName,
        _departmentsCreatedTime = departmentsCreatedTime,
        _companyDoc = companyDoc,
        _departmentsDoc = departmentsDoc,
        super(firestoreUtilData);

  // "departments_name" field.
  String? _departmentsName;
  String get departmentsName => _departmentsName ?? '';
  set departmentsName(String? val) => _departmentsName = val;

  bool hasDepartmentsName() => _departmentsName != null;

  // "departments_created_time" field.
  String? _departmentsCreatedTime;
  String get departmentsCreatedTime => _departmentsCreatedTime ?? '';
  set departmentsCreatedTime(String? val) => _departmentsCreatedTime = val;

  bool hasDepartmentsCreatedTime() => _departmentsCreatedTime != null;

  // "company_doc" field.
  String? _companyDoc;
  String get companyDoc => _companyDoc ?? '';
  set companyDoc(String? val) => _companyDoc = val;

  bool hasCompanyDoc() => _companyDoc != null;

  // "departments_doc" field.
  String? _departmentsDoc;
  String get departmentsDoc => _departmentsDoc ?? '';
  set departmentsDoc(String? val) => _departmentsDoc = val;

  bool hasDepartmentsDoc() => _departmentsDoc != null;

  static DepartmentsListStruct fromMap(Map<String, dynamic> data) =>
      DepartmentsListStruct(
        departmentsName: data['departments_name'] as String?,
        departmentsCreatedTime: data['departments_created_time'] as String?,
        companyDoc: data['company_doc'] as String?,
        departmentsDoc: data['departments_doc'] as String?,
      );

  static DepartmentsListStruct? maybeFromMap(dynamic data) => data is Map
      ? DepartmentsListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'departments_name': _departmentsName,
        'departments_created_time': _departmentsCreatedTime,
        'company_doc': _companyDoc,
        'departments_doc': _departmentsDoc,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'departments_name': serializeParam(
          _departmentsName,
          ParamType.String,
        ),
        'departments_created_time': serializeParam(
          _departmentsCreatedTime,
          ParamType.String,
        ),
        'company_doc': serializeParam(
          _companyDoc,
          ParamType.String,
        ),
        'departments_doc': serializeParam(
          _departmentsDoc,
          ParamType.String,
        ),
      }.withoutNulls;

  static DepartmentsListStruct fromSerializableMap(Map<String, dynamic> data) =>
      DepartmentsListStruct(
        departmentsName: deserializeParam(
          data['departments_name'],
          ParamType.String,
          false,
        ),
        departmentsCreatedTime: deserializeParam(
          data['departments_created_time'],
          ParamType.String,
          false,
        ),
        companyDoc: deserializeParam(
          data['company_doc'],
          ParamType.String,
          false,
        ),
        departmentsDoc: deserializeParam(
          data['departments_doc'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DepartmentsListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DepartmentsListStruct &&
        departmentsName == other.departmentsName &&
        departmentsCreatedTime == other.departmentsCreatedTime &&
        companyDoc == other.companyDoc &&
        departmentsDoc == other.departmentsDoc;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [departmentsName, departmentsCreatedTime, companyDoc, departmentsDoc]);
}

DepartmentsListStruct createDepartmentsListStruct({
  String? departmentsName,
  String? departmentsCreatedTime,
  String? companyDoc,
  String? departmentsDoc,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DepartmentsListStruct(
      departmentsName: departmentsName,
      departmentsCreatedTime: departmentsCreatedTime,
      companyDoc: companyDoc,
      departmentsDoc: departmentsDoc,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DepartmentsListStruct? updateDepartmentsListStruct(
  DepartmentsListStruct? departmentsList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    departmentsList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDepartmentsListStructData(
  Map<String, dynamic> firestoreData,
  DepartmentsListStruct? departmentsList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (departmentsList == null) {
    return;
  }
  if (departmentsList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && departmentsList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final departmentsListData =
      getDepartmentsListFirestoreData(departmentsList, forFieldValue);
  final nestedData =
      departmentsListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = departmentsList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDepartmentsListFirestoreData(
  DepartmentsListStruct? departmentsList, [
  bool forFieldValue = false,
]) {
  if (departmentsList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(departmentsList.toMap());

  // Add any Firestore field values
  departmentsList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDepartmentsListListFirestoreData(
  List<DepartmentsListStruct>? departmentsLists,
) =>
    departmentsLists
        ?.map((e) => getDepartmentsListFirestoreData(e, true))
        .toList() ??
    [];
