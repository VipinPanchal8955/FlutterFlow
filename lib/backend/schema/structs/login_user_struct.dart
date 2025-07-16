// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LoginUserStruct extends FFFirebaseStruct {
  LoginUserStruct({
    String? businessName,
    String? displayName,
    String? phoneNumber,
    String? photoUrl,
    String? userRole,
    String? employeeStatus,
    String? loginNumber,
    bool? isLogin,
    bool? pCNavbarOpen,
    String? companiesStatus,
    DocumentReference? usersDoc,
    DocumentReference? companyDoc,
    String? gender,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _businessName = businessName,
        _displayName = displayName,
        _phoneNumber = phoneNumber,
        _photoUrl = photoUrl,
        _userRole = userRole,
        _employeeStatus = employeeStatus,
        _loginNumber = loginNumber,
        _isLogin = isLogin,
        _pCNavbarOpen = pCNavbarOpen,
        _companiesStatus = companiesStatus,
        _usersDoc = usersDoc,
        _companyDoc = companyDoc,
        _gender = gender,
        super(firestoreUtilData);

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  set businessName(String? val) => _businessName = val;

  bool hasBusinessName() => _businessName != null;

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

  // "User_role" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  set userRole(String? val) => _userRole = val;

  bool hasUserRole() => _userRole != null;

  // "employee_status" field.
  String? _employeeStatus;
  String get employeeStatus => _employeeStatus ?? '';
  set employeeStatus(String? val) => _employeeStatus = val;

  bool hasEmployeeStatus() => _employeeStatus != null;

  // "LoginNumber" field.
  String? _loginNumber;
  String get loginNumber => _loginNumber ?? '';
  set loginNumber(String? val) => _loginNumber = val;

  bool hasLoginNumber() => _loginNumber != null;

  // "IsLogin" field.
  bool? _isLogin;
  bool get isLogin => _isLogin ?? false;
  set isLogin(bool? val) => _isLogin = val;

  bool hasIsLogin() => _isLogin != null;

  // "PC_Navbar_Open" field.
  bool? _pCNavbarOpen;
  bool get pCNavbarOpen => _pCNavbarOpen ?? false;
  set pCNavbarOpen(bool? val) => _pCNavbarOpen = val;

  bool hasPCNavbarOpen() => _pCNavbarOpen != null;

  // "companies_status" field.
  String? _companiesStatus;
  String get companiesStatus => _companiesStatus ?? '';
  set companiesStatus(String? val) => _companiesStatus = val;

  bool hasCompaniesStatus() => _companiesStatus != null;

  // "users_doc" field.
  DocumentReference? _usersDoc;
  DocumentReference? get usersDoc => _usersDoc;
  set usersDoc(DocumentReference? val) => _usersDoc = val;

  bool hasUsersDoc() => _usersDoc != null;

  // "company_doc" field.
  DocumentReference? _companyDoc;
  DocumentReference? get companyDoc => _companyDoc;
  set companyDoc(DocumentReference? val) => _companyDoc = val;

  bool hasCompanyDoc() => _companyDoc != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  static LoginUserStruct fromMap(Map<String, dynamic> data) => LoginUserStruct(
        businessName: data['business_name'] as String?,
        displayName: data['display_name'] as String?,
        phoneNumber: data['phone_number'] as String?,
        photoUrl: data['photo_url'] as String?,
        userRole: data['User_role'] as String?,
        employeeStatus: data['employee_status'] as String?,
        loginNumber: data['LoginNumber'] as String?,
        isLogin: data['IsLogin'] as bool?,
        pCNavbarOpen: data['PC_Navbar_Open'] as bool?,
        companiesStatus: data['companies_status'] as String?,
        usersDoc: data['users_doc'] as DocumentReference?,
        companyDoc: data['company_doc'] as DocumentReference?,
        gender: data['gender'] as String?,
      );

  static LoginUserStruct? maybeFromMap(dynamic data) => data is Map
      ? LoginUserStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'business_name': _businessName,
        'display_name': _displayName,
        'phone_number': _phoneNumber,
        'photo_url': _photoUrl,
        'User_role': _userRole,
        'employee_status': _employeeStatus,
        'LoginNumber': _loginNumber,
        'IsLogin': _isLogin,
        'PC_Navbar_Open': _pCNavbarOpen,
        'companies_status': _companiesStatus,
        'users_doc': _usersDoc,
        'company_doc': _companyDoc,
        'gender': _gender,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'business_name': serializeParam(
          _businessName,
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
        'User_role': serializeParam(
          _userRole,
          ParamType.String,
        ),
        'employee_status': serializeParam(
          _employeeStatus,
          ParamType.String,
        ),
        'LoginNumber': serializeParam(
          _loginNumber,
          ParamType.String,
        ),
        'IsLogin': serializeParam(
          _isLogin,
          ParamType.bool,
        ),
        'PC_Navbar_Open': serializeParam(
          _pCNavbarOpen,
          ParamType.bool,
        ),
        'companies_status': serializeParam(
          _companiesStatus,
          ParamType.String,
        ),
        'users_doc': serializeParam(
          _usersDoc,
          ParamType.DocumentReference,
        ),
        'company_doc': serializeParam(
          _companyDoc,
          ParamType.DocumentReference,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
      }.withoutNulls;

  static LoginUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      LoginUserStruct(
        businessName: deserializeParam(
          data['business_name'],
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
        userRole: deserializeParam(
          data['User_role'],
          ParamType.String,
          false,
        ),
        employeeStatus: deserializeParam(
          data['employee_status'],
          ParamType.String,
          false,
        ),
        loginNumber: deserializeParam(
          data['LoginNumber'],
          ParamType.String,
          false,
        ),
        isLogin: deserializeParam(
          data['IsLogin'],
          ParamType.bool,
          false,
        ),
        pCNavbarOpen: deserializeParam(
          data['PC_Navbar_Open'],
          ParamType.bool,
          false,
        ),
        companiesStatus: deserializeParam(
          data['companies_status'],
          ParamType.String,
          false,
        ),
        usersDoc: deserializeParam(
          data['users_doc'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        companyDoc: deserializeParam(
          data['company_doc'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['companies'],
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LoginUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LoginUserStruct &&
        businessName == other.businessName &&
        displayName == other.displayName &&
        phoneNumber == other.phoneNumber &&
        photoUrl == other.photoUrl &&
        userRole == other.userRole &&
        employeeStatus == other.employeeStatus &&
        loginNumber == other.loginNumber &&
        isLogin == other.isLogin &&
        pCNavbarOpen == other.pCNavbarOpen &&
        companiesStatus == other.companiesStatus &&
        usersDoc == other.usersDoc &&
        companyDoc == other.companyDoc &&
        gender == other.gender;
  }

  @override
  int get hashCode => const ListEquality().hash([
        businessName,
        displayName,
        phoneNumber,
        photoUrl,
        userRole,
        employeeStatus,
        loginNumber,
        isLogin,
        pCNavbarOpen,
        companiesStatus,
        usersDoc,
        companyDoc,
        gender
      ]);
}

LoginUserStruct createLoginUserStruct({
  String? businessName,
  String? displayName,
  String? phoneNumber,
  String? photoUrl,
  String? userRole,
  String? employeeStatus,
  String? loginNumber,
  bool? isLogin,
  bool? pCNavbarOpen,
  String? companiesStatus,
  DocumentReference? usersDoc,
  DocumentReference? companyDoc,
  String? gender,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LoginUserStruct(
      businessName: businessName,
      displayName: displayName,
      phoneNumber: phoneNumber,
      photoUrl: photoUrl,
      userRole: userRole,
      employeeStatus: employeeStatus,
      loginNumber: loginNumber,
      isLogin: isLogin,
      pCNavbarOpen: pCNavbarOpen,
      companiesStatus: companiesStatus,
      usersDoc: usersDoc,
      companyDoc: companyDoc,
      gender: gender,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LoginUserStruct? updateLoginUserStruct(
  LoginUserStruct? loginUser, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    loginUser
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLoginUserStructData(
  Map<String, dynamic> firestoreData,
  LoginUserStruct? loginUser,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (loginUser == null) {
    return;
  }
  if (loginUser.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && loginUser.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final loginUserData = getLoginUserFirestoreData(loginUser, forFieldValue);
  final nestedData = loginUserData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = loginUser.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLoginUserFirestoreData(
  LoginUserStruct? loginUser, [
  bool forFieldValue = false,
]) {
  if (loginUser == null) {
    return {};
  }
  final firestoreData = mapToFirestore(loginUser.toMap());

  // Add any Firestore field values
  loginUser.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLoginUserListFirestoreData(
  List<LoginUserStruct>? loginUsers,
) =>
    loginUsers?.map((e) => getLoginUserFirestoreData(e, true)).toList() ?? [];
