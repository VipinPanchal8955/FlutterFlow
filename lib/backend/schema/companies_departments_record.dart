import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompaniesDepartmentsRecord extends FirestoreRecord {
  CompaniesDepartmentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "departments_name" field.
  String? _departmentsName;
  String get departmentsName => _departmentsName ?? '';
  bool hasDepartmentsName() => _departmentsName != null;

  // "departments_created_time" field.
  DateTime? _departmentsCreatedTime;
  DateTime? get departmentsCreatedTime => _departmentsCreatedTime;
  bool hasDepartmentsCreatedTime() => _departmentsCreatedTime != null;

  // "company_doc" field.
  DocumentReference? _companyDoc;
  DocumentReference? get companyDoc => _companyDoc;
  bool hasCompanyDoc() => _companyDoc != null;

  // "departments_doc" field.
  DocumentReference? _departmentsDoc;
  DocumentReference? get departmentsDoc => _departmentsDoc;
  bool hasDepartmentsDoc() => _departmentsDoc != null;

  void _initializeFields() {
    _departmentsName = snapshotData['departments_name'] as String?;
    _departmentsCreatedTime =
        snapshotData['departments_created_time'] as DateTime?;
    _companyDoc = snapshotData['company_doc'] as DocumentReference?;
    _departmentsDoc = snapshotData['departments_doc'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('companies_departments');

  static Stream<CompaniesDepartmentsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CompaniesDepartmentsRecord.fromSnapshot(s));

  static Future<CompaniesDepartmentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CompaniesDepartmentsRecord.fromSnapshot(s));

  static CompaniesDepartmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompaniesDepartmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompaniesDepartmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompaniesDepartmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompaniesDepartmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompaniesDepartmentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompaniesDepartmentsRecordData({
  String? departmentsName,
  DateTime? departmentsCreatedTime,
  DocumentReference? companyDoc,
  DocumentReference? departmentsDoc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'departments_name': departmentsName,
      'departments_created_time': departmentsCreatedTime,
      'company_doc': companyDoc,
      'departments_doc': departmentsDoc,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompaniesDepartmentsRecordDocumentEquality
    implements Equality<CompaniesDepartmentsRecord> {
  const CompaniesDepartmentsRecordDocumentEquality();

  @override
  bool equals(CompaniesDepartmentsRecord? e1, CompaniesDepartmentsRecord? e2) {
    return e1?.departmentsName == e2?.departmentsName &&
        e1?.departmentsCreatedTime == e2?.departmentsCreatedTime &&
        e1?.companyDoc == e2?.companyDoc &&
        e1?.departmentsDoc == e2?.departmentsDoc;
  }

  @override
  int hash(CompaniesDepartmentsRecord? e) => const ListEquality().hash([
        e?.departmentsName,
        e?.departmentsCreatedTime,
        e?.companyDoc,
        e?.departmentsDoc
      ]);

  @override
  bool isValidKey(Object? o) => o is CompaniesDepartmentsRecord;
}
