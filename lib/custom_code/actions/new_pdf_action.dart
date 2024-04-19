// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

//import 'dart:js_interop';

import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;
import 'package:printing/printing.dart';
import '../../auth/firebase_auth/auth_util.dart';
import '../../backend/firebase_storage/storage.dart';
import 'package:dio/dio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future newPdfAction(
  BuildContext context,
  String? title,
  String? body,
) async {
  // null safety
  title = title ?? '';
  body = body ?? '';

  final PdfColor colorPdf = PdfColor.fromInt(0x4b5499);

  // Define the table headers
  final headers = ['ETIQUETA', 'DESCRIÇÃO', 'DEPENDÊNCIA', 'OBSERVAÇÃO'];

  //tempo de duração do inventario
  final duracao = FFAppState()
      .terminoInventario!
      .difference(FFAppState().inicioInventario!);

  var duracaoInventario = formatDuration(duracao);

  final String inicioInventario =
      DateFormat('Hm').format(FFAppState().inicioInventario!);

  final String terminoInventario =
      DateFormat('Hm').format(FFAppState().terminoInventario!);

  final String myDate = DateFormat('d/M/y').format(DateTime.now());

  //listas de etiquetas para imprimir
  final listaEtiquetasImprimir =
      await getImprimirEtiquetasCollection('imprimir_etiquetas');

  //lista de etiquetas para excluir
  final listaEtiquetasExcluir =
      await getImprimirEtiquetasCollection('excluir_etiquetas');

  //lista de etiquetas para cadastrar
  final listaEtiquetasCadastrar =
      await getImprimirEtiquetasCollection('cadastrar_etiquetas');

  final pdf = pw.Document();

  // add network image
  final netImage = await networkImage(
      'https://firebasestorage.googleapis.com/v0/b/sibem-9cd5f.appspot.com/o/files%2Flogo-ccb-light.png?alt=media&token=36c38a59-42c4-4964-9576-a86683c7c556'); //logo CCB

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
                //header
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                mainAxisSize: pw.MainAxisSize.max,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Image(netImage,
                      width:
                          100), //  .asset('assets/images/logo-ccb-light.png'),
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text('Inventário Geral de Bens Imobilizados',
                            style: pw.TextStyle(
                                fontSize: 14, fontWeight: pw.FontWeight.bold)),
                        pw.Text('ADMINSTRAÇÃO CAMPINAS-SP',
                            style: pw.TextStyle(fontSize: 13)),
                        //pw.SizedBox(height: 20),
                        pw.Text('CNPJ 46.043.295/0001-84 - IE ISENTO'),
                        pw.Text('Departamento de Patrimônio de Bens Móveis'),
                      ])
                ]),
            pw.SizedBox(height: 8),
            pw.Divider(height: 3, color: colorPdf),
            pw.SizedBox(height: 8),
            //inventario data
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                mainAxisSize: pw.MainAxisSize.max,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Inventário nº '),
                        pw.Text('Localidade: '),
                        pw.Text('Data: '),
                        pw.Text('Duração: '),
                      ]),
                  pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('${FFAppState().numeroInventario}'),
                        pw.Text('${FFAppState().enderecoInventario}'),
                        pw.Text(myDate),
                        pw.Text(
                            'das ${inicioInventario} as ${terminoInventario}  (${duracaoInventario})'),
                      ]),
                ]),

            pw.SizedBox(height: 8),
            pw.Divider(height: 3, color: colorPdf),
            pw.SizedBox(height: 8),
            //inventario body

            //imprimir etiquetas
            pw.Container(
              color: colorPdf,
              alignment: pw.Alignment.center,
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  mainAxisSize: pw.MainAxisSize.max,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Text('IMPRIMIR',
                        style: pw.TextStyle(color: PdfColor.fromInt(0xffffff)),
                        textAlign: pw.TextAlign.center),
                  ]),
            ),

            pw.Container(
              child: pw.TableHelper.fromTextArray(
                  headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  cellStyle: pw.TextStyle(fontSize: 7),
                  data: listaEtiquetasImprimir,
                  headers: headers),
            ),
            pw.SizedBox(height: 8),
            //excluir

            pw.Container(
              color: colorPdf,
              alignment: pw.Alignment.center,
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  mainAxisSize: pw.MainAxisSize.max,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Text('EXCLUIR',
                        style: pw.TextStyle(color: PdfColor.fromInt(0xffffff)),
                        textAlign: pw.TextAlign.center),
                  ]),
            ),

            pw.Container(
              child: pw.TableHelper.fromTextArray(
                  headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  cellStyle: pw.TextStyle(fontSize: 7),
                  data: listaEtiquetasExcluir,
                  headers: headers),
            ),
            pw.SizedBox(height: 8),
            //CADASTRAR

            pw.Container(
              color: colorPdf,
              alignment: pw.Alignment.center,
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  mainAxisSize: pw.MainAxisSize.max,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Text('CADASTRAR',
                        style: pw.TextStyle(color: PdfColor.fromInt(0xffffff)),
                        textAlign: pw.TextAlign.center),
                  ]),
            ),

            pw.Container(
              child: pw.TableHelper.fromTextArray(
                  headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  cellStyle: pw.TextStyle(fontSize: 7),
                  data: listaEtiquetasCadastrar,
                  headers: headers),
            ),
            pw.SizedBox(height: 20),
            pw.Row(
                mainAxisSize: pw.MainAxisSize.max,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Text('Inventariantes:',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(height: 20),
                      pw.Text('________________________________'),
                      pw.Text(FFAppState().inventariantes),
                    ],
                  ),
                  pw.SizedBox(height: 40),
                  pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Text('Responsaveis pelos bens:',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(height: 20),
                      pw.Text('________________________________'),
                      pw.Text(FFAppState().responsaveis),
                    ],
                  ),
                ]),
          ],
        );
      },
    ),
  );

  final pdfSaved = await pdf.save();

  // Get the current date and time
  final now = DateTime.now();

// Format the date and time as a string
  final formattedDateTime =
      '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}_${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}-${now.second.toString().padLeft(2, '0')}';

// Set the file name to the formatted date and time string
  final fileName = '$formattedDateTime.pdf';

// Set the directory where you want to store the file (e.g., a folder named 'pdfs' in your storage)
  String directoryPath = '/users/' + currentUserUid + '/pdfs';

// Combine the directory path and file name to create the full storage path
  final storagePath = '$directoryPath/$fileName';

  // Save the file data to Firestore
  FFAppState().storagePath = (await uploadData(storagePath, pdfSaved))!;

  //FFAppState().storagePath = storagePath; // downloadUrl ?? '';
  //await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfSaved);

  // await documentReference.set(storagePatch, pdfSaved);
  //ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //  content: Text(storagePath),
  // ));
}

// Define function to get collection from Firebase
Future<List<List<dynamic>>> getImprimirEtiquetasCollection(
    String collectionName) async {
  // Create a new instance of Firestore
  FirebaseFirestore db = FirebaseFirestore.instance;
  // Get reference to Firestore collection
  final ref = db.collection(collectionName).withConverter(
        fromFirestore: MyTable.fromFirestore,
        toFirestore: (MyTable table, _) => table.toFirestore(),
      );

  //date to filter collection
  final String myDate = DateFormat('d/M/y').format(DateTime.now());

  QuerySnapshot querySnapshot = await ref
      .where('id_igreja', isEqualTo: FFAppState().igrejaId)
      .where('data', isEqualTo: myDate)
      .get();
  List<List<dynamic>> data = [[]];
  final List<List<dynamic>> noItems2Show = [
    ["  ", "  ", "  ", "  "],
    ["  ", "  ", "  ", "  "],
    ["  ", "  ", "  ", "  "],
    ["  ", "  ", "  ", "  "],
    ["  ", "  ", "  ", "  "]
  ];

  data.addAll(querySnapshot.docs.map((doc) {
    return [
      doc['id_bem'],
      doc['descricao'],
      doc['localizao'],
      doc['observacao'],
    ];
  }).toList());

  if (data.length == 1) {
    data = noItems2Show;
  }

  return data;
}

class MyTable {
  int? id_bem;
  String? descricao;
  String? localizao;
  String? observacao;

  MyTable({this.id_bem, this.descricao, this.localizao, this.observacao});

  factory MyTable.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return MyTable(
      id_bem: data?['id_bem'],
      descricao: data?['descricao'],
      localizao: data?['localizao'],
      observacao: data?['observacao'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (id_bem != null) "id_bem": id_bem,
      if (descricao != null) "descricao": descricao,
      if (localizao != null) "localizao": localizao,
      if (observacao != null) "observacao": observacao,
    };
  }

  factory MyTable.fromQuerySnapshot(QuerySnapshot snapshot) {
    final data2 = snapshot.docs;
    var myTable;
    for (var i = 0; i < data2.length; i++) {
      myTable = MyTable(
        id_bem: data2[i]['id_bem'],
        descricao: data2[i]['descricao'],
        localizao: data2[i]['localizao'],
        observacao: data2[i]['observacao'],
      );
    }
    return myTable;
  }

  static fromJson(Object? data) {}
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${duration.inHours}:$twoDigitMinutes:$twoDigitSeconds";
}

dynamic getPageState(BuildContext context) {
  final state = ModalRoute.of(context)?.settings.arguments;
  return state;
}
