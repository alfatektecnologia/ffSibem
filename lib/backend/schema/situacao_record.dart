import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SituacaoRecord extends FirestoreRecord {
  SituacaoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id_situacao" field.
  int? _idSituacao;
  int get idSituacao => _idSituacao ?? 0;
  bool hasIdSituacao() => _idSituacao != null;

  // "situacao" field.
  String? _situacao;
  String get situacao => _situacao ?? '';
  bool hasSituacao() => _situacao != null;

  void _initializeFields() {
    _idSituacao = castToType<int>(snapshotData['id_situacao']);
    _situacao = snapshotData['situacao'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('situacao');

  static Stream<SituacaoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SituacaoRecord.fromSnapshot(s));

  static Future<SituacaoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SituacaoRecord.fromSnapshot(s));

  static SituacaoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SituacaoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SituacaoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SituacaoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SituacaoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SituacaoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSituacaoRecordData({
  int? idSituacao,
  String? situacao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_situacao': idSituacao,
      'situacao': situacao,
    }.withoutNulls,
  );

  return firestoreData;
}

class SituacaoRecordDocumentEquality implements Equality<SituacaoRecord> {
  const SituacaoRecordDocumentEquality();

  @override
  bool equals(SituacaoRecord? e1, SituacaoRecord? e2) {
    return e1?.idSituacao == e2?.idSituacao && e1?.situacao == e2?.situacao;
  }

  @override
  int hash(SituacaoRecord? e) =>
      const ListEquality().hash([e?.idSituacao, e?.situacao]);

  @override
  bool isValidKey(Object? o) => o is SituacaoRecord;
}
