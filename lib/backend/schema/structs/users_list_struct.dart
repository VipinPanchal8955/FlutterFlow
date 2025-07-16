// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UsersListStruct extends FFFirebaseStruct {
  UsersListStruct({
    String? employeeid,
    String? displayName,
    String? phoneNumber,
    String? photoUrl,
    String? gender,
    String? usersCreatedTime,
    String? usersCreatedByName,
    String? usersCreatedByNumber,
    String? usersLastActiveTime,
    String? userRole,
    String? userBranchName,
    String? userDepartmentName,
    String? userDesignationName,
    String? userStatus,
    String? companyDoc,
    String? usersDoc,
    String? usersEditTime,
    String? userInactiveDate,
    String? usersEditByName,
    String? usersEditByNumber,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _employeeid = employeeid,
        _displayName = displayName,
        _phoneNumber = phoneNumber,
        _photoUrl = photoUrl,
        _gender = gender,
        _usersCreatedTime = usersCreatedTime,
        _usersCreatedByName = usersCreatedByName,
        _usersCreatedByNumber = usersCreatedByNumber,
        _usersLastActiveTime = usersLastActiveTime,
        _userRole = userRole,
        _userBranchName = userBranchName,
        _userDepartmentName = userDepartmentName,
        _userDesignationName = userDesignationName,
        _userStatus = userStatus,
        _companyDoc = companyDoc,
        _usersDoc = usersDoc,
        _usersEditTime = usersEditTime,
        _userInactiveDate = userInactiveDate,
        _usersEditByName = usersEditByName,
        _usersEditByNumber = usersEditByNumber,
        _id = id,
        super(firestoreUtilData);

  // "employeeid" field.
  String? _employeeid;
  String get employeeid => _employeeid ?? '';
  set employeeid(String? val) => _employeeid = val;

  bool hasEmployeeid() => _employeeid != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;

  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;

  bool hasPhotoUrl() => _photoUrl != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "users_created_time" field.
  String? _usersCreatedTime;
  String get usersCreatedTime => _usersCreatedTime ?? '';
  set usersCreatedTime(String? val) => _usersCreatedTime = val;

  bool hasUsersCreatedTime() => _usersCreatedTime != null;

  // "users_created_by_name" field.
  String? _usersCreatedByName;
  String get usersCreatedByName => _usersCreatedByName ?? '';
  set usersCreatedByName(String? val) => _usersCreatedByName = val;

  bool hasUsersCreatedByName() => _usersCreatedByName != null;

  // "users_created_by_number" field.
  String? _usersCreatedByNumber;
  String get usersCreatedByNumber => _usersCreatedByNumber ?? '';
  set usersCreatedByNumber(String? val) => _usersCreatedByNumber = val;

  bool hasUsersCreatedByNumber() => _usersCreatedByNumber != null;

  // "users_last_active_time" field.
  String? _usersLastActiveTime;
  String get usersLastActiveTime => _usersLastActiveTime ?? '';
  set usersLastActiveTime(String? val) => _usersLastActiveTime = val;

  bool hasUsersLastActiveTime() => _usersLastActiveTime != null;

  // "user_role" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  set userRole(String? val) => _userRole = val;

  bool hasUserRole() => _userRole != null;

  // "user_branch_name" field.
  String? _userBranchName;
  String get userBranchName => _userBranchName ?? '';
  set userBranchName(String? val) => _userBranchName = val;

  bool hasUserBranchName() => _userBranchName != null;

  // "user_department_name" field.
  String? _userDepartmentName;
  String get userDepartmentName => _userDepartmentName ?? '';
  set userDepartmentName(String? val) => _userDepartmentName = val;

  bool hasUserDepartmentName() => _userDepartmentName != null;

  // "user_designation_name" field.
  String? _userDesignationName;
  String get userDesignationName => _userDesignationName ?? '';
  set userDesignationName(String? val) => _userDesignationName = val;

  bool hasUserDesignationName() => _userDesignationName != null;

  // "user_status" field.
  String? _userStatus;
  String get userStatus => _userStatus ?? '';
  set userStatus(String? val) => _userStatus = val;

  bool hasUserStatus() => _userStatus != null;

  // "company_doc" field.
  String? _companyDoc;
  String get companyDoc => _companyDoc ?? '';
  set companyDoc(String? val) => _companyDoc = val;

  bool hasCompanyDoc() => _companyDoc != null;

  // "users_doc" field.
  String? _usersDoc;
  String get usersDoc => _usersDoc ?? '';
  set usersDoc(String? val) => _usersDoc = val;

  bool hasUsersDoc() => _usersDoc != null;

  // "users_edit_time" field.
  String? _usersEditTime;
  String get usersEditTime => _usersEditTime ?? '';
  set usersEditTime(String? val) => _usersEditTime = val;

  bool hasUsersEditTime() => _usersEditTime != null;

  // "user_inactive_date" field.
  String? _userInactiveDate;
  String get userInactiveDate => _userInactiveDate ?? '';
  set userInactiveDate(String? val) => _userInactiveDate = val;

  bool hasUserInactiveDate() => _userInactiveDate != null;

  // "users_edit_by_name" field.
  String? _usersEditByName;
  String get usersEditByName => _usersEditByName ?? '';
  set usersEditByName(String? val) => _usersEditByName = val;

  bool hasUsersEditByName() => _usersEditByName != null;

  // "users_edit_by_number" field.
  String? _usersEditByNumber;
  String get usersEditByNumber => _usersEditByNumber ?? '';
  set usersEditByNumber(String? val) => _usersEditByNumber = val;

  bool hasUsersEditByNumber() => _usersEditByNumber != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static UsersListStruct fromMap(Map<String, dynamic> data) => UsersListStruct(
        employeeid: data['employeeid'] as String?,
        displayName: data['display_name'] as String?,
        phoneNumber: data['phone_number'] as String?,
        photoUrl: data['photo_url'] as String?,
        gender: data['gender'] as String?,
        usersCreatedTime: data['users_created_time'] as String?,
        usersCreatedByName: data['users_created_by_name'] as String?,
        usersCreatedByNumber: data['users_created_by_number'] as String?,
        usersLastActiveTime: data['users_last_active_time'] as String?,
        userRole: data['user_role'] as String?,
        userBranchName: data['user_branch_name'] as String?,
        userDepartmentName: data['user_department_name'] as String?,
        userDesignationName: data['user_designation_name'] as String?,
        userStatus: data['user_status'] as String?,
        companyDoc: data['company_doc'] as String?,
        usersDoc: data['users_doc'] as String?,
        usersEditTime: data['users_edit_time'] as String?,
        userInactiveDate: data['user_inactive_date'] as String?,
        usersEditByName: data['users_edit_by_name'] as String?,
        usersEditByNumber: data['users_edit_by_number'] as String?,
        id: data['id'] as String?,
      );

  static UsersListStruct? maybeFromMap(dynamic data) => data is Map
      ? UsersListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'employeeid': _employeeid,
        'display_name': _displayName,
        'phone_number': _phoneNumber,
        'photo_url': _photoUrl,
        'gender': _gender,
        'users_created_time': _usersCreatedTime,
        'users_created_by_name': _usersCreatedByName,
        'users_created_by_number': _usersCreatedByNumber,
        'users_last_active_time': _usersLastActiveTime,
        'user_role': _userRole,
        'user_branch_name': _userBranchName,
        'user_department_name': _userDepartmentName,
        'user_designation_name': _userDesignationName,
        'user_status': _userStatus,
        'company_doc': _companyDoc,
        'users_doc': _usersDoc,
        'users_edit_time': _usersEditTime,
        'user_inactive_date': _userInactiveDate,
        'users_edit_by_name': _usersEditByName,
        'users_edit_by_number': _usersEditByNumber,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'employeeid': serializeParam(
          _employeeid,
          ParamType.String,
        ),
        'display_name': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'photo_url': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'users_created_time': serializeParam(
          _usersCreatedTime,
          ParamType.String,
        ),
        'users_created_by_name': serializeParam(
          _usersCreatedByName,
          ParamType.String,
        ),
        'users_created_by_number': serializeParam(
          _usersCreatedByNumber,
          ParamType.String,
        ),
        'users_last_active_time': serializeParam(
          _usersLastActiveTime,
          ParamType.String,
        ),
        'user_role': serializeParam(
          _userRole,
          ParamType.String,
        ),
        'user_branch_name': serializeParam(
          _userBranchName,
          ParamType.String,
        ),
        'user_department_name': serializeParam(
          _userDepartmentName,
          ParamType.String,
        ),
        'user_designation_name': serializeParam(
          _userDesignationName,
          ParamType.String,
        ),
        'user_status': serializeParam(
          _userStatus,
          ParamType.String,
        ),
        'company_doc': serializeParam(
          _companyDoc,
          ParamType.String,
        ),
        'users_doc': serializeParam(
          _usersDoc,
          ParamType.String,
        ),
        'users_edit_time': serializeParam(
          _usersEditTime,
          ParamType.String,
        ),
        'user_inactive_date': serializeParam(
          _userInactiveDate,
          ParamType.String,
        ),
        'users_edit_by_name': serializeParam(
          _usersEditByName,
          ParamType.String,
        ),
        'users_edit_by_number': serializeParam(
          _usersEditByNumber,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static UsersListStruct fromSerializableMap(Map<String, dynamic> data) =>
      UsersListStruct(
        employeeid: deserializeParam(
          data['employeeid'],
          ParamType.String,
          false,
        ),
        displayName: deserializeParam(
          data['display_name'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        photoUrl: deserializeParam(
          data['photo_url'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        usersCreatedTime: deserializeParam(
          data['users_created_time'],
          ParamType.String,
          false,
        ),
        usersCreatedByName: deserializeParam(
          data['users_created_by_name'],
          ParamType.String,
          false,
        ),
        usersCreatedByNumber: deserializeParam(
          data['users_created_by_number'],
          ParamType.String,
          false,
        ),
        usersLastActiveTime: deserializeParam(
          data['users_last_active_time'],
          ParamType.String,
          false,
        ),
        userRole: deserializeParam(
          data['user_role'],
          ParamType.String,
          false,
        ),
        userBranchName: deserializeParam(
          data['user_branch_name'],
          ParamType.String,
          false,
        ),
        userDepartmentName: deserializeParam(
          data['user_department_name'],
          ParamType.String,
          false,
        ),
        userDesignationName: deserializeParam(
          data['user_designation_name'],
          ParamType.String,
          false,
        ),
        userStatus: deserializeParam(
          data['user_status'],
          ParamType.String,
          false,
        ),
        companyDoc: deserializeParam(
          data['company_doc'],
          ParamType.String,
          false,
        ),
        usersDoc: deserializeParam(
          data['users_doc'],
          ParamType.String,
          false,
        ),
        usersEditTime: deserializeParam(
          data['users_edit_time'],
          ParamType.String,
          false,
        ),
        userInactiveDate: deserializeParam(
          data['user_inactive_date'],
          ParamType.String,
          false,
        ),
        usersEditByName: deserializeParam(
          data['users_edit_by_name'],
          ParamType.String,
          false,
        ),
        usersEditByNumber: deserializeParam(
          data['users_edit_by_number'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UsersListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UsersListStruct &&
        employeeid == other.employeeid &&
        displayName == other.displayName &&
        phoneNumber == other.phoneNumber &&
        photoUrl == other.photoUrl &&
        gender == other.gender &&
        usersCreatedTime == other.usersCreatedTime &&
        usersCreatedByName == other.usersCreatedByName &&
        usersCreatedByNumber == other.usersCreatedByNumber &&
        usersLastActiveTime == other.usersLastActiveTime &&
        userRole == other.userRole &&
        userBranchName == other.userBranchName &&
        userDepartmentName == other.userDepartmentName &&
        userDesignationName == other.userDesignationName &&
        userStatus == other.userStatus &&
        companyDoc == other.companyDoc &&
        usersDoc == other.usersDoc &&
        usersEditTime == other.usersEditTime &&
        userInactiveDate == other.userInactiveDate &&
        usersEditByName == other.usersEditByName &&
        usersEditByNumber == other.usersEditByNumber &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([
        employeeid,
        displayName,
        phoneNumber,
        photoUrl,
        gender,
        usersCreatedTime,
        usersCreatedByName,
        usersCreatedByNumber,
        usersLastActiveTime,
        userRole,
        userBranchName,
        userDepartmentName,
        userDesignationName,
        userStatus,
        companyDoc,
        usersDoc,
        usersEditTime,
        userInactiveDate,
        usersEditByName,
        usersEditByNumber,
        id
      ]);
}

UsersListStruct createUsersListStruct({
  String? employeeid,
  String? displayName,
  String? phoneNumber,
  String? photoUrl,
  String? gender,
  String? usersCreatedTime,
  String? usersCreatedByName,
  String? usersCreatedByNumber,
  String? usersLastActiveTime,
  String? userRole,
  String? userBranchName,
  String? userDepartmentName,
  String? userDesignationName,
  String? userStatus,
  String? companyDoc,
  String? usersDoc,
  String? usersEditTime,
  String? userInactiveDate,
  String? usersEditByName,
  String? usersEditByNumber,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UsersListStruct(
      employeeid: employeeid,
      displayName: displayName,
      phoneNumber: phoneNumber,
      photoUrl: photoUrl,
      gender: gender,
      usersCreatedTime: usersCreatedTime,
      usersCreatedByName: usersCreatedByName,
      usersCreatedByNumber: usersCreatedByNumber,
      usersLastActiveTime: usersLastActiveTime,
      userRole: userRole,
      userBranchName: userBranchName,
      userDepartmentName: userDepartmentName,
      userDesignationName: userDesignationName,
      userStatus: userStatus,
      companyDoc: companyDoc,
      usersDoc: usersDoc,
      usersEditTime: usersEditTime,
      userInactiveDate: userInactiveDate,
      usersEditByName: usersEditByName,
      usersEditByNumber: usersEditByNumber,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UsersListStruct? updateUsersListStruct(
  UsersListStruct? usersList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    usersList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUsersListStructData(
  Map<String, dynamic> firestoreData,
  UsersListStruct? usersList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (usersList == null) {
    return;
  }
  if (usersList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && usersList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final usersListData = getUsersListFirestoreData(usersList, forFieldValue);
  final nestedData = usersListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = usersList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUsersListFirestoreData(
  UsersListStruct? usersList, [
  bool forFieldValue = false,
]) {
  if (usersList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(usersList.toMap());

  // Add any Firestore field values
  usersList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUsersListListFirestoreData(
  List<UsersListStruct>? usersLists,
) =>
    usersLists?.map((e) => getUsersListFirestoreData(e, true)).toList() ?? [];
