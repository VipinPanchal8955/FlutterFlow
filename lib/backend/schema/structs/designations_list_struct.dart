// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DesignationsListStruct extends FFFirebaseStruct {
  DesignationsListStruct({
    String? designationsName,
    String? designationsCreatedTime,
    String? companyDoc,
    String? designationsDoc,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _designationsName = designationsName,
        _designationsCreatedTime = designationsCreatedTime,
        _companyDoc = companyDoc,
        _designationsDoc = designationsDoc,
        super(firestoreUtilData);

  // "designations_name" field.
  String? _designationsName;
  String get designationsName => _designationsName ?? '';
  set designationsName(String? val) => _designationsName = val;

  bool hasDesignationsName() => _designationsName != null;

  // "designations_created_time" field.
  String? _designationsCreatedTime;
  String get designationsCreatedTime => _designationsCreatedTime ?? '';
  set designationsCreatedTime(String? val) => _designationsCreatedTime = val;

  bool hasDesignationsCreatedTime() => _designationsCreatedTime != null;

  // "company_doc" field.
  String? _companyDoc;
  String get companyDoc => _companyDoc ?? '';
  set companyDoc(String? val) => _companyDoc = val;

  bool hasCompanyDoc() => _companyDoc != null;

  // "designations_doc" field.
  String? _designationsDoc;
  String get designationsDoc => _designationsDoc ?? '';
  set designationsDoc(String? val) => _designationsDoc = val;

  bool hasDesignationsDoc() => _designationsDoc != null;

  static DesignationsListStruct fromMap(Map<String, dynamic> data) =>
      DesignationsListStruct(
        designationsName: data['designations_name'] as String?,
        designationsCreatedTime: data['designations_created_time'] as String?,
        companyDoc: data['company_doc'] as String?,
        designationsDoc: data['designations_doc'] as String?,
      );

  static DesignationsListStruct? maybeFromMap(dynamic data) => data is Map
      ? DesignationsListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'designations_name': _designationsName,
        'designations_created_time': _designationsCreatedTime,
        'company_doc': _companyDoc,
        'designations_doc': _designationsDoc,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'designations_name': serializeParam(
          _designationsName,
          ParamType.String,
        ),
        'designations_created_time': serializeParam(
          _designationsCreatedTime,
          ParamType.String,
        ),
        'company_doc': serializeParam(
          _companyDoc,
          ParamType.String,
        ),
        'designations_doc': serializeParam(
          _designationsDoc,
          ParamType.String,
        ),
      }.withoutNulls;

  static DesignationsListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DesignationsListStruct(
        designationsName: deserializeParam(
          data['designations_name'],
          ParamType.String,
          false,
        ),
        designationsCreatedTime: deserializeParam(
          data['designations_created_time'],
          ParamType.String,
          false,
        ),
        companyDoc: deserializeParam(
          data['company_doc'],
          ParamType.String,
          false,
        ),
        designationsDoc: deserializeParam(
          data['designations_doc'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DesignationsListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DesignationsListStruct &&
        designationsName == other.designationsName &&
        designationsCreatedTime == other.designationsCreatedTime &&
        companyDoc == other.companyDoc &&
        designationsDoc == other.designationsDoc;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [designationsName, designationsCreatedTime, companyDoc, designationsDoc]);
}

DesignationsListStruct createDesignationsListStruct({
  String? designationsName,
  String? designationsCreatedTime,
  String? companyDoc,
  String? designationsDoc,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DesignationsListStruct(
      designationsName: designationsName,
      designationsCreatedTime: designationsCreatedTime,
      companyDoc: companyDoc,
      designationsDoc: designationsDoc,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DesignationsListStruct? updateDesignationsListStruct(
  DesignationsListStruct? designationsList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    designationsList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDesignationsListStructData(
  Map<String, dynamic> firestoreData,
  DesignationsListStruct? designationsList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (designationsList == null) {
    return;
  }
  if (designationsList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && designationsList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final designationsListData =
      getDesignationsListFirestoreData(designationsList, forFieldValue);
  final nestedData =
      designationsListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = designationsList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDesignationsListFirestoreData(
  DesignationsListStruct? designationsList, [
  bool forFieldValue = false,
]) {
  if (designationsList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(designationsList.toMap());

  // Add any Firestore field values
  designationsList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDesignationsListListFirestoreData(
  List<DesignationsListStruct>? designationsLists,
) =>
    designationsLists
        ?.map((e) => getDesignationsListFirestoreData(e, true))
        .toList() ??
    [];
