// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BranchesListStruct extends FFFirebaseStruct {
  BranchesListStruct({
    String? branchName,
    String? branchCreatedTime,
    String? companyDoc,
    String? branchDoc,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _branchName = branchName,
        _branchCreatedTime = branchCreatedTime,
        _companyDoc = companyDoc,
        _branchDoc = branchDoc,
        super(firestoreUtilData);

  // "branch_name" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  set branchName(String? val) => _branchName = val;

  bool hasBranchName() => _branchName != null;

  // "branch_created_time" field.
  String? _branchCreatedTime;
  String get branchCreatedTime => _branchCreatedTime ?? '';
  set branchCreatedTime(String? val) => _branchCreatedTime = val;

  bool hasBranchCreatedTime() => _branchCreatedTime != null;

  // "company_doc" field.
  String? _companyDoc;
  String get companyDoc => _companyDoc ?? '';
  set companyDoc(String? val) => _companyDoc = val;

  bool hasCompanyDoc() => _companyDoc != null;

  // "branch_doc" field.
  String? _branchDoc;
  String get branchDoc => _branchDoc ?? '';
  set branchDoc(String? val) => _branchDoc = val;

  bool hasBranchDoc() => _branchDoc != null;

  static BranchesListStruct fromMap(Map<String, dynamic> data) =>
      BranchesListStruct(
        branchName: data['branch_name'] as String?,
        branchCreatedTime: data['branch_created_time'] as String?,
        companyDoc: data['company_doc'] as String?,
        branchDoc: data['branch_doc'] as String?,
      );

  static BranchesListStruct? maybeFromMap(dynamic data) => data is Map
      ? BranchesListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'branch_name': _branchName,
        'branch_created_time': _branchCreatedTime,
        'company_doc': _companyDoc,
        'branch_doc': _branchDoc,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'branch_name': serializeParam(
          _branchName,
          ParamType.String,
        ),
        'branch_created_time': serializeParam(
          _branchCreatedTime,
          ParamType.String,
        ),
        'company_doc': serializeParam(
          _companyDoc,
          ParamType.String,
        ),
        'branch_doc': serializeParam(
          _branchDoc,
          ParamType.String,
        ),
      }.withoutNulls;

  static BranchesListStruct fromSerializableMap(Map<String, dynamic> data) =>
      BranchesListStruct(
        branchName: deserializeParam(
          data['branch_name'],
          ParamType.String,
          false,
        ),
        branchCreatedTime: deserializeParam(
          data['branch_created_time'],
          ParamType.String,
          false,
        ),
        companyDoc: deserializeParam(
          data['company_doc'],
          ParamType.String,
          false,
        ),
        branchDoc: deserializeParam(
          data['branch_doc'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BranchesListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BranchesListStruct &&
        branchName == other.branchName &&
        branchCreatedTime == other.branchCreatedTime &&
        companyDoc == other.companyDoc &&
        branchDoc == other.branchDoc;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([branchName, branchCreatedTime, companyDoc, branchDoc]);
}

BranchesListStruct createBranchesListStruct({
  String? branchName,
  String? branchCreatedTime,
  String? companyDoc,
  String? branchDoc,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BranchesListStruct(
      branchName: branchName,
      branchCreatedTime: branchCreatedTime,
      companyDoc: companyDoc,
      branchDoc: branchDoc,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BranchesListStruct? updateBranchesListStruct(
  BranchesListStruct? branchesList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    branchesList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBranchesListStructData(
  Map<String, dynamic> firestoreData,
  BranchesListStruct? branchesList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (branchesList == null) {
    return;
  }
  if (branchesList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && branchesList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final branchesListData =
      getBranchesListFirestoreData(branchesList, forFieldValue);
  final nestedData =
      branchesListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = branchesList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBranchesListFirestoreData(
  BranchesListStruct? branchesList, [
  bool forFieldValue = false,
]) {
  if (branchesList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(branchesList.toMap());

  // Add any Firestore field values
  branchesList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBranchesListListFirestoreData(
  List<BranchesListStruct>? branchesLists,
) =>
    branchesLists?.map((e) => getBranchesListFirestoreData(e, true)).toList() ??
    [];
