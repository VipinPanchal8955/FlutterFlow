import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "employeeid" field.
  String? _employeeid;
  String get employeeid => _employeeid ?? '';
  bool hasEmployeeid() => _employeeid != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "users_created_time" field.
  DateTime? _usersCreatedTime;
  DateTime? get usersCreatedTime => _usersCreatedTime;
  bool hasUsersCreatedTime() => _usersCreatedTime != null;

  // "users_created_by_name" field.
  String? _usersCreatedByName;
  String get usersCreatedByName => _usersCreatedByName ?? '';
  bool hasUsersCreatedByName() => _usersCreatedByName != null;

  // "users_created_by_number" field.
  String? _usersCreatedByNumber;
  String get usersCreatedByNumber => _usersCreatedByNumber ?? '';
  bool hasUsersCreatedByNumber() => _usersCreatedByNumber != null;

  // "users_last_active_time" field.
  DateTime? _usersLastActiveTime;
  DateTime? get usersLastActiveTime => _usersLastActiveTime;
  bool hasUsersLastActiveTime() => _usersLastActiveTime != null;

  // "user_role" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  bool hasUserRole() => _userRole != null;

  // "user_branch_name" field.
  String? _userBranchName;
  String get userBranchName => _userBranchName ?? '';
  bool hasUserBranchName() => _userBranchName != null;

  // "user_department_name" field.
  String? _userDepartmentName;
  String get userDepartmentName => _userDepartmentName ?? '';
  bool hasUserDepartmentName() => _userDepartmentName != null;

  // "user_designation_name" field.
  String? _userDesignationName;
  String get userDesignationName => _userDesignationName ?? '';
  bool hasUserDesignationName() => _userDesignationName != null;

  // "user_status" field.
  String? _userStatus;
  String get userStatus => _userStatus ?? '';
  bool hasUserStatus() => _userStatus != null;

  // "company_doc" field.
  DocumentReference? _companyDoc;
  DocumentReference? get companyDoc => _companyDoc;
  bool hasCompanyDoc() => _companyDoc != null;

  // "users_doc" field.
  DocumentReference? _usersDoc;
  DocumentReference? get usersDoc => _usersDoc;
  bool hasUsersDoc() => _usersDoc != null;

  // "users_edit_time" field.
  DateTime? _usersEditTime;
  DateTime? get usersEditTime => _usersEditTime;
  bool hasUsersEditTime() => _usersEditTime != null;

  // "user_inactive_date" field.
  DateTime? _userInactiveDate;
  DateTime? get userInactiveDate => _userInactiveDate;
  bool hasUserInactiveDate() => _userInactiveDate != null;

  // "users_edit_by_name" field.
  String? _usersEditByName;
  String get usersEditByName => _usersEditByName ?? '';
  bool hasUsersEditByName() => _usersEditByName != null;

  // "users_edit_by_number" field.
  String? _usersEditByNumber;
  String get usersEditByNumber => _usersEditByNumber ?? '';
  bool hasUsersEditByNumber() => _usersEditByNumber != null;

  void _initializeFields() {
    _employeeid = snapshotData['employeeid'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _gender = snapshotData['gender'] as String?;
    _usersCreatedTime = snapshotData['users_created_time'] as DateTime?;
    _usersCreatedByName = snapshotData['users_created_by_name'] as String?;
    _usersCreatedByNumber = snapshotData['users_created_by_number'] as String?;
    _usersLastActiveTime = snapshotData['users_last_active_time'] as DateTime?;
    _userRole = snapshotData['user_role'] as String?;
    _userBranchName = snapshotData['user_branch_name'] as String?;
    _userDepartmentName = snapshotData['user_department_name'] as String?;
    _userDesignationName = snapshotData['user_designation_name'] as String?;
    _userStatus = snapshotData['user_status'] as String?;
    _companyDoc = snapshotData['company_doc'] as DocumentReference?;
    _usersDoc = snapshotData['users_doc'] as DocumentReference?;
    _usersEditTime = snapshotData['users_edit_time'] as DateTime?;
    _userInactiveDate = snapshotData['user_inactive_date'] as DateTime?;
    _usersEditByName = snapshotData['users_edit_by_name'] as String?;
    _usersEditByNumber = snapshotData['users_edit_by_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? employeeid,
  String? displayName,
  String? phoneNumber,
  String? photoUrl,
  String? gender,
  DateTime? usersCreatedTime,
  String? usersCreatedByName,
  String? usersCreatedByNumber,
  DateTime? usersLastActiveTime,
  String? userRole,
  String? userBranchName,
  String? userDepartmentName,
  String? userDesignationName,
  String? userStatus,
  DocumentReference? companyDoc,
  DocumentReference? usersDoc,
  DateTime? usersEditTime,
  DateTime? userInactiveDate,
  String? usersEditByName,
  String? usersEditByNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'employeeid': employeeid,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
      'gender': gender,
      'users_created_time': usersCreatedTime,
      'users_created_by_name': usersCreatedByName,
      'users_created_by_number': usersCreatedByNumber,
      'users_last_active_time': usersLastActiveTime,
      'user_role': userRole,
      'user_branch_name': userBranchName,
      'user_department_name': userDepartmentName,
      'user_designation_name': userDesignationName,
      'user_status': userStatus,
      'company_doc': companyDoc,
      'users_doc': usersDoc,
      'users_edit_time': usersEditTime,
      'user_inactive_date': userInactiveDate,
      'users_edit_by_name': usersEditByName,
      'users_edit_by_number': usersEditByNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.employeeid == e2?.employeeid &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.gender == e2?.gender &&
        e1?.usersCreatedTime == e2?.usersCreatedTime &&
        e1?.usersCreatedByName == e2?.usersCreatedByName &&
        e1?.usersCreatedByNumber == e2?.usersCreatedByNumber &&
        e1?.usersLastActiveTime == e2?.usersLastActiveTime &&
        e1?.userRole == e2?.userRole &&
        e1?.userBranchName == e2?.userBranchName &&
        e1?.userDepartmentName == e2?.userDepartmentName &&
        e1?.userDesignationName == e2?.userDesignationName &&
        e1?.userStatus == e2?.userStatus &&
        e1?.companyDoc == e2?.companyDoc &&
        e1?.usersDoc == e2?.usersDoc &&
        e1?.usersEditTime == e2?.usersEditTime &&
        e1?.userInactiveDate == e2?.userInactiveDate &&
        e1?.usersEditByName == e2?.usersEditByName &&
        e1?.usersEditByNumber == e2?.usersEditByNumber;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.employeeid,
        e?.displayName,
        e?.phoneNumber,
        e?.photoUrl,
        e?.gender,
        e?.usersCreatedTime,
        e?.usersCreatedByName,
        e?.usersCreatedByNumber,
        e?.usersLastActiveTime,
        e?.userRole,
        e?.userBranchName,
        e?.userDepartmentName,
        e?.userDesignationName,
        e?.userStatus,
        e?.companyDoc,
        e?.usersDoc,
        e?.usersEditTime,
        e?.userInactiveDate,
        e?.usersEditByName,
        e?.usersEditByNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
