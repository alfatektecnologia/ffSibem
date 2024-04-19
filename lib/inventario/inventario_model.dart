import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'inventario_widget.dart' show InventarioWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class InventarioModel extends FlutterFlowModel<InventarioWidget> {
  ///  Local state fields for this page.

  int? igrejaId;

  int? inventarioNumber;

  int? barcodeState;

  List<BensRecord> bensList = [];
  void addToBensList(BensRecord item) => bensList.add(item);
  void removeFromBensList(BensRecord item) => bensList.remove(item);
  void removeAtIndexFromBensList(int index) => bensList.removeAt(index);
  void insertAtIndexInBensList(int index, BensRecord item) =>
      bensList.insert(index, item);
  void updateBensListAtIndex(int index, Function(BensRecord) updateFn) =>
      bensList[index] = updateFn(bensList[index]);

  BensRecord? itemClicked;

  bool codeRead = false;

  bool? showEtiquetasLidas;

  List<BensRecord> readedList = [];
  void addToReadedList(BensRecord item) => readedList.add(item);
  void removeFromReadedList(BensRecord item) => readedList.remove(item);
  void removeAtIndexFromReadedList(int index) => readedList.removeAt(index);
  void insertAtIndexInReadedList(int index, BensRecord item) =>
      readedList.insert(index, item);
  void updateReadedListAtIndex(int index, Function(BensRecord) updateFn) =>
      readedList[index] = updateFn(readedList[index]);

  List<BensRecord> bensListUpdated = [];
  void addToBensListUpdated(BensRecord item) => bensListUpdated.add(item);
  void removeFromBensListUpdated(BensRecord item) =>
      bensListUpdated.remove(item);
  void removeAtIndexFromBensListUpdated(int index) =>
      bensListUpdated.removeAt(index);
  void insertAtIndexInBensListUpdated(int index, BensRecord item) =>
      bensListUpdated.insert(index, item);
  void updateBensListUpdatedAtIndex(int index, Function(BensRecord) updateFn) =>
      bensListUpdated[index] = updateFn(bensListUpdated[index]);

  List<BensRecord> listToShow = [];
  void addToListToShow(BensRecord item) => listToShow.add(item);
  void removeFromListToShow(BensRecord item) => listToShow.remove(item);
  void removeAtIndexFromListToShow(int index) => listToShow.removeAt(index);
  void insertAtIndexInListToShow(int index, BensRecord item) =>
      listToShow.insert(index, item);
  void updateListToShowAtIndex(int index, Function(BensRecord) updateFn) =>
      listToShow[index] = updateFn(listToShow[index]);

  List<BensRecord> resetFields = [];
  void addToResetFields(BensRecord item) => resetFields.add(item);
  void removeFromResetFields(BensRecord item) => resetFields.remove(item);
  void removeAtIndexFromResetFields(int index) => resetFields.removeAt(index);
  void insertAtIndexInResetFields(int index, BensRecord item) =>
      resetFields.insert(index, item);
  void updateResetFieldsAtIndex(int index, Function(BensRecord) updateFn) =>
      resetFields[index] = updateFn(resetFields[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Inventario widget.
  List<InventarioRecord>? listaInventarios;
  // Stores action output result for [Firestore Query - Query a collection] action in Inventario widget.
  List<BensRecord>? listaBensEmInventario;
  var barcodeValue2 = '';
  AudioPlayer? soundPlayer;
  // Stores action output result for [Firestore Query - Query a collection] action in bt_etiqueta_lida widget.
  BensRecord? scannedBemDocument;
  // State field(s) for chk_show_readed_etiquetas widget.
  bool? chkShowReadedEtiquetasValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
