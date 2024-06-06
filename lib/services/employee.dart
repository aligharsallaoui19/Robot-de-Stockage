import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeService {
  // get collection of employees
  final CollectionReference employees =
      FirebaseFirestore.instance.collection('employees');

  // CREATE: add new employee
  Future<void> addEmployee(String cin, String? email) {
    return employees.add({
      'cin': cin,
      'email': email,
      'time': Timestamp.now(),
    });
  }

  // READ: get employees from db
  Stream<QuerySnapshot> getEmployeesStream() {
    final employeesStream =
        employees.orderBy('time', descending: true).snapshots();

    return employeesStream;
  }

  // UPDATE: update employees given a doc id
  Future<void> updateEmployee(
      String employeeID, String newName, String? newPassword) {
    return employees.doc(employeeID).update({
      'name': newName,
      'password': newPassword!,
      'time': Timestamp.now(),
    });
  }

  // DELETE: delete employees given a doc id
  Future<void> deleteEmployee(String employeeID) {
    return employees.doc(employeeID).delete();
  }
}
