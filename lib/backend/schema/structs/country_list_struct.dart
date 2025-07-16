// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CountryListStruct extends FFFirebaseStruct {
  CountryListStruct({
    int? id,
    String? name,
    String? iso2,
    String? iso3,
    String? phonecode,
    String? capital,
    String? currency,
    String? native,
    String? emoji,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _iso2 = iso2,
        _iso3 = iso3,
        _phonecode = phonecode,
        _capital = capital,
        _currency = currency,
        _native = native,
        _emoji = emoji,
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

  // "iso3" field.
  String? _iso3;
  String get iso3 => _iso3 ?? '';
  set iso3(String? val) => _iso3 = val;

  bool hasIso3() => _iso3 != null;

  // "phonecode" field.
  String? _phonecode;
  String get phonecode => _phonecode ?? '';
  set phonecode(String? val) => _phonecode = val;

  bool hasPhonecode() => _phonecode != null;

  // "capital" field.
  String? _capital;
  String get capital => _capital ?? '';
  set capital(String? val) => _capital = val;

  bool hasCapital() => _capital != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  set currency(String? val) => _currency = val;

  bool hasCurrency() => _currency != null;

  // "native" field.
  String? _native;
  String get native => _native ?? '';
  set native(String? val) => _native = val;

  bool hasNative() => _native != null;

  // "emoji" field.
  String? _emoji;
  String get emoji => _emoji ?? '';
  set emoji(String? val) => _emoji = val;

  bool hasEmoji() => _emoji != null;

  static CountryListStruct fromMap(Map<String, dynamic> data) =>
      CountryListStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        iso2: data['iso2'] as String?,
        iso3: data['iso3'] as String?,
        phonecode: data['phonecode'] as String?,
        capital: data['capital'] as String?,
        currency: data['currency'] as String?,
        native: data['native'] as String?,
        emoji: data['emoji'] as String?,
      );

  static CountryListStruct? maybeFromMap(dynamic data) => data is Map
      ? CountryListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'iso2': _iso2,
        'iso3': _iso3,
        'phonecode': _phonecode,
        'capital': _capital,
        'currency': _currency,
        'native': _native,
        'emoji': _emoji,
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
        'iso3': serializeParam(
          _iso3,
          ParamType.String,
        ),
        'phonecode': serializeParam(
          _phonecode,
          ParamType.String,
        ),
        'capital': serializeParam(
          _capital,
          ParamType.String,
        ),
        'currency': serializeParam(
          _currency,
          ParamType.String,
        ),
        'native': serializeParam(
          _native,
          ParamType.String,
        ),
        'emoji': serializeParam(
          _emoji,
          ParamType.String,
        ),
      }.withoutNulls;

  static CountryListStruct fromSerializableMap(Map<String, dynamic> data) =>
      CountryListStruct(
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
        iso3: deserializeParam(
          data['iso3'],
          ParamType.String,
          false,
        ),
        phonecode: deserializeParam(
          data['phonecode'],
          ParamType.String,
          false,
        ),
        capital: deserializeParam(
          data['capital'],
          ParamType.String,
          false,
        ),
        currency: deserializeParam(
          data['currency'],
          ParamType.String,
          false,
        ),
        native: deserializeParam(
          data['native'],
          ParamType.String,
          false,
        ),
        emoji: deserializeParam(
          data['emoji'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CountryListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CountryListStruct &&
        id == other.id &&
        name == other.name &&
        iso2 == other.iso2 &&
        iso3 == other.iso3 &&
        phonecode == other.phonecode &&
        capital == other.capital &&
        currency == other.currency &&
        native == other.native &&
        emoji == other.emoji;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, name, iso2, iso3, phonecode, capital, currency, native, emoji]);
}

CountryListStruct createCountryListStruct({
  int? id,
  String? name,
  String? iso2,
  String? iso3,
  String? phonecode,
  String? capital,
  String? currency,
  String? native,
  String? emoji,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CountryListStruct(
      id: id,
      name: name,
      iso2: iso2,
      iso3: iso3,
      phonecode: phonecode,
      capital: capital,
      currency: currency,
      native: native,
      emoji: emoji,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CountryListStruct? updateCountryListStruct(
  CountryListStruct? countryList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    countryList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCountryListStructData(
  Map<String, dynamic> firestoreData,
  CountryListStruct? countryList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (countryList == null) {
    return;
  }
  if (countryList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && countryList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final countryListData =
      getCountryListFirestoreData(countryList, forFieldValue);
  final nestedData =
      countryListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = countryList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCountryListFirestoreData(
  CountryListStruct? countryList, [
  bool forFieldValue = false,
]) {
  if (countryList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(countryList.toMap());

  // Add any Firestore field values
  countryList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCountryListListFirestoreData(
  List<CountryListStruct>? countryLists,
) =>
    countryLists?.map((e) => getCountryListFirestoreData(e, true)).toList() ??
    [];
