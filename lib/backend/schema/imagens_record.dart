import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ImagensRecord extends FirestoreRecord {
  ImagensRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ref" field.
  String? _ref;
  String get ref => _ref ?? '';
  bool hasRef() => _ref != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  void _initializeFields() {
    _ref = snapshotData['ref'] as String?;
    _url = snapshotData['url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('imagens');

  static Stream<ImagensRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImagensRecord.fromSnapshot(s));

  static Future<ImagensRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImagensRecord.fromSnapshot(s));

  static ImagensRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ImagensRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImagensRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImagensRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImagensRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImagensRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImagensRecordData({
  String? ref,
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ref': ref,
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImagensRecordDocumentEquality implements Equality<ImagensRecord> {
  const ImagensRecordDocumentEquality();

  @override
  bool equals(ImagensRecord? e1, ImagensRecord? e2) {
    return e1?.ref == e2?.ref && e1?.url == e2?.url;
  }

  @override
  int hash(ImagensRecord? e) => const ListEquality().hash([e?.ref, e?.url]);

  @override
  bool isValidKey(Object? o) => o is ImagensRecord;
}
