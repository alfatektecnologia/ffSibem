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

import 'package:cloud_firestore/cloud_firestore.dart';

Future updateIgrejaCollection(
  BuildContext context,
  String ano,
) async {
  // Get the reference to the igreja collection
  var igrejas = "igrejas";
  CollectionReference igrejaCollection =
      FirebaseFirestore.instance.collection(igrejas);

  WriteBatch batch = FirebaseFirestore.instance.batch();
  QuerySnapshot query = await igrejaCollection.get();
  for (QueryDocumentSnapshot doc in query.docs) {
    // Adicionar a operação de atualização ao lote
    batch.update(doc.reference, {'lastInventario': ano});
  }
  await batch.commit();
}
