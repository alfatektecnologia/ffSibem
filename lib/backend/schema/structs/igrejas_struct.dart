// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IgrejasStruct extends FFFirebaseStruct {
  IgrejasStruct({
    int? idIgreja,
    String? igreja,
    String? endereco,
    String? idSetor,
    int? situacao,
    String? foto,
    String? lastInventario,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _idIgreja = idIgreja,
        _igreja = igreja,
        _endereco = endereco,
        _idSetor = idSetor,
        _situacao = situacao,
        _foto = foto,
        _lastInventario = lastInventario,
        super(firestoreUtilData);

  // "id_igreja" field.
  int? _idIgreja;
  int get idIgreja => _idIgreja ?? 0;
  set idIgreja(int? val) => _idIgreja = val;
  void incrementIdIgreja(int amount) => _idIgreja = idIgreja + amount;
  bool hasIdIgreja() => _idIgreja != null;

  // "igreja" field.
  String? _igreja;
  String get igreja => _igreja ?? '';
  set igreja(String? val) => _igreja = val;
  bool hasIgreja() => _igreja != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  set endereco(String? val) => _endereco = val;
  bool hasEndereco() => _endereco != null;

  // "id_setor" field.
  String? _idSetor;
  String get idSetor => _idSetor ?? '';
  set idSetor(String? val) => _idSetor = val;
  bool hasIdSetor() => _idSetor != null;

  // "situacao" field.
  int? _situacao;
  int get situacao => _situacao ?? 0;
  set situacao(int? val) => _situacao = val;
  void incrementSituacao(int amount) => _situacao = situacao + amount;
  bool hasSituacao() => _situacao != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  set foto(String? val) => _foto = val;
  bool hasFoto() => _foto != null;

  // "last_inventario" field.
  String? _lastInventario;
  String get lastInventario => _lastInventario ?? '';
  set lastInventario(String? val) => _lastInventario = val;
  bool hasLastInventario() => _lastInventario != null;

  static IgrejasStruct fromMap(Map<String, dynamic> data) => IgrejasStruct(
        idIgreja: castToType<int>(data['id_igreja']),
        igreja: data['igreja'] as String?,
        endereco: data['endereco'] as String?,
        idSetor: data['id_setor'] as String?,
        situacao: castToType<int>(data['situacao']),
        foto: data['foto'] as String?,
        lastInventario: data['last_inventario'] as String?,
      );

  static IgrejasStruct? maybeFromMap(dynamic data) =>
      data is Map ? IgrejasStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id_igreja': _idIgreja,
        'igreja': _igreja,
        'endereco': _endereco,
        'id_setor': _idSetor,
        'situacao': _situacao,
        'foto': _foto,
        'last_inventario': _lastInventario,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id_igreja': serializeParam(
          _idIgreja,
          ParamType.int,
        ),
        'igreja': serializeParam(
          _igreja,
          ParamType.String,
        ),
        'endereco': serializeParam(
          _endereco,
          ParamType.String,
        ),
        'id_setor': serializeParam(
          _idSetor,
          ParamType.String,
        ),
        'situacao': serializeParam(
          _situacao,
          ParamType.int,
        ),
        'foto': serializeParam(
          _foto,
          ParamType.String,
        ),
        'last_inventario': serializeParam(
          _lastInventario,
          ParamType.String,
        ),
      }.withoutNulls;

  static IgrejasStruct fromSerializableMap(Map<String, dynamic> data) =>
      IgrejasStruct(
        idIgreja: deserializeParam(
          data['id_igreja'],
          ParamType.int,
          false,
        ),
        igreja: deserializeParam(
          data['igreja'],
          ParamType.String,
          false,
        ),
        endereco: deserializeParam(
          data['endereco'],
          ParamType.String,
          false,
        ),
        idSetor: deserializeParam(
          data['id_setor'],
          ParamType.String,
          false,
        ),
        situacao: deserializeParam(
          data['situacao'],
          ParamType.int,
          false,
        ),
        foto: deserializeParam(
          data['foto'],
          ParamType.String,
          false,
        ),
        lastInventario: deserializeParam(
          data['last_inventario'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'IgrejasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IgrejasStruct &&
        idIgreja == other.idIgreja &&
        igreja == other.igreja &&
        endereco == other.endereco &&
        idSetor == other.idSetor &&
        situacao == other.situacao &&
        foto == other.foto &&
        lastInventario == other.lastInventario;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [idIgreja, igreja, endereco, idSetor, situacao, foto, lastInventario]);
}

IgrejasStruct createIgrejasStruct({
  int? idIgreja,
  String? igreja,
  String? endereco,
  String? idSetor,
  int? situacao,
  String? foto,
  String? lastInventario,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IgrejasStruct(
      idIgreja: idIgreja,
      igreja: igreja,
      endereco: endereco,
      idSetor: idSetor,
      situacao: situacao,
      foto: foto,
      lastInventario: lastInventario,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IgrejasStruct? updateIgrejasStruct(
  IgrejasStruct? igrejas, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    igrejas
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIgrejasStructData(
  Map<String, dynamic> firestoreData,
  IgrejasStruct? igrejas,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (igrejas == null) {
    return;
  }
  if (igrejas.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && igrejas.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final igrejasData = getIgrejasFirestoreData(igrejas, forFieldValue);
  final nestedData = igrejasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = igrejas.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIgrejasFirestoreData(
  IgrejasStruct? igrejas, [
  bool forFieldValue = false,
]) {
  if (igrejas == null) {
    return {};
  }
  final firestoreData = mapToFirestore(igrejas.toMap());

  // Add any Firestore field values
  igrejas.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIgrejasListFirestoreData(
  List<IgrejasStruct>? igrejass,
) =>
    igrejass?.map((e) => getIgrejasFirestoreData(e, true)).toList() ?? [];
