import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompaniesDesignationsRecord extends FirestoreRecord {
  CompaniesDesignationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "designations_name" field.
  String? _designationsName;
  String get designationsName => _designationsName ?? '';
  bool hasDesignationsName() => _designationsName != null;

  // "designations_created_time" field.
  DateTime? _designationsCreatedTime;
  DateTime? get designationsCreatedTime => _designationsCreatedTime;
  bool hasDesignationsCreatedTime() => _designationsCreatedTime != null;

  // "company_doc" field.
  DocumentReference? _companyDoc;
  DocumentReference? get companyDoc => _companyDoc;
  bool hasCompanyDoc() => _companyDoc != null;

  // "designations_doc" field.
  DocumentReference? _designationsDoc;
  DocumentReference? get designationsDoc => _designationsDoc;
  bool hasDesignationsDoc() => _designationsDoc != null;

  void _initializeFields() {
    _designationsName = snapshotData['designations_name'] as String?;
    _designationsCreatedTime =
        snapshotData['designations_created_time'] as DateTime?;
    _companyDoc = snapshotData['company_doc'] as DocumentReference?;
    _designationsDoc = snapshotData['designations_doc'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('companies_designations');

  static Stream<CompaniesDesignationsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CompaniesDesignationsRecord.fromSnapshot(s));

  static Future<CompaniesDesignationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CompaniesDesignationsRecord.fromSnapshot(s));

  static CompaniesDesignationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompaniesDesignationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompaniesDesignationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompaniesDesignationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompaniesDesignationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompaniesDesignationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompaniesDesignationsRecordData({
  String? designationsName,
  DateTime? designationsCreatedTime,
  DocumentReference? companyDoc,
  DocumentReference? designationsDoc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'designations_name': designationsName,
      'designations_created_time': designationsCreatedTime,
      'company_doc': companyDoc,
      'designations_doc': designationsDoc,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompaniesDesignationsRecordDocumentEquality
    implements Equality<CompaniesDesignationsRecord> {
  const CompaniesDesignationsRecordDocumentEquality();

  @override
  bool equals(
      CompaniesDesignationsRecord? e1, CompaniesDesignationsRecord? e2) {
    return e1?.designationsName == e2?.designationsName &&
        e1?.designationsCreatedTime == e2?.designationsCreatedTime &&
        e1?.companyDoc == e2?.companyDoc &&
        e1?.designationsDoc == e2?.designationsDoc;
  }

  @override
  int hash(CompaniesDesignationsRecord? e) => const ListEquality().hash([
        e?.designationsName,
        e?.designationsCreatedTime,
        e?.companyDoc,
        e?.designationsDoc
      ]);

  @override
  bool isValidKey(Object? o) => o is CompaniesDesignationsRecord;
}
