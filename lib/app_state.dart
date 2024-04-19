import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _igrejaId = await secureStorage.getInt('ff_igrejaId') ?? _igrejaId;
    });
    await _safeInitAsync(() async {
      _usuarioId = await secureStorage.getInt('ff_usuarioId') ?? _usuarioId;
    });
    await _safeInitAsync(() async {
      _listImprimirEtiquetas =
          (await secureStorage.getStringList('ff_listImprimirEtiquetas'))
                  ?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _listImprimirEtiquetas;
    });
    await _safeInitAsync(() async {
      _listExcluirEtiquetas =
          (await secureStorage.getStringList('ff_listExcluirEtiquetas'))
                  ?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _listExcluirEtiquetas;
    });
    await _safeInitAsync(() async {
      _ListaIgrejas = (await secureStorage.getStringList('ff_ListaIgrejas'))
              ?.map((x) {
                try {
                  return IgrejasStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _ListaIgrejas;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  int _igrejaId = 0;
  int get igrejaId => _igrejaId;
  set igrejaId(int value) {
    _igrejaId = value;
    secureStorage.setInt('ff_igrejaId', value);
  }

  void deleteIgrejaId() {
    secureStorage.delete(key: 'ff_igrejaId');
  }

  List<DocumentReference> _BensListByIgrejaId = [];
  List<DocumentReference> get BensListByIgrejaId => _BensListByIgrejaId;
  set BensListByIgrejaId(List<DocumentReference> value) {
    _BensListByIgrejaId = value;
  }

  void addToBensListByIgrejaId(DocumentReference value) {
    _BensListByIgrejaId.add(value);
  }

  void removeFromBensListByIgrejaId(DocumentReference value) {
    _BensListByIgrejaId.remove(value);
  }

  void removeAtIndexFromBensListByIgrejaId(int index) {
    _BensListByIgrejaId.removeAt(index);
  }

  void updateBensListByIgrejaIdAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _BensListByIgrejaId[index] = updateFn(_BensListByIgrejaId[index]);
  }

  void insertAtIndexInBensListByIgrejaId(int index, DocumentReference value) {
    _BensListByIgrejaId.insert(index, value);
  }

  int _inventarioNumber = 0;
  int get inventarioNumber => _inventarioNumber;
  set inventarioNumber(int value) {
    _inventarioNumber = value;
  }

  List<DocumentReference> _ListaBensByIgrejaId = [];
  List<DocumentReference> get ListaBensByIgrejaId => _ListaBensByIgrejaId;
  set ListaBensByIgrejaId(List<DocumentReference> value) {
    _ListaBensByIgrejaId = value;
  }

  void addToListaBensByIgrejaId(DocumentReference value) {
    _ListaBensByIgrejaId.add(value);
  }

  void removeFromListaBensByIgrejaId(DocumentReference value) {
    _ListaBensByIgrejaId.remove(value);
  }

  void removeAtIndexFromListaBensByIgrejaId(int index) {
    _ListaBensByIgrejaId.removeAt(index);
  }

  void updateListaBensByIgrejaIdAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _ListaBensByIgrejaId[index] = updateFn(_ListaBensByIgrejaId[index]);
  }

  void insertAtIndexInListaBensByIgrejaId(
      int index, DocumentReference value) {
    _ListaBensByIgrejaId.insert(index, value);
  }

  String _userEmail = '';
  String get userEmail => _userEmail;
  set userEmail(String value) {
    _userEmail = value;
  }

  DateTime? _dataInventario;
  DateTime? get dataInventario => _dataInventario;
  set dataInventario(DateTime? value) {
    _dataInventario = value;
  }

  DateTime? _inicioInventario;
  DateTime? get inicioInventario => _inicioInventario;
  set inicioInventario(DateTime? value) {
    _inicioInventario = value;
  }

  int _totalBens = 0;
  int get totalBens => _totalBens;
  set totalBens(int value) {
    _totalBens = value;
  }

  int _inventarioId = 0;
  int get inventarioId => _inventarioId;
  set inventarioId(int value) {
    _inventarioId = value;
  }

  List<int> _imprimirEtiquetas = [];
  List<int> get imprimirEtiquetas => _imprimirEtiquetas;
  set imprimirEtiquetas(List<int> value) {
    _imprimirEtiquetas = value;
  }

  void addToImprimirEtiquetas(int value) {
    _imprimirEtiquetas.add(value);
  }

  void removeFromImprimirEtiquetas(int value) {
    _imprimirEtiquetas.remove(value);
  }

  void removeAtIndexFromImprimirEtiquetas(int index) {
    _imprimirEtiquetas.removeAt(index);
  }

  void updateImprimirEtiquetasAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _imprimirEtiquetas[index] = updateFn(_imprimirEtiquetas[index]);
  }

  void insertAtIndexInImprimirEtiquetas(int index, int value) {
    _imprimirEtiquetas.insert(index, value);
  }

  DateTime? _terminoInventario;
  DateTime? get terminoInventario => _terminoInventario;
  set terminoInventario(DateTime? value) {
    _terminoInventario = value;
  }

  String _pdfSaved = '';
  String get pdfSaved => _pdfSaved;
  set pdfSaved(String value) {
    _pdfSaved = value;
  }

  String _storagePath = '';
  String get storagePath => _storagePath;
  set storagePath(String value) {
    _storagePath = value;
  }

  String _localPathStorage = '';
  String get localPathStorage => _localPathStorage;
  set localPathStorage(String value) {
    _localPathStorage = value;
  }

  int _usuarioId = 0;
  int get usuarioId => _usuarioId;
  set usuarioId(int value) {
    _usuarioId = value;
    secureStorage.setInt('ff_usuarioId', value);
  }

  void deleteUsuarioId() {
    secureStorage.delete(key: 'ff_usuarioId');
  }

  String _imageLogo = '';
  String get imageLogo => _imageLogo;
  set imageLogo(String value) {
    _imageLogo = value;
  }

  bool _isAdmin = false;
  bool get isAdmin => _isAdmin;
  set isAdmin(bool value) {
    _isAdmin = value;
  }

  String _inventariantes = '';
  String get inventariantes => _inventariantes;
  set inventariantes(String value) {
    _inventariantes = value;
  }

  String _responsaveis = '';
  String get responsaveis => _responsaveis;
  set responsaveis(String value) {
    _responsaveis = value;
  }

  List<DocumentReference> _excluirEtiquetas = [];
  List<DocumentReference> get excluirEtiquetas => _excluirEtiquetas;
  set excluirEtiquetas(List<DocumentReference> value) {
    _excluirEtiquetas = value;
  }

  void addToExcluirEtiquetas(DocumentReference value) {
    _excluirEtiquetas.add(value);
  }

  void removeFromExcluirEtiquetas(DocumentReference value) {
    _excluirEtiquetas.remove(value);
  }

  void removeAtIndexFromExcluirEtiquetas(int index) {
    _excluirEtiquetas.removeAt(index);
  }

  void updateExcluirEtiquetasAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _excluirEtiquetas[index] = updateFn(_excluirEtiquetas[index]);
  }

  void insertAtIndexInExcluirEtiquetas(int index, DocumentReference value) {
    _excluirEtiquetas.insert(index, value);
  }

  DateTime? _duracaoInventario;
  DateTime? get duracaoInventario => _duracaoInventario;
  set duracaoInventario(DateTime? value) {
    _duracaoInventario = value;
  }

  int _numeroInventario = 0;
  int get numeroInventario => _numeroInventario;
  set numeroInventario(int value) {
    _numeroInventario = value;
  }

  List<dynamic> _listImprimirEtiquetas = [];
  List<dynamic> get listImprimirEtiquetas => _listImprimirEtiquetas;
  set listImprimirEtiquetas(List<dynamic> value) {
    _listImprimirEtiquetas = value;
    secureStorage.setStringList(
        'ff_listImprimirEtiquetas', value.map((x) => jsonEncode(x)).toList());
  }

  void deleteListImprimirEtiquetas() {
    secureStorage.delete(key: 'ff_listImprimirEtiquetas');
  }

  void addToListImprimirEtiquetas(dynamic value) {
    _listImprimirEtiquetas.add(value);
    secureStorage.setStringList('ff_listImprimirEtiquetas',
        _listImprimirEtiquetas.map((x) => jsonEncode(x)).toList());
  }

  void removeFromListImprimirEtiquetas(dynamic value) {
    _listImprimirEtiquetas.remove(value);
    secureStorage.setStringList('ff_listImprimirEtiquetas',
        _listImprimirEtiquetas.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromListImprimirEtiquetas(int index) {
    _listImprimirEtiquetas.removeAt(index);
    secureStorage.setStringList('ff_listImprimirEtiquetas',
        _listImprimirEtiquetas.map((x) => jsonEncode(x)).toList());
  }

  void updateListImprimirEtiquetasAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _listImprimirEtiquetas[index] = updateFn(_listImprimirEtiquetas[index]);
    secureStorage.setStringList('ff_listImprimirEtiquetas',
        _listImprimirEtiquetas.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInListImprimirEtiquetas(int index, dynamic value) {
    _listImprimirEtiquetas.insert(index, value);
    secureStorage.setStringList('ff_listImprimirEtiquetas',
        _listImprimirEtiquetas.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _listExcluirEtiquetas = [];
  List<dynamic> get listExcluirEtiquetas => _listExcluirEtiquetas;
  set listExcluirEtiquetas(List<dynamic> value) {
    _listExcluirEtiquetas = value;
    secureStorage.setStringList(
        'ff_listExcluirEtiquetas', value.map((x) => jsonEncode(x)).toList());
  }

  void deleteListExcluirEtiquetas() {
    secureStorage.delete(key: 'ff_listExcluirEtiquetas');
  }

  void addToListExcluirEtiquetas(dynamic value) {
    _listExcluirEtiquetas.add(value);
    secureStorage.setStringList('ff_listExcluirEtiquetas',
        _listExcluirEtiquetas.map((x) => jsonEncode(x)).toList());
  }

  void removeFromListExcluirEtiquetas(dynamic value) {
    _listExcluirEtiquetas.remove(value);
    secureStorage.setStringList('ff_listExcluirEtiquetas',
        _listExcluirEtiquetas.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromListExcluirEtiquetas(int index) {
    _listExcluirEtiquetas.removeAt(index);
    secureStorage.setStringList('ff_listExcluirEtiquetas',
        _listExcluirEtiquetas.map((x) => jsonEncode(x)).toList());
  }

  void updateListExcluirEtiquetasAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _listExcluirEtiquetas[index] = updateFn(_listExcluirEtiquetas[index]);
    secureStorage.setStringList('ff_listExcluirEtiquetas',
        _listExcluirEtiquetas.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInListExcluirEtiquetas(int index, dynamic value) {
    _listExcluirEtiquetas.insert(index, value);
    secureStorage.setStringList('ff_listExcluirEtiquetas',
        _listExcluirEtiquetas.map((x) => jsonEncode(x)).toList());
  }

  String _enderecoInventario = '';
  String get enderecoInventario => _enderecoInventario;
  set enderecoInventario(String value) {
    _enderecoInventario = value;
  }

  bool _hasInternet = false;
  bool get hasInternet => _hasInternet;
  set hasInternet(bool value) {
    _hasInternet = value;
  }

  bool _hasInventario = false;
  bool get hasInventario => _hasInventario;
  set hasInventario(bool value) {
    _hasInventario = value;
  }

  List<DocumentReference> _readedList = [];
  List<DocumentReference> get readedList => _readedList;
  set readedList(List<DocumentReference> value) {
    _readedList = value;
  }

  void addToReadedList(DocumentReference value) {
    _readedList.add(value);
  }

  void removeFromReadedList(DocumentReference value) {
    _readedList.remove(value);
  }

  void removeAtIndexFromReadedList(int index) {
    _readedList.removeAt(index);
  }

  void updateReadedListAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _readedList[index] = updateFn(_readedList[index]);
  }

  void insertAtIndexInReadedList(int index, DocumentReference value) {
    _readedList.insert(index, value);
  }

  List<DocumentReference> _bensListUpdated = [];
  List<DocumentReference> get bensListUpdated => _bensListUpdated;
  set bensListUpdated(List<DocumentReference> value) {
    _bensListUpdated = value;
  }

  void addToBensListUpdated(DocumentReference value) {
    _bensListUpdated.add(value);
  }

  void removeFromBensListUpdated(DocumentReference value) {
    _bensListUpdated.remove(value);
  }

  void removeAtIndexFromBensListUpdated(int index) {
    _bensListUpdated.removeAt(index);
  }

  void updateBensListUpdatedAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _bensListUpdated[index] = updateFn(_bensListUpdated[index]);
  }

  void insertAtIndexInBensListUpdated(int index, DocumentReference value) {
    _bensListUpdated.insert(index, value);
  }

  bool _saveInventario = true;
  bool get saveInventario => _saveInventario;
  set saveInventario(bool value) {
    _saveInventario = value;
  }

  bool _loopLeitor = true;
  bool get loopLeitor => _loopLeitor;
  set loopLeitor(bool value) {
    _loopLeitor = value;
  }

  List<IgrejasStruct> _ListaIgrejas = [];
  List<IgrejasStruct> get ListaIgrejas => _ListaIgrejas;
  set ListaIgrejas(List<IgrejasStruct> value) {
    _ListaIgrejas = value;
    secureStorage.setStringList(
        'ff_ListaIgrejas', value.map((x) => x.serialize()).toList());
  }

  void deleteListaIgrejas() {
    secureStorage.delete(key: 'ff_ListaIgrejas');
  }

  void addToListaIgrejas(IgrejasStruct value) {
    _ListaIgrejas.add(value);
    secureStorage.setStringList(
        'ff_ListaIgrejas', _ListaIgrejas.map((x) => x.serialize()).toList());
  }

  void removeFromListaIgrejas(IgrejasStruct value) {
    _ListaIgrejas.remove(value);
    secureStorage.setStringList(
        'ff_ListaIgrejas', _ListaIgrejas.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListaIgrejas(int index) {
    _ListaIgrejas.removeAt(index);
    secureStorage.setStringList(
        'ff_ListaIgrejas', _ListaIgrejas.map((x) => x.serialize()).toList());
  }

  void updateListaIgrejasAtIndex(
    int index,
    IgrejasStruct Function(IgrejasStruct) updateFn,
  ) {
    _ListaIgrejas[index] = updateFn(_ListaIgrejas[index]);
    secureStorage.setStringList(
        'ff_ListaIgrejas', _ListaIgrejas.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListaIgrejas(int index, IgrejasStruct value) {
    _ListaIgrejas.insert(index, value);
    secureStorage.setStringList(
        'ff_ListaIgrejas', _ListaIgrejas.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
