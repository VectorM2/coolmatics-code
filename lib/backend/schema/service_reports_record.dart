import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceReportsRecord extends FirestoreRecord {
  ServiceReportsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "jobNumber" field.
  int? _jobNumber;
  int get jobNumber => _jobNumber ?? 0;
  bool hasJobNumber() => _jobNumber != null;

  // "client" field.
  String? _client;
  String get client => _client ?? '';
  bool hasClient() => _client != null;

  // "contactNumber" field.
  String? _contactNumber;
  String get contactNumber => _contactNumber ?? '';
  bool hasContactNumber() => _contactNumber != null;

  // "contactPerson" field.
  String? _contactPerson;
  String get contactPerson => _contactPerson ?? '';
  bool hasContactPerson() => _contactPerson != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "siteArea" field.
  String? _siteArea;
  String get siteArea => _siteArea ?? '';
  bool hasSiteArea() => _siteArea != null;

  // "siteArealocation" field.
  String? _siteArealocation;
  String get siteArealocation => _siteArealocation ?? '';
  bool hasSiteArealocation() => _siteArealocation != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "workUndertaken" field.
  String? _workUndertaken;
  String get workUndertaken => _workUndertaken ?? '';
  bool hasWorkUndertaken() => _workUndertaken != null;

  // "equipmentAndMaterials" field.
  List<String>? _equipmentAndMaterials;
  List<String> get equipmentAndMaterials => _equipmentAndMaterials ?? const [];
  bool hasEquipmentAndMaterials() => _equipmentAndMaterials != null;

  // "technician" field.
  String? _technician;
  String get technician => _technician ?? '';
  bool hasTechnician() => _technician != null;

  // "assistant" field.
  String? _assistant;
  String get assistant => _assistant ?? '';
  bool hasAssistant() => _assistant != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "travelTime" field.
  int? _travelTime;
  int get travelTime => _travelTime ?? 0;
  bool hasTravelTime() => _travelTime != null;

  // "workedHoursNormal" field.
  int? _workedHoursNormal;
  int get workedHoursNormal => _workedHoursNormal ?? 0;
  bool hasWorkedHoursNormal() => _workedHoursNormal != null;

  // "workedHoursOvertime" field.
  int? _workedHoursOvertime;
  int get workedHoursOvertime => _workedHoursOvertime ?? 0;
  bool hasWorkedHoursOvertime() => _workedHoursOvertime != null;

  void _initializeFields() {
    _photo = snapshotData['photo'] as String?;
    _jobNumber = castToType<int>(snapshotData['jobNumber']);
    _client = snapshotData['client'] as String?;
    _contactNumber = snapshotData['contactNumber'] as String?;
    _contactPerson = snapshotData['contactPerson'] as String?;
    _email = snapshotData['email'] as String?;
    _siteArea = snapshotData['siteArea'] as String?;
    _siteArealocation = snapshotData['siteArealocation'] as String?;
    _description = snapshotData['description'] as String?;
    _workUndertaken = snapshotData['workUndertaken'] as String?;
    _equipmentAndMaterials = getDataList(snapshotData['equipmentAndMaterials']);
    _technician = snapshotData['technician'] as String?;
    _assistant = snapshotData['assistant'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _travelTime = castToType<int>(snapshotData['travelTime']);
    _workedHoursNormal = castToType<int>(snapshotData['workedHoursNormal']);
    _workedHoursOvertime = castToType<int>(snapshotData['workedHoursOvertime']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('service_reports');

  static Stream<ServiceReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiceReportsRecord.fromSnapshot(s));

  static Future<ServiceReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServiceReportsRecord.fromSnapshot(s));

  static ServiceReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiceReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiceReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiceReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiceReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServiceReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServiceReportsRecordData({
  String? photo,
  int? jobNumber,
  String? client,
  String? contactNumber,
  String? contactPerson,
  String? email,
  String? siteArea,
  String? siteArealocation,
  String? description,
  String? workUndertaken,
  String? technician,
  String? assistant,
  DateTime? date,
  int? travelTime,
  int? workedHoursNormal,
  int? workedHoursOvertime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photo': photo,
      'jobNumber': jobNumber,
      'client': client,
      'contactNumber': contactNumber,
      'contactPerson': contactPerson,
      'email': email,
      'siteArea': siteArea,
      'siteArealocation': siteArealocation,
      'description': description,
      'workUndertaken': workUndertaken,
      'technician': technician,
      'assistant': assistant,
      'date': date,
      'travelTime': travelTime,
      'workedHoursNormal': workedHoursNormal,
      'workedHoursOvertime': workedHoursOvertime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiceReportsRecordDocumentEquality
    implements Equality<ServiceReportsRecord> {
  const ServiceReportsRecordDocumentEquality();

  @override
  bool equals(ServiceReportsRecord? e1, ServiceReportsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.photo == e2?.photo &&
        e1?.jobNumber == e2?.jobNumber &&
        e1?.client == e2?.client &&
        e1?.contactNumber == e2?.contactNumber &&
        e1?.contactPerson == e2?.contactPerson &&
        e1?.email == e2?.email &&
        e1?.siteArea == e2?.siteArea &&
        e1?.siteArealocation == e2?.siteArealocation &&
        e1?.description == e2?.description &&
        e1?.workUndertaken == e2?.workUndertaken &&
        listEquality.equals(
            e1?.equipmentAndMaterials, e2?.equipmentAndMaterials) &&
        e1?.technician == e2?.technician &&
        e1?.assistant == e2?.assistant &&
        e1?.date == e2?.date &&
        e1?.travelTime == e2?.travelTime &&
        e1?.workedHoursNormal == e2?.workedHoursNormal &&
        e1?.workedHoursOvertime == e2?.workedHoursOvertime;
  }

  @override
  int hash(ServiceReportsRecord? e) => const ListEquality().hash([
        e?.photo,
        e?.jobNumber,
        e?.client,
        e?.contactNumber,
        e?.contactPerson,
        e?.email,
        e?.siteArea,
        e?.siteArealocation,
        e?.description,
        e?.workUndertaken,
        e?.equipmentAndMaterials,
        e?.technician,
        e?.assistant,
        e?.date,
        e?.travelTime,
        e?.workedHoursNormal,
        e?.workedHoursOvertime
      ]);

  @override
  bool isValidKey(Object? o) => o is ServiceReportsRecord;
}
