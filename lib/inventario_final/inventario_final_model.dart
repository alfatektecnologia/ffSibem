import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'inventario_final_widget.dart' show InventarioFinalWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class InventarioFinalModel extends FlutterFlowModel<InventarioFinalWidget> {
  ///  Local state fields for this page.

  int? userId;

  DateTime? horaAtual;

  String? tempoDuracaoInventario;

  bool pdfGenerated = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in InventarioFinal widget.
  IgrejasRecord? igrejaDocumentById;
  // State field(s) for et_total_bens widget.
  FocusNode? etTotalBensFocusNode;
  TextEditingController? etTotalBensTextController;
  String? Function(BuildContext, String?)? etTotalBensTextControllerValidator;
  // State field(s) for et_data widget.
  FocusNode? etDataFocusNode1;
  TextEditingController? etDataTextController1;
  String? Function(BuildContext, String?)? etDataTextController1Validator;
  // State field(s) for et_igrejaId widget.
  FocusNode? etIgrejaIdFocusNode;
  TextEditingController? etIgrejaIdTextController;
  String? Function(BuildContext, String?)? etIgrejaIdTextControllerValidator;
  // State field(s) for et_data widget.
  FocusNode? etDataFocusNode2;
  TextEditingController? etDataTextController2;
  String? Function(BuildContext, String?)? etDataTextController2Validator;
  // State field(s) for et_inicio_inventario widget.
  FocusNode? etInicioInventarioFocusNode;
  TextEditingController? etInicioInventarioTextController;
  String? Function(BuildContext, String?)?
      etInicioInventarioTextControllerValidator;
  // State field(s) for et_termino_inventario widget.
  FocusNode? etTerminoInventarioFocusNode;
  TextEditingController? etTerminoInventarioTextController;
  String? Function(BuildContext, String?)?
      etTerminoInventarioTextControllerValidator;
  // State field(s) for Ed_inventariantes widget.
  FocusNode? edInventariantesFocusNode;
  TextEditingController? edInventariantesTextController;
  String? Function(BuildContext, String?)?
      edInventariantesTextControllerValidator;
  // State field(s) for Ed_responsaveis widget.
  FocusNode? edResponsaveisFocusNode;
  TextEditingController? edResponsaveisTextController;
  String? Function(BuildContext, String?)?
      edResponsaveisTextControllerValidator;
  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, ExcluirEtiquetasRecord>?
      gridViewPagingController1;
  Query? gridViewPagingQuery1;
  List<StreamSubscription?> gridViewStreamSubscriptions1 = [];

  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, ImprimirEtiquetasRecord>?
      gridViewPagingController2;
  Query? gridViewPagingQuery2;
  List<StreamSubscription?> gridViewStreamSubscriptions2 = [];

  // State field(s) for et_cadastrar_etiqueta widget.
  FocusNode? etCadastrarEtiquetaFocusNode;
  TextEditingController? etCadastrarEtiquetaTextController;
  String? Function(BuildContext, String?)?
      etCadastrarEtiquetaTextControllerValidator;
  // State field(s) for et_cadastrar_localizacao widget.
  FocusNode? etCadastrarLocalizacaoFocusNode;
  TextEditingController? etCadastrarLocalizacaoTextController;
  String? Function(BuildContext, String?)?
      etCadastrarLocalizacaoTextControllerValidator;
  // State field(s) for et_cadastrar_descricao widget.
  FocusNode? etCadastrarDescricaoFocusNode;
  TextEditingController? etCadastrarDescricaoTextController;
  String? Function(BuildContext, String?)?
      etCadastrarDescricaoTextControllerValidator;
  // State field(s) for et_cadastrar_observacao widget.
  FocusNode? etCadastrarObservacaoFocusNode;
  TextEditingController? etCadastrarObservacaoTextController;
  String? Function(BuildContext, String?)?
      etCadastrarObservacaoTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    etTotalBensFocusNode?.dispose();
    etTotalBensTextController?.dispose();

    etDataFocusNode1?.dispose();
    etDataTextController1?.dispose();

    etIgrejaIdFocusNode?.dispose();
    etIgrejaIdTextController?.dispose();

    etDataFocusNode2?.dispose();
    etDataTextController2?.dispose();

    etInicioInventarioFocusNode?.dispose();
    etInicioInventarioTextController?.dispose();

    etTerminoInventarioFocusNode?.dispose();
    etTerminoInventarioTextController?.dispose();

    edInventariantesFocusNode?.dispose();
    edInventariantesTextController?.dispose();

    edResponsaveisFocusNode?.dispose();
    edResponsaveisTextController?.dispose();

    for (var s in gridViewStreamSubscriptions1) {
      s?.cancel();
    }
    gridViewPagingController1?.dispose();

    for (var s in gridViewStreamSubscriptions2) {
      s?.cancel();
    }
    gridViewPagingController2?.dispose();

    etCadastrarEtiquetaFocusNode?.dispose();
    etCadastrarEtiquetaTextController?.dispose();

    etCadastrarLocalizacaoFocusNode?.dispose();
    etCadastrarLocalizacaoTextController?.dispose();

    etCadastrarDescricaoFocusNode?.dispose();
    etCadastrarDescricaoTextController?.dispose();

    etCadastrarObservacaoFocusNode?.dispose();
    etCadastrarObservacaoTextController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, ExcluirEtiquetasRecord>
      setGridViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController1 ??= _createGridViewController1(query, parent);
    if (gridViewPagingQuery1 != query) {
      gridViewPagingQuery1 = query;
      gridViewPagingController1?.refresh();
    }
    return gridViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, ExcluirEtiquetasRecord>
      _createGridViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ExcluirEtiquetasRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryExcluirEtiquetasRecordPage(
          queryBuilder: (_) => gridViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions1,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ImprimirEtiquetasRecord>
      setGridViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController2 ??= _createGridViewController2(query, parent);
    if (gridViewPagingQuery2 != query) {
      gridViewPagingQuery2 = query;
      gridViewPagingController2?.refresh();
    }
    return gridViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, ImprimirEtiquetasRecord>
      _createGridViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ImprimirEtiquetasRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryImprimirEtiquetasRecordPage(
          queryBuilder: (_) => gridViewPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions2,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
