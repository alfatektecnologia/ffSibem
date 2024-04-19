// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InventarioStruct extends FFFirebaseStruct {
  InventarioStruct({
    int? bens,
    DateTime? data,
    int? idIgreja,
    int? idInventario,
    DateTime? inicio,
    String? inventariante,
    String? responsaveis,
    String? status,
    DateTime? tempo,
    DateTime? termino,
    String? pdf,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _bens = bens,
        _data = data,
        _idIgreja = idIgreja,
        _idInventario = idInventario,
        _inicio = inicio,
        _inventariante = inventariante,
        _responsaveis = responsaveis,
        _status = status,
        _tempo = tempo,
        _termino = termino,
        _pdf = pdf,
        super(firestoreUtilData);

  // "bens" field.
  int? _bens;
  int get bens => _bens ?? 0;
  set bens(int? val) => _bens = val;
  void incrementBens(int amount) => _bens = bens + amount;
  bool hasBens() => _bens != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  set data(DateTime? val) => _data = val;
  bool hasData() => _data != null;

  // "id_igreja" field.
  int? _idIgreja;
  int get idIgreja => _idIgreja ?? 0;
  set idIgreja(int? val) => _idIgreja = val;
  void incrementIdIgreja(int amount) => _idIgreja = idIgreja + amount;
  bool hasIdIgreja() => _idIgreja != null;

  // "id_inventario" field.
  int? _idInventario;
  int get idInventario => _idInventario ?? 0;
  set idInventario(int? val) => _idInventario = val;
  void incrementIdInventario(int amount) =>
      _idInventario = idInventario + amount;
  bool hasIdInventario() => _idInventario != null;

  // "inicio" field.
  DateTime? _inicio;
  DateTime? get inicio => _inicio;
  set inicio(DateTime? val) => _inicio = val;
  bool hasInicio() => _inicio != null;

  // "inventariante" field.
  String? _inventariante;
  String get inventariante => _inventariante ?? '';
  set inventariante(String? val) => _inventariante = val;
  bool hasInventariante() => _inventariante != null;

  // "responsaveis" field.
  String? _responsaveis;
  String get responsaveis => _responsaveis ?? '';
  set responsaveis(String? val) => _responsaveis = val;
  bool hasResponsaveis() => _responsaveis != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "tempo" field.
  DateTime? _tempo;
  DateTime? get tempo => _tempo;
  set tempo(DateTime? val) => _tempo = val;
  bool hasTempo() => _tempo != null;

  // "termino" field.
  DateTime? _termino;
  DateTime? get termino => _termino;
  set termino(DateTime? val) => _termino = val;
  bool hasTermino() => _termino != null;

  // "pdf" field.
  String? _pdf;
  String get pdf => _pdf ?? '';
  set pdf(String? val) => _pdf = val;
  bool hasPdf() => _pdf != null;

  static InventarioStruct fromMap(Map<String, dynamic> data) =>
      InventarioStruct(
        bens: castToType<int>(data['bens']),
        data: data['data'] as DateTime?,
        idIgreja: castToType<int>(data['id_igreja']),
        idInventario: castToType<int>(data['id_inventario']),
        inicio: data['inicio'] as DateTime?,
        inventariante: data['inventariante'] as String?,
        responsaveis: data['responsaveis'] as String?,
        status: data['status'] as String?,
        tempo: data['tempo'] as DateTime?,
        termino: data['termino'] as DateTime?,
        pdf: data['pdf'] as String?,
      );

  static InventarioStruct? maybeFromMap(dynamic data) => data is Map
      ? InventarioStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'bens': _bens,
        'data': _data,
        'id_igreja': _idIgreja,
        'id_inventario': _idInventario,
        'inicio': _inicio,
        'inventariante': _inventariante,
        'responsaveis': _responsaveis,
        'status': _status,
        'tempo': _tempo,
        'termino': _termino,
        'pdf': _pdf,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bens': serializeParam(
          _bens,
          ParamType.int,
        ),
        'data': serializeParam(
          _data,
          ParamType.DateTime,
        ),
        'id_igreja': serializeParam(
          _idIgreja,
          ParamType.int,
        ),
        'id_inventario': serializeParam(
          _idInventario,
          ParamType.int,
        ),
        'inicio': serializeParam(
          _inicio,
          ParamType.DateTime,
        ),
        'inventariante': serializeParam(
          _inventariante,
          ParamType.String,
        ),
        'responsaveis': serializeParam(
          _responsaveis,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'tempo': serializeParam(
          _tempo,
          ParamType.DateTime,
        ),
        'termino': serializeParam(
          _termino,
          ParamType.DateTime,
        ),
        'pdf': serializeParam(
          _pdf,
          ParamType.String,
        ),
      }.withoutNulls;

  static InventarioStruct fromSerializableMap(Map<String, dynamic> data) =>
      InventarioStruct(
        bens: deserializeParam(
          data['bens'],
          ParamType.int,
          false,
        ),
        data: deserializeParam(
          data['data'],
          ParamType.DateTime,
          false,
        ),
        idIgreja: deserializeParam(
          data['id_igreja'],
          ParamType.int,
          false,
        ),
        idInventario: deserializeParam(
          data['id_inventario'],
          ParamType.int,
          false,
        ),
        inicio: deserializeParam(
          data['inicio'],
          ParamType.DateTime,
          false,
        ),
        inventariante: deserializeParam(
          data['inventariante'],
          ParamType.String,
          false,
        ),
        responsaveis: deserializeParam(
          data['responsaveis'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        tempo: deserializeParam(
          data['tempo'],
          ParamType.DateTime,
          false,
        ),
        termino: deserializeParam(
          data['termino'],
          ParamType.DateTime,
          false,
        ),
        pdf: deserializeParam(
          data['pdf'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'InventarioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InventarioStruct &&
        bens == other.bens &&
        data == other.data &&
        idIgreja == other.idIgreja &&
        idInventario == other.idInventario &&
        inicio == other.inicio &&
        inventariante == other.inventariante &&
        responsaveis == other.responsaveis &&
        status == other.status &&
        tempo == other.tempo &&
        termino == other.termino &&
        pdf == other.pdf;
  }

  @override
  int get hashCode => const ListEquality().hash([
        bens,
        data,
        idIgreja,
        idInventario,
        inicio,
        inventariante,
        responsaveis,
        status,
        tempo,
        termino,
        pdf
      ]);
}

InventarioStruct createInventarioStruct({
  int? bens,
  DateTime? data,
  int? idIgreja,
  int? idInventario,
  DateTime? inicio,
  String? inventariante,
  String? responsaveis,
  String? status,
  DateTime? tempo,
  DateTime? termino,
  String? pdf,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InventarioStruct(
      bens: bens,
      data: data,
      idIgreja: idIgreja,
      idInventario: idInventario,
      inicio: inicio,
      inventariante: inventariante,
      responsaveis: responsaveis,
      status: status,
      tempo: tempo,
      termino: termino,
      pdf: pdf,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InventarioStruct? updateInventarioStruct(
  InventarioStruct? inventario, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    inventario
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInventarioStructData(
  Map<String, dynamic> firestoreData,
  InventarioStruct? inventario,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (inventario == null) {
    return;
  }
  if (inventario.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && inventario.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final inventarioData = getInventarioFirestoreData(inventario, forFieldValue);
  final nestedData = inventarioData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = inventario.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInventarioFirestoreData(
  InventarioStruct? inventario, [
  bool forFieldValue = false,
]) {
  if (inventario == null) {
    return {};
  }
  final firestoreData = mapToFirestore(inventario.toMap());

  // Add any Firestore field values
  inventario.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInventarioListFirestoreData(
  List<InventarioStruct>? inventarios,
) =>
    inventarios?.map((e) => getInventarioFirestoreData(e, true)).toList() ?? [];
