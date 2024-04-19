import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExcluirEtiquetasRecord extends FirestoreRecord {
  ExcluirEtiquetasRecord._(
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

  // "localizao" field.
  String? _localizao;
  String get localizao => _localizao ?? '';
  bool hasLocalizao() => _localizao != null;

  // "observacao" field.
  String? _observacao;
  String get observacao => _observacao ?? '';
  bool hasObservacao() => _observacao != null;

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  bool hasData() => _data != null;

  void _initializeFields() {
    _idBem = castToType<int>(snapshotData['id_bem']);
    _idIgreja = castToType<int>(snapshotData['id_igreja']);
    _descricao = snapshotData['descricao'] as String?;
    _localizao = snapshotData['localizao'] as String?;
    _observacao = snapshotData['observacao'] as String?;
    _data = snapshotData['data'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('excluir_etiquetas');

  static Stream<ExcluirEtiquetasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExcluirEtiquetasRecord.fromSnapshot(s));

  static Future<ExcluirEtiquetasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ExcluirEtiquetasRecord.fromSnapshot(s));

  static ExcluirEtiquetasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExcluirEtiquetasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExcluirEtiquetasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExcluirEtiquetasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExcluirEtiquetasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExcluirEtiquetasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExcluirEtiquetasRecordData({
  int? idBem,
  int? idIgreja,
  String? descricao,
  String? localizao,
  String? observacao,
  String? data,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_bem': idBem,
      'id_igreja': idIgreja,
      'descricao': descricao,
      'localizao': localizao,
      'observacao': observacao,
      'data': data,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExcluirEtiquetasRecordDocumentEquality
    implements Equality<ExcluirEtiquetasRecord> {
  const ExcluirEtiquetasRecordDocumentEquality();

  @override
  bool equals(ExcluirEtiquetasRecord? e1, ExcluirEtiquetasRecord? e2) {
    return e1?.idBem == e2?.idBem &&
        e1?.idIgreja == e2?.idIgreja &&
        e1?.descricao == e2?.descricao &&
        e1?.localizao == e2?.localizao &&
        e1?.observacao == e2?.observacao &&
        e1?.data == e2?.data;
  }

  @override
  int hash(ExcluirEtiquetasRecord? e) => const ListEquality().hash([
        e?.idBem,
        e?.idIgreja,
        e?.descricao,
        e?.localizao,
        e?.observacao,
        e?.data
      ]);

  @override
  bool isValidKey(Object? o) => o is ExcluirEtiquetasRecord;
}
