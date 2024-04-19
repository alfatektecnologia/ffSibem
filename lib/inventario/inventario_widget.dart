import '/backend/backend.dart';
import '/components/alerta_dialog_inventario_widget.dart';
import '/components/alerta_dialog_widget.dart';
import '/components/etiquetas_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'inventario_model.dart';
export 'inventario_model.dart';

class InventarioWidget extends StatefulWidget {
  const InventarioWidget({
    super.key,
    required this.listaBensByIgrejaId,
    int? barcodeId,
  }) : barcodeId = barcodeId ?? 0;

  final List<DocumentReference>? listaBensByIgrejaId;
  final int barcodeId;

  @override
  State<InventarioWidget> createState() => _InventarioWidgetState();
}

class _InventarioWidgetState extends State<InventarioWidget> {
  late InventarioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InventarioModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // listaInventarios
      _model.listaInventarios = await queryInventarioRecordOnce(
        queryBuilder: (inventarioRecord) => inventarioRecord.where(
          'id_igreja',
          isEqualTo: FFAppState().igrejaId,
        ),
      );
      // inventarioNumber
      setState(() {
        FFAppState().inventarioNumber = _model.listaInventarios!.length;
      });
      // listaBens
      _model.listaBensEmInventario = await queryBensRecordOnce(
        queryBuilder: (bensRecord) => bensRecord.where(
          'id_igreja',
          isEqualTo: FFAppState().igrejaId,
        ),
      );
      if (_model.codeRead) {
        // useReadedList
        setState(() {
          _model.listToShow = _model.readedList.toList().cast<BensRecord>();
        });
        return;
      } else {
        if (_model.bensListUpdated.isEmpty) {
          // showListOriginal
          setState(() {
            _model.listToShow =
                _model.listaBensEmInventario!.toList().cast<BensRecord>();
          });
        } else {
          // useListUpdated
          setState(() {
            _model.listToShow =
                _model.bensListUpdated.toList().cast<BensRecord>();
          });
        }

        // listaBensEmInventario
        setState(() {
          _model.bensList =
              _model.listaBensEmInventario!.toList().cast<BensRecord>();
          _model.codeRead = false;
        });
        return;
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            setState(() {
              FFAppState().totalBens = widget.listaBensByIgrejaId!.length;
              FFAppState().terminoInventario = getCurrentTimestamp;
            });

            context.pushNamed('InventarioFinal');
          },
          backgroundColor: FlutterFlowTheme.of(context).secondaryText,
          elevation: 8.0,
          label: Text(
            'Finalizar inventário',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0.0,
                ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryText,
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (context) => FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: const AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      child: GestureDetector(
                        onTap: () => _model.unfocusNode.canRequestFocus
                            ? FocusScope.of(context)
                                .requestFocus(_model.unfocusNode)
                            : FocusScope.of(context).unfocus(),
                        child: const AlertaDialogInventarioWidget(),
                      ),
                    );
                  },
                ).then((value) => setState(() {}));
              },
            ),
          ),
          title: Text(
            'Inventário',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Builder(
              builder: (context) => Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: const AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: GestureDetector(
                            onTap: () => _model.unfocusNode.canRequestFocus
                                ? FocusScope.of(context)
                                    .requestFocus(_model.unfocusNode)
                                : FocusScope.of(context).unfocus(),
                            child: const AlertaDialogWidget(),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: Icon(
                    Icons.logout,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 24.0,
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 32.0),
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {},
                      child: BarcodeWidget(
                        data: 'Etiqueta',
                        barcode: Barcode.code128(),
                        width: 300.0,
                        height: 45.0,
                        color: FlutterFlowTheme.of(context).primaryText,
                        backgroundColor: Colors.transparent,
                        errorBuilder: (context, error) => const SizedBox(
                          width: 300.0,
                          height: 45.0,
                        ),
                        drawText: true,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).primaryText,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Bem ID: ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      _model.scannedBemDocument?.idBem
                                          .toString(),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    'Descrição: ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 8.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      _model.scannedBemDocument?.descricao,
                                      'descrição',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    'Localização: ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 8.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      _model.scannedBemDocument?.dependencia,
                                      'dependência',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 8.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var shouldSetState = false;
                                    if (FFAppState().loopLeitor) {
                                      while (FFAppState().loopLeitor == true) {
                                        // barcodeValue
                                        _model.barcodeValue2 =
                                            await FlutterBarcodeScanner
                                                .scanBarcode(
                                          '#C62828', // scanning line color
                                          'Cancel', // cancel button text
                                          true, // whether to show the flash icon
                                          ScanMode.BARCODE,
                                        );

                                        shouldSetState = true;
                                        _model.soundPlayer ??= AudioPlayer();
                                        if (_model.soundPlayer!.playing) {
                                          await _model.soundPlayer!.stop();
                                        }
                                        _model.soundPlayer!.setVolume(1.0);
                                        _model.soundPlayer!
                                            .setAsset(
                                                'assets/audios/beep-08b.wav')
                                            .then((_) =>
                                                _model.soundPlayer!.play());

                                        // setBarcodeState
                                        setState(() {
                                          _model.barcodeState = int.parse(
                                              (_model.barcodeValue2));
                                        });
                                        // busca_bem_barcode_readed
                                        _model.scannedBemDocument =
                                            await queryBensRecordOnce(
                                          queryBuilder: (bensRecord) =>
                                              bensRecord.where(
                                            'id_bem',
                                            isEqualTo: _model.barcodeState,
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        shouldSetState = true;
                                        // addToReadList
                                        setState(() {
                                          _model.addToReadedList(
                                              _model.scannedBemDocument!);
                                          _model.addToResetFields(
                                              _model.scannedBemDocument!);
                                        });
                                        setState(() {
                                          FFAppState().readedList = _model
                                              .readedList
                                              .map((e) => e.reference)
                                              .toList()
                                              .cast<DocumentReference>();
                                        });
                                        // removeBemFromBensList
                                        setState(() {
                                          _model.removeFromBensList(
                                              _model.scannedBemDocument!);
                                          _model.removeFromListToShow(
                                              _model.scannedBemDocument!);
                                        });
                                        // bensListAtualizada
                                        setState(() {
                                          _model.bensListUpdated = _model
                                              .bensList
                                              .toList()
                                              .cast<BensRecord>();
                                        });
                                        setState(() {
                                          FFAppState().bensListUpdated =
                                              FFAppState()
                                                  .bensListUpdated
                                                  .toList()
                                                  .cast<DocumentReference>();
                                        });
                                        setState(() {
                                          _model.resetFields = [];
                                        });
                                      }
                                    } else {
                                      // setBarcodeState
                                      setState(() {
                                        _model.barcodeState =
                                            int.parse((_model.barcodeValue2));
                                      });
                                      // addToReadList
                                      setState(() {
                                        _model.addToReadedList(
                                            _model.scannedBemDocument!);
                                        _model.addToResetFields(
                                            _model.scannedBemDocument!);
                                      });
                                      setState(() {
                                        FFAppState().readedList = _model
                                            .readedList
                                            .map((e) => e.reference)
                                            .toList()
                                            .cast<DocumentReference>();
                                      });
                                      // removeBemFromBensList
                                      setState(() {
                                        _model.removeFromBensList(
                                            _model.scannedBemDocument!);
                                        _model.removeFromListToShow(
                                            _model.scannedBemDocument!);
                                      });
                                      // bensListAtualizada
                                      setState(() {
                                        _model.bensListUpdated = _model.bensList
                                            .toList()
                                            .cast<BensRecord>();
                                      });
                                      setState(() {
                                        FFAppState().bensListUpdated =
                                            FFAppState()
                                                .bensListUpdated
                                                .toList()
                                                .cast<DocumentReference>();
                                      });
                                      setState(() {
                                        _model.resetFields = [];
                                      });
                                      if (shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (shouldSetState) setState(() {});
                                  },
                                  text: 'LER ETIQUETA',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Total de itens: ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Text(
                      _model.listToShow.length.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).tertiary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Exibir etiquetas lidas',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            unselectedWidgetColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                          child: Checkbox(
                            value: _model.chkShowReadedEtiquetasValue ??= false,
                            onChanged: (newValue) async {
                              setState(() => _model
                                  .chkShowReadedEtiquetasValue = newValue!);
                              if (newValue!) {
                                // showReadedEtiquetas
                                _model.showEtiquetasLidas = true;
                                _model.listToShow = _model.readedList
                                    .toList()
                                    .cast<BensRecord>();
                                setState(() {
                                  _model.showEtiquetasLidas = false;
                                });
                              } else {
                                if (_model.bensListUpdated.isEmpty) {
                                  // showListOriginal
                                  setState(() {
                                    _model.listToShow = _model
                                        .listaBensEmInventario!
                                        .toList()
                                        .cast<BensRecord>();
                                  });
                                } else {
                                  // useListUpdated
                                  setState(() {
                                    _model.listToShow = _model.bensListUpdated
                                        .toList()
                                        .cast<BensRecord>();
                                  });
                                }

                                // showUpdatedEtiquetas
                                _model.showEtiquetasLidas = false;
                                _model.listToShow =
                                    _model.bensList.toList().cast<BensRecord>();
                              }
                            },
                            side: BorderSide(
                              width: 2,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            activeColor: FlutterFlowTheme.of(context).primary,
                            checkColor: FlutterFlowTheme.of(context).info,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final listadeBens = _model.listToShow.toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listadeBens.length,
                      itemBuilder: (context, listadeBensIndex) {
                        final listadeBensItem = listadeBens[listadeBensIndex];
                        return Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Builder(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.itemClicked = listadeBensItem;
                                  });
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: EtiquetasDialogWidget(
                                            bensDoc: listadeBensItem,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                    width: 369.0,
                                    height: 161.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Bem ID: ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 0.0, 8.0),
                                              child: Text(
                                                listadeBensItem.idBem
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Descrição: ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    listadeBensItem.descricao,
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Dependência: ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                listadeBensItem.dependencia,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
