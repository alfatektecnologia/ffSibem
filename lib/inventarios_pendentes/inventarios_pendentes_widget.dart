import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/alerta_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'inventarios_pendentes_model.dart';
export 'inventarios_pendentes_model.dart';

class InventariosPendentesWidget extends StatefulWidget {
  const InventariosPendentesWidget({super.key});

  @override
  State<InventariosPendentesWidget> createState() =>
      _InventariosPendentesWidgetState();
}

class _InventariosPendentesWidgetState extends State<InventariosPendentesWidget>
    with TickerProviderStateMixin {
  late InventariosPendentesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InventariosPendentesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault<bool>(currentUserDocument?.isAdmin, false)) {
        // setAdmin
        setState(() {
          FFAppState().isAdmin = true;
        });
      } else {
        return;
      }
    });

    _model.tbSetoresController = TabController(
      vsync: this,
      length: 6,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryText,
          automaticallyImplyLeading: false,
          title: Text(
            'Inventarios pendentes',
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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Column(
              children: [
                Align(
                  alignment: const Alignment(0.0, 0),
                  child: TabBar(
                    isScrollable: true,
                    labelColor: FlutterFlowTheme.of(context).primaryText,
                    unselectedLabelColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    labelStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                    unselectedLabelStyle: const TextStyle(),
                    indicatorColor: FlutterFlowTheme.of(context).primary,
                    padding: const EdgeInsets.all(4.0),
                    tabs: const [
                      Tab(
                        text: '1',
                      ),
                      Tab(
                        text: '2',
                      ),
                      Tab(
                        text: '3',
                      ),
                      Tab(
                        text: '4A',
                      ),
                      Tab(
                        text: '4B',
                      ),
                      Tab(
                        text: '5',
                      ),
                    ],
                    controller: _model.tbSetoresController,
                    onTap: (i) async {
                      [
                        () async {},
                        () async {},
                        () async {},
                        () async {},
                        () async {},
                        () async {}
                      ][i]();
                    },
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _model.tbSetoresController,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Setor 1',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  PagedListView<DocumentSnapshot<Object?>?,
                                      IgrejasRecord>(
                                    pagingController:
                                        _model.setListViewController1(
                                      IgrejasRecord.collection
                                          .where(
                                            'id_setor',
                                            isEqualTo: '1',
                                          )
                                          .where(
                                            'lastInventario',
                                            isNotEqualTo: dateTimeFormat(
                                                'y', getCurrentTimestamp),
                                          )
                                          .where(
                                            'situacao',
                                            isEqualTo: 1,
                                          ),
                                    ),
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    reverse: false,
                                    scrollDirection: Axis.vertical,
                                    builderDelegate: PagedChildBuilderDelegate<
                                        IgrejasRecord>(
                                      // Customize what your widget looks like when it's loading the first page.
                                      firstPageProgressIndicatorBuilder: (_) =>
                                          Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Customize what your widget looks like when it's loading another page.
                                      newPageProgressIndicatorBuilder: (_) =>
                                          Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      ),

                                      itemBuilder: (context, _, listViewIndex) {
                                        final listViewIgrejasRecord = _model
                                            .listViewPagingController1!
                                            .itemList![listViewIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await queryBensRecordOnce(
                                                queryBuilder: (bensRecord) =>
                                                    bensRecord.where(
                                                  'id_igreja',
                                                  isEqualTo:
                                                      listViewIgrejasRecord
                                                          .idIgreja,
                                                ),
                                              );
                                              setState(() {
                                                FFAppState().igrejaId =
                                                    listViewIgrejasRecord
                                                        .idIgreja;
                                                FFAppState()
                                                        .enderecoInventario =
                                                    listViewIgrejasRecord
                                                        .igreja;
                                              });

                                              context.pushNamed(
                                                'Bens',
                                                queryParameters: {
                                                  'igreja': serializeParam(
                                                    listViewIgrejasRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'igreja':
                                                      listViewIgrejasRecord,
                                                },
                                              );
                                            },
                                            onDoubleTap: () async {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    FFAppState()
                                                        .isAdmin
                                                        .toString(),
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            },
                                            onLongPress: () async {
                                              if (FFAppState().isAdmin) {
                                                context.pushNamed(
                                                  'DetalhesIgreja',
                                                  queryParameters: {
                                                    'igrejaDocument':
                                                        serializeParam(
                                                      listViewIgrejasRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'igrejaDocument':
                                                        listViewIgrejasRecord,
                                                  },
                                                );
                                              } else {
                                                return;
                                              }
                                            },
                                            child: ListTile(
                                              title: Text(
                                                listViewIgrejasRecord.idIgreja
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                listViewIgrejasRecord.igreja,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Setor 2',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<List<IgrejasRecord>>(
                                    stream: queryIgrejasRecord(
                                      queryBuilder: (igrejasRecord) =>
                                          igrejasRecord
                                              .where(
                                                'id_setor',
                                                isEqualTo: '2',
                                              )
                                              .where(
                                                'lastInventario',
                                                isNotEqualTo: dateTimeFormat(
                                                    'y', getCurrentTimestamp),
                                              )
                                              .where(
                                                'situacao',
                                                isEqualTo: 1,
                                              ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<IgrejasRecord>
                                          listViewIgrejasRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewIgrejasRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewIgrejasRecord =
                                              listViewIgrejasRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await queryBensRecordOnce(
                                                  queryBuilder: (bensRecord) =>
                                                      bensRecord.where(
                                                    'id_igreja',
                                                    isEqualTo:
                                                        listViewIgrejasRecord
                                                            .idIgreja,
                                                  ),
                                                );
                                                setState(() {
                                                  FFAppState().igrejaId =
                                                      listViewIgrejasRecord
                                                          .idIgreja;
                                                });

                                                context.pushNamed(
                                                  'Bens',
                                                  queryParameters: {
                                                    'igreja': serializeParam(
                                                      listViewIgrejasRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'igreja':
                                                        listViewIgrejasRecord,
                                                  },
                                                );
                                              },
                                              onLongPress: () async {
                                                if (FFAppState().isAdmin) {
                                                  context.pushNamed(
                                                    'DetalhesIgreja',
                                                    queryParameters: {
                                                      'igrejaDocument':
                                                          serializeParam(
                                                        listViewIgrejasRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'igrejaDocument':
                                                          listViewIgrejasRecord,
                                                    },
                                                  );
                                                }
                                              },
                                              child: ListTile(
                                                title: Text(
                                                  listViewIgrejasRecord.idIgreja
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                subtitle: Text(
                                                  listViewIgrejasRecord.igreja,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 20.0,
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                dense: false,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Setor 3',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<List<IgrejasRecord>>(
                                    stream: queryIgrejasRecord(
                                      queryBuilder: (igrejasRecord) =>
                                          igrejasRecord
                                              .where(
                                                'id_setor',
                                                isEqualTo: '3',
                                              )
                                              .where(
                                                'lastInventario',
                                                isNotEqualTo: dateTimeFormat(
                                                    'y', getCurrentTimestamp),
                                              )
                                              .where(
                                                'situacao',
                                                isEqualTo: 1,
                                              ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<IgrejasRecord>
                                          listViewIgrejasRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewIgrejasRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewIgrejasRecord =
                                              listViewIgrejasRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await queryBensRecordOnce(
                                                  queryBuilder: (bensRecord) =>
                                                      bensRecord.where(
                                                    'id_igreja',
                                                    isEqualTo:
                                                        listViewIgrejasRecord
                                                            .idIgreja,
                                                  ),
                                                );
                                                setState(() {
                                                  FFAppState().igrejaId =
                                                      listViewIgrejasRecord
                                                          .idIgreja;
                                                });

                                                context.pushNamed(
                                                  'Bens',
                                                  queryParameters: {
                                                    'igreja': serializeParam(
                                                      listViewIgrejasRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'igreja':
                                                        listViewIgrejasRecord,
                                                  },
                                                );
                                              },
                                              onLongPress: () async {
                                                if (FFAppState().isAdmin) {
                                                  context.pushNamed(
                                                    'DetalhesIgreja',
                                                    queryParameters: {
                                                      'igrejaDocument':
                                                          serializeParam(
                                                        listViewIgrejasRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'igrejaDocument':
                                                          listViewIgrejasRecord,
                                                    },
                                                  );
                                                }
                                              },
                                              child: ListTile(
                                                title: Text(
                                                  listViewIgrejasRecord.idIgreja
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                subtitle: Text(
                                                  listViewIgrejasRecord.igreja,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 20.0,
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                dense: false,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Setor 4A',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<List<IgrejasRecord>>(
                                    stream: queryIgrejasRecord(
                                      queryBuilder: (igrejasRecord) =>
                                          igrejasRecord
                                              .where(
                                                'id_setor',
                                                isEqualTo: '4A',
                                              )
                                              .where(
                                                'lastInventario',
                                                isNotEqualTo: dateTimeFormat(
                                                    'y', getCurrentTimestamp),
                                              )
                                              .where(
                                                'situacao',
                                                isEqualTo: 1,
                                              ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<IgrejasRecord>
                                          listViewIgrejasRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewIgrejasRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewIgrejasRecord =
                                              listViewIgrejasRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await queryBensRecordOnce(
                                                  queryBuilder: (bensRecord) =>
                                                      bensRecord.where(
                                                    'id_igreja',
                                                    isEqualTo:
                                                        listViewIgrejasRecord
                                                            .idIgreja,
                                                  ),
                                                );
                                                setState(() {
                                                  FFAppState().igrejaId =
                                                      listViewIgrejasRecord
                                                          .idIgreja;
                                                });

                                                context.pushNamed(
                                                  'Bens',
                                                  queryParameters: {
                                                    'igreja': serializeParam(
                                                      listViewIgrejasRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'igreja':
                                                        listViewIgrejasRecord,
                                                  },
                                                );
                                              },
                                              onLongPress: () async {
                                                if (FFAppState().isAdmin) {
                                                  context.pushNamed(
                                                    'DetalhesIgreja',
                                                    queryParameters: {
                                                      'igrejaDocument':
                                                          serializeParam(
                                                        listViewIgrejasRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'igrejaDocument':
                                                          listViewIgrejasRecord,
                                                    },
                                                  );
                                                }
                                              },
                                              child: ListTile(
                                                title: Text(
                                                  listViewIgrejasRecord.idIgreja
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                subtitle: Text(
                                                  listViewIgrejasRecord.igreja,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 20.0,
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                dense: false,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Setor 4B',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<List<IgrejasRecord>>(
                                    stream: queryIgrejasRecord(
                                      queryBuilder: (igrejasRecord) =>
                                          igrejasRecord
                                              .where(
                                                'id_setor',
                                                isEqualTo: '4B',
                                              )
                                              .where(
                                                'lastInventario',
                                                isNotEqualTo: dateTimeFormat(
                                                    'y', getCurrentTimestamp),
                                              )
                                              .where(
                                                'situacao',
                                                isEqualTo: 1,
                                              ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<IgrejasRecord>
                                          listViewIgrejasRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewIgrejasRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewIgrejasRecord =
                                              listViewIgrejasRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await queryBensRecordOnce(
                                                  queryBuilder: (bensRecord) =>
                                                      bensRecord.where(
                                                    'id_igreja',
                                                    isEqualTo:
                                                        listViewIgrejasRecord
                                                            .idIgreja,
                                                  ),
                                                );
                                                setState(() {
                                                  FFAppState().igrejaId =
                                                      listViewIgrejasRecord
                                                          .idIgreja;
                                                });

                                                context.pushNamed(
                                                  'Bens',
                                                  queryParameters: {
                                                    'igreja': serializeParam(
                                                      listViewIgrejasRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'igreja':
                                                        listViewIgrejasRecord,
                                                  },
                                                );
                                              },
                                              onLongPress: () async {
                                                if (FFAppState().isAdmin) {
                                                  context.pushNamed(
                                                    'DetalhesIgreja',
                                                    queryParameters: {
                                                      'igrejaDocument':
                                                          serializeParam(
                                                        listViewIgrejasRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'igrejaDocument':
                                                          listViewIgrejasRecord,
                                                    },
                                                  );
                                                }
                                              },
                                              child: ListTile(
                                                title: Text(
                                                  listViewIgrejasRecord.idIgreja
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                subtitle: Text(
                                                  listViewIgrejasRecord.igreja,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 20.0,
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                dense: false,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Setor 5',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<List<IgrejasRecord>>(
                                    stream: queryIgrejasRecord(
                                      queryBuilder: (igrejasRecord) =>
                                          igrejasRecord
                                              .where(
                                                'id_setor',
                                                isEqualTo: '5',
                                              )
                                              .where(
                                                'lastInventario',
                                                isNotEqualTo: dateTimeFormat(
                                                    'y', getCurrentTimestamp),
                                              )
                                              .where(
                                                'situacao',
                                                isEqualTo: 1,
                                              ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<IgrejasRecord>
                                          listViewIgrejasRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewIgrejasRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewIgrejasRecord =
                                              listViewIgrejasRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await queryBensRecordOnce(
                                                  queryBuilder: (bensRecord) =>
                                                      bensRecord.where(
                                                    'id_igreja',
                                                    isEqualTo:
                                                        listViewIgrejasRecord
                                                            .idIgreja,
                                                  ),
                                                );
                                                setState(() {
                                                  FFAppState().igrejaId =
                                                      listViewIgrejasRecord
                                                          .idIgreja;
                                                });

                                                context.pushNamed(
                                                  'Bens',
                                                  queryParameters: {
                                                    'igreja': serializeParam(
                                                      listViewIgrejasRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'igreja':
                                                        listViewIgrejasRecord,
                                                  },
                                                );
                                              },
                                              onLongPress: () async {
                                                if (FFAppState().isAdmin) {
                                                  context.pushNamed(
                                                    'DetalhesIgreja',
                                                    queryParameters: {
                                                      'igrejaDocument':
                                                          serializeParam(
                                                        listViewIgrejasRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'igrejaDocument':
                                                          listViewIgrejasRecord,
                                                    },
                                                  );
                                                }
                                              },
                                              child: ListTile(
                                                title: Text(
                                                  listViewIgrejasRecord.idIgreja
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                subtitle: Text(
                                                  listViewIgrejasRecord.igreja,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 20.0,
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                dense: false,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
