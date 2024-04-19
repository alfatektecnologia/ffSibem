import '/flutter_flow/flutter_flow_util.dart';
import 'etiquetas_dialog_widget.dart' show EtiquetasDialogWidget;
import 'package:flutter/material.dart';

class EtiquetasDialogModel extends FlutterFlowModel<EtiquetasDialogWidget> {
  ///  Local state fields for this component.

  bool etiquetaDialogCanceled = false;

  bool itemToExcludeSaved = false;

  bool itemToPrintSaved = false;

  bool itemReaded = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for txt_obs_dialog widget.
  FocusNode? txtObsDialogFocusNode;
  TextEditingController? txtObsDialogTextController;
  String? Function(BuildContext, String?)? txtObsDialogTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtObsDialogFocusNode?.dispose();
    txtObsDialogTextController?.dispose();
  }
}
