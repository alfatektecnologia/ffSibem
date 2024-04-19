import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'visualizar_p_d_f_widget.dart' show VisualizarPDFWidget;
import 'package:flutter/material.dart';

class VisualizarPDFModel extends FlutterFlowModel<VisualizarPDFWidget> {
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
