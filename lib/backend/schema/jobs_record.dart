import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class JobsRecord extends FirestoreRecord {
  JobsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "jobCategory" field.
  String? _jobCategory;
  String get jobCategory => _jobCategory ?? '';
  bool hasJobCategory() => _jobCategory != null;

  // "Customer" field.
  String? _customer;
  String get customer => _customer ?? '';
  bool hasCustomer() => _customer != null;

  // "Address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "jobName" field.
  String? _jobName;
  String get jobName => _jobName ?? '';
  bool hasJobName() => _jobName != null;

  // "jobcomplete" field.
  bool? _jobcomplete;
  bool get jobcomplete => _jobcomplete ?? false;
  bool hasJobcomplete() => _jobcomplete != null;

  // "jobdate" field.
  String? _jobdate;
  String get jobdate => _jobdate ?? '';
  bool hasJobdate() => _jobdate != null;

  // "jobtime" field.
  String? _jobtime;
  String get jobtime => _jobtime ?? '';
  bool hasJobtime() => _jobtime != null;

  // "jobID" field.
  DocumentReference? _jobID;
  DocumentReference? get jobID => _jobID;
  bool hasJobID() => _jobID != null;

  void _initializeFields() {
    _jobCategory = snapshotData['jobCategory'] as String?;
    _customer = snapshotData['Customer'] as String?;
    _address = snapshotData['Address'] as String?;
    _jobName = snapshotData['jobName'] as String?;
    _jobcomplete = snapshotData['jobcomplete'] as bool?;
    _jobdate = snapshotData['jobdate'] as String?;
    _jobtime = snapshotData['jobtime'] as String?;
    _jobID = snapshotData['jobID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Jobs');

  static Stream<JobsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobsRecord.fromSnapshot(s));

  static Future<JobsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobsRecord.fromSnapshot(s));

  static JobsRecord fromSnapshot(DocumentSnapshot snapshot) => JobsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JobsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobsRecordData({
  String? jobCategory,
  String? customer,
  String? address,
  String? jobName,
  bool? jobcomplete,
  String? jobdate,
  String? jobtime,
  DocumentReference? jobID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'jobCategory': jobCategory,
      'Customer': customer,
      'Address': address,
      'jobName': jobName,
      'jobcomplete': jobcomplete,
      'jobdate': jobdate,
      'jobtime': jobtime,
      'jobID': jobID,
    }.withoutNulls,
  );

  return firestoreData;
}

class JobsRecordDocumentEquality implements Equality<JobsRecord> {
  const JobsRecordDocumentEquality();

  @override
  bool equals(JobsRecord? e1, JobsRecord? e2) {
    return e1?.jobCategory == e2?.jobCategory &&
        e1?.customer == e2?.customer &&
        e1?.address == e2?.address &&
        e1?.jobName == e2?.jobName &&
        e1?.jobcomplete == e2?.jobcomplete &&
        e1?.jobdate == e2?.jobdate &&
        e1?.jobtime == e2?.jobtime &&
        e1?.jobID == e2?.jobID;
  }

  @override
  int hash(JobsRecord? e) => const ListEquality().hash([
        e?.jobCategory,
        e?.customer,
        e?.address,
        e?.jobName,
        e?.jobcomplete,
        e?.jobdate,
        e?.jobtime,
        e?.jobID
      ]);

  @override
  bool isValidKey(Object? o) => o is JobsRecord;
}
