import 'package:cloud_firestore/cloud_firestore.dart';

/*

Distance model
distance - double
time - Timestamp

*/

class DistanceService {
  // get collection of distances
  final CollectionReference distances =
      FirebaseFirestore.instance.collection('distance');

  // READ: get distance from db
  Stream<QuerySnapshot> getDistanceStream() {
    final distanceStream =
        distances.orderBy('time', descending: true).limit(1).snapshots();

    return distanceStream;
  }
}
