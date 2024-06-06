import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:storage_robot/services/distance.dart';

class DistanceScreen extends StatelessWidget {
  static String screenId = "/distance_screen";
  final DistanceService distanceService = DistanceService();

  DistanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Distance Screen"),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: distanceService.getDistanceStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List historyList = snapshot.data!.docs;
            return ListView.builder(
              itemCount: historyList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = historyList[index];

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;

                double content = data['distance'];

                return ListTile(
                  title: Text('$content meters'),
                );
              },
            );
          } else {
            return const Text('0 meter');
          }
        },
      ),
    );
  }
}
