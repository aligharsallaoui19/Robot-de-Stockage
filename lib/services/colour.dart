import 'package:cloud_firestore/cloud_firestore.dart';

/*
Colour model
title - string
time - Timestamp
*/

class ColourService {
  // get collection of Colours
  final CollectionReference colours =
      FirebaseFirestore.instance.collection('colours');

  // READ: get colour from db
  Stream<QuerySnapshot> getColourStream() {
    final colourStream =
        colours.orderBy('time', descending: true).limit(1).snapshots();

    return colourStream;
  }
}
