import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String getInventarioDuration(
  DateTime inicio,
  DateTime termino,
) {
  final duracao = termino.difference(inicio);
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duracao.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duracao.inSeconds.remainder(60));
  return "${duracao.inHours}:$twoDigitMinutes:$twoDigitSeconds";
}
