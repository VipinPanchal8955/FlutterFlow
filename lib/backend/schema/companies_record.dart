import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompaniesRecord extends FirestoreRecord {
  CompaniesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "companies_created_time" field.
  DateTime? _companiesCreatedTime;
  DateTime? get companiesCreatedTime => _companiesCreatedTime;
  bool hasCompaniesCreatedTime() => _companiesCreatedTime != null;

  // "companies_status" field.
  String? _companiesStatus;
  String get companiesStatus => _companiesStatus ?? '';
  bool hasCompaniesStatus() => _companiesStatus != null;

  // "gst_number" field.
  String? _gstNumber;
  String get gstNumber => _gstNumber ?? '';
  bool hasGstNumber() => _gstNumber != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "company_doc" field.
  DocumentReference? _companyDoc;
  DocumentReference? get companyDoc => _companyDoc;
  bool hasCompanyDoc() => _companyDoc != null;

  // "edit_time" field.
  DateTime? _editTime;
  DateTime? get editTime => _editTime;
  bool hasEditTime() => _editTime != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  void _initializeFields() {
    _businessName = snapshotData['business_name'] as String?;
    _country = snapshotData['country'] as String?;
    _state = snapshotData['state'] as String?;
    _companiesCreatedTime = snapshotData['companies_created_time'] as DateTime?;
    _companiesStatus = snapshotData['companies_status'] as String?;
    _gstNumber = snapshotData['gst_number'] as String?;
    _city = snapshotData['city'] as String?;
    _companyDoc = snapshotData['company_doc'] as DocumentReference?;
    _editTime = snapshotData['edit_time'] as DateTime?;
    _address = snapshotData['address'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('companies');

  static Stream<CompaniesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompaniesRecord.fromSnapshot(s));

  static Future<CompaniesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompaniesRecord.fromSnapshot(s));

  static CompaniesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompaniesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompaniesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompaniesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompaniesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompaniesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompaniesRecordData({
  String? businessName,
  String? country,
  String? state,
  DateTime? companiesCreatedTime,
  String? companiesStatus,
  String? gstNumber,
  String? city,
  DocumentReference? companyDoc,
  DateTime? editTime,
  String? address,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'business_name': businessName,
      'country': country,
      'state': state,
      'companies_created_time': companiesCreatedTime,
      'companies_status': companiesStatus,
      'gst_number': gstNumber,
      'city': city,
      'company_doc': companyDoc,
      'edit_time': editTime,
      'address': address,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompaniesRecordDocumentEquality implements Equality<CompaniesRecord> {
  const CompaniesRecordDocumentEquality();

  @override
  bool equals(CompaniesRecord? e1, CompaniesRecord? e2) {
    return e1?.businessName == e2?.businessName &&
        e1?.country == e2?.country &&
        e1?.state == e2?.state &&
        e1?.companiesCreatedTime == e2?.companiesCreatedTime &&
        e1?.companiesStatus == e2?.companiesStatus &&
        e1?.gstNumber == e2?.gstNumber &&
        e1?.city == e2?.city &&
        e1?.companyDoc == e2?.companyDoc &&
        e1?.editTime == e2?.editTime &&
        e1?.address == e2?.address;
  }

  @override
  int hash(CompaniesRecord? e) => const ListEquality().hash([
        e?.businessName,
        e?.country,
        e?.state,
        e?.companiesCreatedTime,
        e?.companiesStatus,
        e?.gstNumber,
        e?.city,
        e?.companyDoc,
        e?.editTime,
        e?.address
      ]);

  @override
  bool isValidKey(Object? o) => o is CompaniesRecord;
}
