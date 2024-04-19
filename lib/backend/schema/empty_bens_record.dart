import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmptyBensRecord extends FirestoreRecord {
  EmptyBensRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id_bem" field.
  int? _idBem;
  int get idBem => _idBem ?? 0;
  bool hasIdBem() => _idBem != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "dependencia" field.
  String? _dependencia;
  String get dependencia => _dependencia ?? '';
  bool hasDependencia() => _dependencia != null;

  void _initializeFields() {
    _idBem = castToType<int>(snapshotData['id_bem']);
    _descricao = snapshotData['descricao'] as String?;
    _dependencia = snapshotData['dependencia'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('empty_Bens');

  static Stream<EmptyBensRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmptyBensRecord.fromSnapshot(s));

  static Future<EmptyBensRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmptyBensRecord.fromSnapshot(s));

  static EmptyBensRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmptyBensRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmptyBensRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmptyBensRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmptyBensRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmptyBensRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmptyBensRecordData({
  int? idBem,
  String? descricao,
  String? dependencia,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_bem': idBem,
      'descricao': descricao,
      'dependencia': dependencia,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmptyBensRecordDocumentEquality implements Equality<EmptyBensRecord> {
  const EmptyBensRecordDocumentEquality();

  @override
  bool equals(EmptyBensRecord? e1, EmptyBensRecord? e2) {
    return e1?.idBem == e2?.idBem &&
        e1?.descricao == e2?.descricao &&
        e1?.dependencia == e2?.dependencia;
  }

  @override
  int hash(EmptyBensRecord? e) =>
      const ListEquality().hash([e?.idBem, e?.descricao, e?.dependencia]);

  @override
  bool isValidKey(Object? o) => o is EmptyBensRecord;
}
