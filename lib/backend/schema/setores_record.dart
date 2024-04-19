import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class SetoresRecord extends FirestoreRecord {
  SetoresRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id_setor" field.
  String? _idSetor;
  String get idSetor => _idSetor ?? '';
  bool hasIdSetor() => _idSetor != null;

  // "setor" field.
  String? _setor;
  String get setor => _setor ?? '';
  bool hasSetor() => _setor != null;

  void _initializeFields() {
    _idSetor = snapshotData['id_setor'] as String?;
    _setor = snapshotData['setor'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('setores');

  static Stream<SetoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SetoresRecord.fromSnapshot(s));

  static Future<SetoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SetoresRecord.fromSnapshot(s));

  static SetoresRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SetoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SetoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SetoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SetoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SetoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSetoresRecordData({
  String? idSetor,
  String? setor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_setor': idSetor,
      'setor': setor,
    }.withoutNulls,
  );

  return firestoreData;
}

class SetoresRecordDocumentEquality implements Equality<SetoresRecord> {
  const SetoresRecordDocumentEquality();

  @override
  bool equals(SetoresRecord? e1, SetoresRecord? e2) {
    return e1?.idSetor == e2?.idSetor && e1?.setor == e2?.setor;
  }

  @override
  int hash(SetoresRecord? e) =>
      const ListEquality().hash([e?.idSetor, e?.setor]);

  @override
  bool isValidKey(Object? o) => o is SetoresRecord;
}
