import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/employee.dart';

class EmployeesScreen extends StatefulWidget {
  static String screenId = '/employees_screen';
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesState();
}

class _EmployeesState extends State<EmployeesScreen> {
  // employee service
  final EmployeeService employeeService = EmployeeService();

  // text controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // open a dialog box to add an employee
  void openEmployeeBox({String? employeeID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Name'),
            TextField(controller: nameController),
            const Text('Password'),
            TextField(controller: passwordController),
          ],
        ),
        actions: [
          // button to save
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)
            ),
            onPressed: () {
              // add new employee
              if (employeeID == null) {
                if (nameController.text != "" &&
                    passwordController.text != "") {
                  employeeService.addEmployee(
                    nameController.text,
                    passwordController.text,
                  );
                }
              }

              // update an existing employee
              else {
                if (nameController.text != "" &&
                    passwordController.text != "") {
                  employeeService.updateEmployee(
                    employeeID,
                    nameController.text,
                    passwordController.text,
                  );
                }
              }

              // clear the text controllers
              nameController.clear();
              passwordController.clear();

              // close the box
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  // logout user
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: openEmployeeBox,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: employeeService.getEmployeesStream(),
        builder: (context, snapshot) {
          // if there is data, get all the docs
          if (snapshot.hasData) {
            List employeesList = snapshot.data!.docs;

            // display as a list
            return ListView.builder(
              itemCount: employeesList.length,
              itemBuilder: (context, index) {
                // get each individual docs
                DocumentSnapshot document = employeesList[index];
                String employeeID = document.id;

                // get employee from each doc
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String cinText = data['cin'];
                String emailText = data['email'];

                // display as a list tile
                return ListTile(
                  title: Text(cinText),
                  subtitle: Text(emailText),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // update button
                      IconButton(
                        onPressed: () =>
                            openEmployeeBox(employeeID: employeeID),
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                      ),

                      // delete button
                      IconButton(
                        onPressed: () =>
                            employeeService.deleteEmployee(employeeID),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            // if there is no data return nothing
            return const Text('No Employees..');
          }
        },
      ),
    );
  }
}
