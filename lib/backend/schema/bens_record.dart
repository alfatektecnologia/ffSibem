import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BensRecord extends FirestoreRecord {
  BensRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id_bem" field.
  int? _idBem;
  int get idBem => _idBem ?? 0;
  bool hasIdBem() => _idBem != null;

  // "id_igreja" field.
  int? _idIgreja;
  int get idIgreja => _idIgreja ?? 0;
  bool hasIdIgreja() => _idIgreja != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "dependencia" field.
  String? _dependencia;
  String get dependencia => _dependencia ?? '';
  bool hasDependencia() => _dependencia != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _idBem = castToType<int>(snapshotData['id_bem']);
    _idIgreja = castToType<int>(snapshotData['id_igreja']);
    _descricao = snapshotData['descricao'] as String?;
    _dependencia = snapshotData['dependencia'] as String?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bens');

  static Stream<BensRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BensRecord.fromSnapshot(s));

  static Future<BensRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BensRecord.fromSnapshot(s));

  static BensRecord fromSnapshot(DocumentSnapshot snapshot) => BensRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BensRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BensRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BensRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BensRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBensRecordData({
  int? idBem,
  int? idIgreja,
  String? descricao,
  String? dependencia,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_bem': idBem,
      'id_igreja': idIgreja,
      'descricao': descricao,
      'dependencia': dependencia,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class BensRecordDocumentEquality implements Equality<BensRecord> {
  const BensRecordDocumentEquality();

  @override
  bool equals(BensRecord? e1, BensRecord? e2) {
    return e1?.idBem == e2?.idBem &&
        e1?.idIgreja == e2?.idIgreja &&
        e1?.descricao == e2?.descricao &&
        e1?.dependencia == e2?.dependencia &&
        e1?.status == e2?.status;
  }

  @override
  int hash(BensRecord? e) => const ListEquality()
      .hash([e?.idBem, e?.idIgreja, e?.descricao, e?.dependencia, e?.status]);

  @override
  bool isValidKey(Object? o) => o is BensRecord;
}
