import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocalizacoesRecord extends FirestoreRecord {
  LocalizacoesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id_localizacao" field.
  int? _idLocalizacao;
  int get idLocalizacao => _idLocalizacao ?? 0;
  bool hasIdLocalizacao() => _idLocalizacao != null;

  void _initializeFields() {
    _idLocalizacao = castToType<int>(snapshotData['id_localizacao']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('localizacoes');

  static Stream<LocalizacoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocalizacoesRecord.fromSnapshot(s));

  static Future<LocalizacoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocalizacoesRecord.fromSnapshot(s));

  static LocalizacoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocalizacoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocalizacoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocalizacoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocalizacoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocalizacoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocalizacoesRecordData({
  int? idLocalizacao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_localizacao': idLocalizacao,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocalizacoesRecordDocumentEquality
    implements Equality<LocalizacoesRecord> {
  const LocalizacoesRecordDocumentEquality();

  @override
  bool equals(LocalizacoesRecord? e1, LocalizacoesRecord? e2) {
    return e1?.idLocalizacao == e2?.idLocalizacao;
  }

  @override
  int hash(LocalizacoesRecord? e) =>
      const ListEquality().hash([e?.idLocalizacao]);

  @override
  bool isValidKey(Object? o) => o is LocalizacoesRecord;
}
