import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryService {
  // get collection of history
  final CollectionReference histories =
      FirebaseFirestore.instance.collection('histories');

  // CREATE: add new history
  Future<void> addHistory(String text) {
    return histories.add({
      "title": text,
      'time': Timestamp.now(),
    });
  }

  // READ: get histories from db
  Stream<QuerySnapshot> getHistoryStream() {
    final historyStream =
        histories.orderBy('time', descending: true).snapshots();

    return historyStream;
  }
}
