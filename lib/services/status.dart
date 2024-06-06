import 'package:cloud_firestore/cloud_firestore.dart';

class StatusService {
  // get collection of status
  final CollectionReference status =
      FirebaseFirestore.instance.collection('status');

  // READ: get status from db
  Stream<QuerySnapshot> getStatusStream() {
    final statusStream = status.limit(1).snapshots();

    return statusStream;
  }
}
