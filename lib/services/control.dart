import 'package:cloud_firestore/cloud_firestore.dart';

class ControlService {
  // get collection of commands
  final CollectionReference commands =
      FirebaseFirestore.instance.collection('commands');

  // CREATE: add new move
  Future<void> addMove(String text) {
    return commands.add({
      "move": text,
      'time': Timestamp.now(),
    });
  }
}
