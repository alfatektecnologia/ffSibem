import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InventarioRecord extends FirestoreRecord {
  InventarioRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "bens" field.
  int? _bens;
  int get bens => _bens ?? 0;
  bool hasBens() => _bens != null;

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  bool hasData() => _data != null;

  // "id_igreja" field.
  int? _idIgreja;
  int get idIgreja => _idIgreja ?? 0;
  bool hasIdIgreja() => _idIgreja != null;

  // "id_inventario" field.
  int? _idInventario;
  int get idInventario => _idInventario ?? 0;
  bool hasIdInventario() => _idInventario != null;

  // "inicio" field.
  String? _inicio;
  String get inicio => _inicio ?? '';
  bool hasInicio() => _inicio != null;

  // "inventariante" field.
  String? _inventariante;
  String get inventariante => _inventariante ?? '';
  bool hasInventariante() => _inventariante != null;

  // "responsaveis" field.
  String? _responsaveis;
  String get responsaveis => _responsaveis ?? '';
  bool hasResponsaveis() => _responsaveis != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "tempo" field.
  String? _tempo;
  String get tempo => _tempo ?? '';
  bool hasTempo() => _tempo != null;

  // "termino" field.
  String? _termino;
  String get termino => _termino ?? '';
  bool hasTermino() => _termino != null;

  // "pdf" field.
  String? _pdf;
  String get pdf => _pdf ?? '';
  bool hasPdf() => _pdf != null;

  void _initializeFields() {
    _bens = castToType<int>(snapshotData['bens']);
    _data = snapshotData['data'] as String?;
    _idIgreja = castToType<int>(snapshotData['id_igreja']);
    _idInventario = castToType<int>(snapshotData['id_inventario']);
    _inicio = snapshotData['inicio'] as String?;
    _inventariante = snapshotData['inventariante'] as String?;
    _responsaveis = snapshotData['responsaveis'] as String?;
    _status = snapshotData['status'] as String?;
    _tempo = snapshotData['tempo'] as String?;
    _termino = snapshotData['termino'] as String?;
    _pdf = snapshotData['pdf'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('inventario');

  static Stream<InventarioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InventarioRecord.fromSnapshot(s));

  static Future<InventarioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InventarioRecord.fromSnapshot(s));

  static InventarioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InventarioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InventarioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InventarioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InventarioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InventarioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInventarioRecordData({
  int? bens,
  String? data,
  int? idIgreja,
  int? idInventario,
  String? inicio,
  String? inventariante,
  String? responsaveis,
  String? status,
  String? tempo,
  String? termino,
  String? pdf,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bens': bens,
      'data': data,
      'id_igreja': idIgreja,
      'id_inventario': idInventario,
      'inicio': inicio,
      'inventariante': inventariante,
      'responsaveis': responsaveis,
      'status': status,
      'tempo': tempo,
      'termino': termino,
      'pdf': pdf,
    }.withoutNulls,
  );

  return firestoreData;
}

class InventarioRecordDocumentEquality implements Equality<InventarioRecord> {
  const InventarioRecordDocumentEquality();

  @override
  bool equals(InventarioRecord? e1, InventarioRecord? e2) {
    return e1?.bens == e2?.bens &&
        e1?.data == e2?.data &&
        e1?.idIgreja == e2?.idIgreja &&
        e1?.idInventario == e2?.idInventario &&
        e1?.inicio == e2?.inicio &&
        e1?.inventariante == e2?.inventariante &&
        e1?.responsaveis == e2?.responsaveis &&
        e1?.status == e2?.status &&
        e1?.tempo == e2?.tempo &&
        e1?.termino == e2?.termino &&
        e1?.pdf == e2?.pdf;
  }

  @override
  int hash(InventarioRecord? e) => const ListEquality().hash([
        e?.bens,
        e?.data,
        e?.idIgreja,
        e?.idInventario,
        e?.inicio,
        e?.inventariante,
        e?.responsaveis,
        e?.status,
        e?.tempo,
        e?.termino,
        e?.pdf
      ]);

  @override
  bool isValidKey(Object? o) => o is InventarioRecord;
}
