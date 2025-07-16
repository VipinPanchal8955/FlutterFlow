// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class StateListStruct extends FFFirebaseStruct {
  StateListStruct({
    int? id,
    String? name,
    String? iso2,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _iso2 = iso2,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "iso2" field.
  String? _iso2;
  String get iso2 => _iso2 ?? '';
  set iso2(String? val) => _iso2 = val;

  bool hasIso2() => _iso2 != null;

  static StateListStruct fromMap(Map<String, dynamic> data) => StateListStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        iso2: data['iso2'] as String?,
      );

  static StateListStruct? maybeFromMap(dynamic data) => data is Map
      ? StateListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'iso2': _iso2,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'iso2': serializeParam(
          _iso2,
          ParamType.String,
        ),
      }.withoutNulls;

  static StateListStruct fromSerializableMap(Map<String, dynamic> data) =>
      StateListStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        iso2: deserializeParam(
          data['iso2'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StateListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StateListStruct &&
        id == other.id &&
        name == other.name &&
        iso2 == other.iso2;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, iso2]);
}

StateListStruct createStateListStruct({
  int? id,
  String? name,
  String? iso2,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StateListStruct(
      id: id,
      name: name,
      iso2: iso2,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StateListStruct? updateStateListStruct(
  StateListStruct? stateList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stateList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStateListStructData(
  Map<String, dynamic> firestoreData,
  StateListStruct? stateList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stateList == null) {
    return;
  }
  if (stateList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stateList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stateListData = getStateListFirestoreData(stateList, forFieldValue);
  final nestedData = stateListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stateList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStateListFirestoreData(
  StateListStruct? stateList, [
  bool forFieldValue = false,
]) {
  if (stateList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stateList.toMap());

  // Add any Firestore field values
  stateList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStateListListFirestoreData(
  List<StateListStruct>? stateLists,
) =>
    stateLists?.map((e) => getStateListFirestoreData(e, true)).toList() ?? [];
