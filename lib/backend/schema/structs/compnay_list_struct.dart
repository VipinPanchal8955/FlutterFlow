// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CompnayListStruct extends FFFirebaseStruct {
  CompnayListStruct({
    String? id,
    String? businessName,
    String? country,
    String? state,
    String? companiesStatus,
    String? gstNumber,
    String? city,
    String? address,
    String? companyDoc,
    String? editTime,
    String? companiesCreatedTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _businessName = businessName,
        _country = country,
        _state = state,
        _companiesStatus = companiesStatus,
        _gstNumber = gstNumber,
        _city = city,
        _address = address,
        _companyDoc = companyDoc,
        _editTime = editTime,
        _companiesCreatedTime = companiesCreatedTime,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  set businessName(String? val) => _businessName = val;

  bool hasBusinessName() => _businessName != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "companies_status" field.
  String? _companiesStatus;
  String get companiesStatus => _companiesStatus ?? '';
  set companiesStatus(String? val) => _companiesStatus = val;

  bool hasCompaniesStatus() => _companiesStatus != null;

  // "gst_number" field.
  String? _gstNumber;
  String get gstNumber => _gstNumber ?? '';
  set gstNumber(String? val) => _gstNumber = val;

  bool hasGstNumber() => _gstNumber != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "company_doc" field.
  String? _companyDoc;
  String get companyDoc => _companyDoc ?? '';
  set companyDoc(String? val) => _companyDoc = val;

  bool hasCompanyDoc() => _companyDoc != null;

  // "edit_time" field.
  String? _editTime;
  String get editTime => _editTime ?? '';
  set editTime(String? val) => _editTime = val;

  bool hasEditTime() => _editTime != null;

  // "companies_created_time" field.
  String? _companiesCreatedTime;
  String get companiesCreatedTime => _companiesCreatedTime ?? '';
  set companiesCreatedTime(String? val) => _companiesCreatedTime = val;

  bool hasCompaniesCreatedTime() => _companiesCreatedTime != null;

  static CompnayListStruct fromMap(Map<String, dynamic> data) =>
      CompnayListStruct(
        id: data['id'] as String?,
        businessName: data['business_name'] as String?,
        country: data['country'] as String?,
        state: data['state'] as String?,
        companiesStatus: data['companies_status'] as String?,
        gstNumber: data['gst_number'] as String?,
        city: data['city'] as String?,
        address: data['address'] as String?,
        companyDoc: data['company_doc'] as String?,
        editTime: data['edit_time'] as String?,
        companiesCreatedTime: data['companies_created_time'] as String?,
      );

  static CompnayListStruct? maybeFromMap(dynamic data) => data is Map
      ? CompnayListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'business_name': _businessName,
        'country': _country,
        'state': _state,
        'companies_status': _companiesStatus,
        'gst_number': _gstNumber,
        'city': _city,
        'address': _address,
        'company_doc': _companyDoc,
        'edit_time': _editTime,
        'companies_created_time': _companiesCreatedTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'business_name': serializeParam(
          _businessName,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'companies_status': serializeParam(
          _companiesStatus,
          ParamType.String,
        ),
        'gst_number': serializeParam(
          _gstNumber,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'company_doc': serializeParam(
          _companyDoc,
          ParamType.String,
        ),
        'edit_time': serializeParam(
          _editTime,
          ParamType.String,
        ),
        'companies_created_time': serializeParam(
          _companiesCreatedTime,
          ParamType.String,
        ),
      }.withoutNulls;

  static CompnayListStruct fromSerializableMap(Map<String, dynamic> data) =>
      CompnayListStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        businessName: deserializeParam(
          data['business_name'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        companiesStatus: deserializeParam(
          data['companies_status'],
          ParamType.String,
          false,
        ),
        gstNumber: deserializeParam(
          data['gst_number'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        companyDoc: deserializeParam(
          data['company_doc'],
          ParamType.String,
          false,
        ),
        editTime: deserializeParam(
          data['edit_time'],
          ParamType.String,
          false,
        ),
        companiesCreatedTime: deserializeParam(
          data['companies_created_time'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CompnayListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CompnayListStruct &&
        id == other.id &&
        businessName == other.businessName &&
        country == other.country &&
        state == other.state &&
        companiesStatus == other.companiesStatus &&
        gstNumber == other.gstNumber &&
        city == other.city &&
        address == other.address &&
        companyDoc == other.companyDoc &&
        editTime == other.editTime &&
        companiesCreatedTime == other.companiesCreatedTime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        businessName,
        country,
        state,
        companiesStatus,
        gstNumber,
        city,
        address,
        companyDoc,
        editTime,
        companiesCreatedTime
      ]);
}

CompnayListStruct createCompnayListStruct({
  String? id,
  String? businessName,
  String? country,
  String? state,
  String? companiesStatus,
  String? gstNumber,
  String? city,
  String? address,
  String? companyDoc,
  String? editTime,
  String? companiesCreatedTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CompnayListStruct(
      id: id,
      businessName: businessName,
      country: country,
      state: state,
      companiesStatus: companiesStatus,
      gstNumber: gstNumber,
      city: city,
      address: address,
      companyDoc: companyDoc,
      editTime: editTime,
      companiesCreatedTime: companiesCreatedTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CompnayListStruct? updateCompnayListStruct(
  CompnayListStruct? compnayList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    compnayList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCompnayListStructData(
  Map<String, dynamic> firestoreData,
  CompnayListStruct? compnayList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (compnayList == null) {
    return;
  }
  if (compnayList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && compnayList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final compnayListData =
      getCompnayListFirestoreData(compnayList, forFieldValue);
  final nestedData =
      compnayListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = compnayList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCompnayListFirestoreData(
  CompnayListStruct? compnayList, [
  bool forFieldValue = false,
]) {
  if (compnayList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(compnayList.toMap());

  // Add any Firestore field values
  compnayList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCompnayListListFirestoreData(
  List<CompnayListStruct>? compnayLists,
) =>
    compnayLists?.map((e) => getCompnayListFirestoreData(e, true)).toList() ??
    [];
