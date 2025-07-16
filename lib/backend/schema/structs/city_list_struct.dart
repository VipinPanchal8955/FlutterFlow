// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CityListStruct extends FFFirebaseStruct {
  CityListStruct({
    int? id,
    String? name,
    String? latitude,
    String? longitude,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _latitude = latitude,
        _longitude = longitude,
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

  // "latitude" field.
  String? _latitude;
  String get latitude => _latitude ?? '';
  set latitude(String? val) => _latitude = val;

  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  String? _longitude;
  String get longitude => _longitude ?? '';
  set longitude(String? val) => _longitude = val;

  bool hasLongitude() => _longitude != null;

  static CityListStruct fromMap(Map<String, dynamic> data) => CityListStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        latitude: data['latitude'] as String?,
        longitude: data['longitude'] as String?,
      );

  static CityListStruct? maybeFromMap(dynamic data) =>
      data is Map ? CityListStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'latitude': _latitude,
        'longitude': _longitude,
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
        'latitude': serializeParam(
          _latitude,
          ParamType.String,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.String,
        ),
      }.withoutNulls;

  static CityListStruct fromSerializableMap(Map<String, dynamic> data) =>
      CityListStruct(
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
        latitude: deserializeParam(
          data['latitude'],
          ParamType.String,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CityListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CityListStruct &&
        id == other.id &&
        name == other.name &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, latitude, longitude]);
}

CityListStruct createCityListStruct({
  int? id,
  String? name,
  String? latitude,
  String? longitude,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CityListStruct(
      id: id,
      name: name,
      latitude: latitude,
      longitude: longitude,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CityListStruct? updateCityListStruct(
  CityListStruct? cityList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cityList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCityListStructData(
  Map<String, dynamic> firestoreData,
  CityListStruct? cityList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cityList == null) {
    return;
  }
  if (cityList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cityList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cityListData = getCityListFirestoreData(cityList, forFieldValue);
  final nestedData = cityListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cityList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCityListFirestoreData(
  CityListStruct? cityList, [
  bool forFieldValue = false,
]) {
  if (cityList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cityList.toMap());

  // Add any Firestore field values
  cityList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCityListListFirestoreData(
  List<CityListStruct>? cityLists,
) =>
    cityLists?.map((e) => getCityListFirestoreData(e, true)).toList() ?? [];
