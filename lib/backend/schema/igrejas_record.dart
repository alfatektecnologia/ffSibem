import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IgrejasRecord extends FirestoreRecord {
  IgrejasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id_igreja" field.
  int? _idIgreja;
  int get idIgreja => _idIgreja ?? 0;
  bool hasIdIgreja() => _idIgreja != null;

  // "igreja" field.
  String? _igreja;
  String get igreja => _igreja ?? '';
  bool hasIgreja() => _igreja != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  bool hasEndereco() => _endereco != null;

  // "id_setor" field.
  String? _idSetor;
  String get idSetor => _idSetor ?? '';
  bool hasIdSetor() => _idSetor != null;

  // "situacao" field.
  int? _situacao;
  int get situacao => _situacao ?? 0;
  bool hasSituacao() => _situacao != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "lastInventario" field.
  String? _lastInventario;
  String get lastInventario => _lastInventario ?? '';
  bool hasLastInventario() => _lastInventario != null;

  void _initializeFields() {
    _idIgreja = castToType<int>(snapshotData['id_igreja']);
    _igreja = snapshotData['igreja'] as String?;
    _endereco = snapshotData['endereco'] as String?;
    _idSetor = snapshotData['id_setor'] as String?;
    _situacao = castToType<int>(snapshotData['situacao']);
    _foto = snapshotData['foto'] as String?;
    _lastInventario = snapshotData['lastInventario'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('igrejas');

  static Stream<IgrejasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IgrejasRecord.fromSnapshot(s));

  static Future<IgrejasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IgrejasRecord.fromSnapshot(s));

  static IgrejasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IgrejasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IgrejasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IgrejasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IgrejasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IgrejasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIgrejasRecordData({
  int? idIgreja,
  String? igreja,
  String? endereco,
  String? idSetor,
  int? situacao,
  String? foto,
  String? lastInventario,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_igreja': idIgreja,
      'igreja': igreja,
      'endereco': endereco,
      'id_setor': idSetor,
      'situacao': situacao,
      'foto': foto,
      'lastInventario': lastInventario,
    }.withoutNulls,
  );

  return firestoreData;
}

class IgrejasRecordDocumentEquality implements Equality<IgrejasRecord> {
  const IgrejasRecordDocumentEquality();

  @override
  bool equals(IgrejasRecord? e1, IgrejasRecord? e2) {
    return e1?.idIgreja == e2?.idIgreja &&
        e1?.igreja == e2?.igreja &&
        e1?.endereco == e2?.endereco &&
        e1?.idSetor == e2?.idSetor &&
        e1?.situacao == e2?.situacao &&
        e1?.foto == e2?.foto &&
        e1?.lastInventario == e2?.lastInventario;
  }

  @override
  int hash(IgrejasRecord? e) => const ListEquality().hash([
        e?.idIgreja,
        e?.igreja,
        e?.endereco,
        e?.idSetor,
        e?.situacao,
        e?.foto,
        e?.lastInventario
      ]);

  @override
  bool isValidKey(Object? o) => o is IgrejasRecord;
}
