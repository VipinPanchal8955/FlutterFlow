import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompaniesBranchesRecord extends FirestoreRecord {
  CompaniesBranchesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "branch_name" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  bool hasBranchName() => _branchName != null;

  // "branch_created_time" field.
  DateTime? _branchCreatedTime;
  DateTime? get branchCreatedTime => _branchCreatedTime;
  bool hasBranchCreatedTime() => _branchCreatedTime != null;

  // "company_doc" field.
  DocumentReference? _companyDoc;
  DocumentReference? get companyDoc => _companyDoc;
  bool hasCompanyDoc() => _companyDoc != null;

  // "branch_doc" field.
  DocumentReference? _branchDoc;
  DocumentReference? get branchDoc => _branchDoc;
  bool hasBranchDoc() => _branchDoc != null;

  void _initializeFields() {
    _branchName = snapshotData['branch_name'] as String?;
    _branchCreatedTime = snapshotData['branch_created_time'] as DateTime?;
    _companyDoc = snapshotData['company_doc'] as DocumentReference?;
    _branchDoc = snapshotData['branch_doc'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('companies_branches');

  static Stream<CompaniesBranchesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompaniesBranchesRecord.fromSnapshot(s));

  static Future<CompaniesBranchesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CompaniesBranchesRecord.fromSnapshot(s));

  static CompaniesBranchesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompaniesBranchesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompaniesBranchesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompaniesBranchesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompaniesBranchesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompaniesBranchesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompaniesBranchesRecordData({
  String? branchName,
  DateTime? branchCreatedTime,
  DocumentReference? companyDoc,
  DocumentReference? branchDoc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'branch_name': branchName,
      'branch_created_time': branchCreatedTime,
      'company_doc': companyDoc,
      'branch_doc': branchDoc,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompaniesBranchesRecordDocumentEquality
    implements Equality<CompaniesBranchesRecord> {
  const CompaniesBranchesRecordDocumentEquality();

  @override
  bool equals(CompaniesBranchesRecord? e1, CompaniesBranchesRecord? e2) {
    return e1?.branchName == e2?.branchName &&
        e1?.branchCreatedTime == e2?.branchCreatedTime &&
        e1?.companyDoc == e2?.companyDoc &&
        e1?.branchDoc == e2?.branchDoc;
  }

  @override
  int hash(CompaniesBranchesRecord? e) => const ListEquality()
      .hash([e?.branchName, e?.branchCreatedTime, e?.companyDoc, e?.branchDoc]);

  @override
  bool isValidKey(Object? o) => o is CompaniesBranchesRecord;
}
