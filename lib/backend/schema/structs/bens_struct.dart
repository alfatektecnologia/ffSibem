// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BensStruct extends FFFirebaseStruct {
  BensStruct({
    int? idBem,
    int? idIgreja,
    String? descricao,
    String? dependencia,
    String? observacao,
    int? situacao,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _idBem = idBem,
        _idIgreja = idIgreja,
        _descricao = descricao,
        _dependencia = dependencia,
        _observacao = observacao,
        _situacao = situacao,
        super(firestoreUtilData);

  // "id_bem" field.
  int? _idBem;
  int get idBem => _idBem ?? 0;
  set idBem(int? val) => _idBem = val;
  void incrementIdBem(int amount) => _idBem = idBem + amount;
  bool hasIdBem() => _idBem != null;

  // "id_igreja" field.
  int? _idIgreja;
  int get idIgreja => _idIgreja ?? 0;
  set idIgreja(int? val) => _idIgreja = val;
  void incrementIdIgreja(int amount) => _idIgreja = idIgreja + amount;
  bool hasIdIgreja() => _idIgreja != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  set descricao(String? val) => _descricao = val;
  bool hasDescricao() => _descricao != null;

  // "dependencia" field.
  String? _dependencia;
  String get dependencia => _dependencia ?? '';
  set dependencia(String? val) => _dependencia = val;
  bool hasDependencia() => _dependencia != null;

  // "observacao" field.
  String? _observacao;
  String get observacao => _observacao ?? '';
  set observacao(String? val) => _observacao = val;
  bool hasObservacao() => _observacao != null;

  // "situacao" field.
  int? _situacao;
  int get situacao => _situacao ?? 1;
  set situacao(int? val) => _situacao = val;
  void incrementSituacao(int amount) => _situacao = situacao + amount;
  bool hasSituacao() => _situacao != null;

  static BensStruct fromMap(Map<String, dynamic> data) => BensStruct(
        idBem: castToType<int>(data['id_bem']),
        idIgreja: castToType<int>(data['id_igreja']),
        descricao: data['descricao'] as String?,
        dependencia: data['dependencia'] as String?,
        observacao: data['observacao'] as String?,
        situacao: castToType<int>(data['situacao']),
      );

  static BensStruct? maybeFromMap(dynamic data) =>
      data is Map ? BensStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id_bem': _idBem,
        'id_igreja': _idIgreja,
        'descricao': _descricao,
        'dependencia': _dependencia,
        'observacao': _observacao,
        'situacao': _situacao,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id_bem': serializeParam(
          _idBem,
          ParamType.int,
        ),
        'id_igreja': serializeParam(
          _idIgreja,
          ParamType.int,
        ),
        'descricao': serializeParam(
          _descricao,
          ParamType.String,
        ),
        'dependencia': serializeParam(
          _dependencia,
          ParamType.String,
        ),
        'observacao': serializeParam(
          _observacao,
          ParamType.String,
        ),
        'situacao': serializeParam(
          _situacao,
          ParamType.int,
        ),
      }.withoutNulls;

  static BensStruct fromSerializableMap(Map<String, dynamic> data) =>
      BensStruct(
        idBem: deserializeParam(
          data['id_bem'],
          ParamType.int,
          false,
        ),
        idIgreja: deserializeParam(
          data['id_igreja'],
          ParamType.int,
          false,
        ),
        descricao: deserializeParam(
          data['descricao'],
          ParamType.String,
          false,
        ),
        dependencia: deserializeParam(
          data['dependencia'],
          ParamType.String,
          false,
        ),
        observacao: deserializeParam(
          data['observacao'],
          ParamType.String,
          false,
        ),
        situacao: deserializeParam(
          data['situacao'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'BensStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BensStruct &&
        idBem == other.idBem &&
        idIgreja == other.idIgreja &&
        descricao == other.descricao &&
        dependencia == other.dependencia &&
        observacao == other.observacao &&
        situacao == other.situacao;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([idBem, idIgreja, descricao, dependencia, observacao, situacao]);
}

BensStruct createBensStruct({
  int? idBem,
  int? idIgreja,
  String? descricao,
  String? dependencia,
  String? observacao,
  int? situacao,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BensStruct(
      idBem: idBem,
      idIgreja: idIgreja,
      descricao: descricao,
      dependencia: dependencia,
      observacao: observacao,
      situacao: situacao,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BensStruct? updateBensStruct(
  BensStruct? bens, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bens
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBensStructData(
  Map<String, dynamic> firestoreData,
  BensStruct? bens,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bens == null) {
    return;
  }
  if (bens.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && bens.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bensData = getBensFirestoreData(bens, forFieldValue);
  final nestedData = bensData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bens.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBensFirestoreData(
  BensStruct? bens, [
  bool forFieldValue = false,
]) {
  if (bens == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bens.toMap());

  // Add any Firestore field values
  bens.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBensListFirestoreData(
  List<BensStruct>? benss,
) =>
    benss?.map((e) => getBensFirestoreData(e, true)).toList() ?? [];
