import 'package:flutter/material.dart';
import 'package:storage_robot/admin/admin_drawer.dart';
import 'package:storage_robot/components/my_drawer.dart';
import 'package:storage_robot/services/status.dart';

class HomeScreen extends StatelessWidget {
  static const screenId = "home_screen";
  final StatusService statusService = StatusService();

  final bool isAdmin;

  HomeScreen({super.key, this.isAdmin = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      drawer: !isAdmin ? const MyDrawer() : const AdminDrawer(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/robot.png",width: 120,),
              const SizedBox(height: 50),
              const Text(
                "Robot Status.",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
