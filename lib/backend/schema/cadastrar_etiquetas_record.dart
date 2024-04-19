import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CadastrarEtiquetasRecord extends FirestoreRecord {
  CadastrarEtiquetasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

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

  // "id_bem" field.
  String? _idBem;
  String get idBem => _idBem ?? '';
  bool hasIdBem() => _idBem != null;

  void _initializeFields() {
    _idIgreja = castToType<int>(snapshotData['id_igreja']);
    _descricao = snapshotData['descricao'] as String?;
    _localizao = snapshotData['localizao'] as String?;
    _observacao = snapshotData['observacao'] as String?;
    _data = snapshotData['data'] as String?;
    _idBem = snapshotData['id_bem'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cadastrar_etiquetas');

  static Stream<CadastrarEtiquetasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CadastrarEtiquetasRecord.fromSnapshot(s));

  static Future<CadastrarEtiquetasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CadastrarEtiquetasRecord.fromSnapshot(s));

  static CadastrarEtiquetasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CadastrarEtiquetasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CadastrarEtiquetasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CadastrarEtiquetasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CadastrarEtiquetasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CadastrarEtiquetasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCadastrarEtiquetasRecordData({
  int? idIgreja,
  String? descricao,
  String? localizao,
  String? observacao,
  String? data,
  String? idBem,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_igreja': idIgreja,
      'descricao': descricao,
      'localizao': localizao,
      'observacao': observacao,
      'data': data,
      'id_bem': idBem,
    }.withoutNulls,
  );

  return firestoreData;
}

class CadastrarEtiquetasRecordDocumentEquality
    implements Equality<CadastrarEtiquetasRecord> {
  const CadastrarEtiquetasRecordDocumentEquality();

  @override
  bool equals(CadastrarEtiquetasRecord? e1, CadastrarEtiquetasRecord? e2) {
    return e1?.idIgreja == e2?.idIgreja &&
        e1?.descricao == e2?.descricao &&
        e1?.localizao == e2?.localizao &&
        e1?.observacao == e2?.observacao &&
        e1?.data == e2?.data &&
        e1?.idBem == e2?.idBem;
  }

  @override
  int hash(CadastrarEtiquetasRecord? e) => const ListEquality().hash([
        e?.idIgreja,
        e?.descricao,
        e?.localizao,
        e?.observacao,
        e?.data,
        e?.idBem
      ]);

  @override
  bool isValidKey(Object? o) => o is CadastrarEtiquetasRecord;
}
