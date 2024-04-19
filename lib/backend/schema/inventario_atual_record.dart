import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InventarioAtualRecord extends FirestoreRecord {
  InventarioAtualRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "bens" field.
  int? _bens;
  int get bens => _bens ?? 0;
  bool hasBens() => _bens != null;

  // "id_igreja" field.
  int? _idIgreja;
  int get idIgreja => _idIgreja ?? 0;
  bool hasIdIgreja() => _idIgreja != null;

  // "id_inventario" field.
  int? _idInventario;
  int get idInventario => _idInventario ?? 0;
  bool hasIdInventario() => _idInventario != null;

  // "number_inventarios_by_igrejaId" field.
  int? _numberInventariosByIgrejaId;
  int get numberInventariosByIgrejaId => _numberInventariosByIgrejaId ?? 0;
  bool hasNumberInventariosByIgrejaId() => _numberInventariosByIgrejaId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _bens = castToType<int>(snapshotData['bens']);
    _idIgreja = castToType<int>(snapshotData['id_igreja']);
    _idInventario = castToType<int>(snapshotData['id_inventario']);
    _numberInventariosByIgrejaId =
        castToType<int>(snapshotData['number_inventarios_by_igrejaId']);
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('inventario_atual');

  static Stream<InventarioAtualRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InventarioAtualRecord.fromSnapshot(s));

  static Future<InventarioAtualRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InventarioAtualRecord.fromSnapshot(s));

  static InventarioAtualRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InventarioAtualRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InventarioAtualRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InventarioAtualRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InventarioAtualRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InventarioAtualRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInventarioAtualRecordData({
  int? bens,
  int? idIgreja,
  int? idInventario,
  int? numberInventariosByIgrejaId,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bens': bens,
      'id_igreja': idIgreja,
      'id_inventario': idInventario,
      'number_inventarios_by_igrejaId': numberInventariosByIgrejaId,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class InventarioAtualRecordDocumentEquality
    implements Equality<InventarioAtualRecord> {
  const InventarioAtualRecordDocumentEquality();

  @override
  bool equals(InventarioAtualRecord? e1, InventarioAtualRecord? e2) {
    return e1?.bens == e2?.bens &&
        e1?.idIgreja == e2?.idIgreja &&
        e1?.idInventario == e2?.idInventario &&
        e1?.numberInventariosByIgrejaId == e2?.numberInventariosByIgrejaId &&
        e1?.status == e2?.status;
  }

  @override
  int hash(InventarioAtualRecord? e) => const ListEquality().hash([
        e?.bens,
        e?.idIgreja,
        e?.idInventario,
        e?.numberInventariosByIgrejaId,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is InventarioAtualRecord;
}
