import '/flutter_flow/flutter_flow_util.dart';
import 'detalhes_igreja_widget.dart' show DetalhesIgrejaWidget;
import 'package:flutter/material.dart';

class DetalhesIgrejaModel extends FlutterFlowModel<DetalhesIgrejaWidget> {
  ///  Local state fields for this page.

  String? igrejaAddress;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CheckboxInventario widget.
  bool? checkboxInventarioValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
