import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/history.dart';

class HistoryScreen extends StatelessWidget {
  static String screenId = "/history_screen";

  final HistoryService historyService = HistoryService();

  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: historyService.getHistoryStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List historyList = snapshot.data!.docs;
            return ListView.builder(
              itemCount: historyList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = historyList[index];

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;

                String content = data['title'];

                return ListTile(
                  title: Text(content),
                );
              },
            );
          } else {
            return const Text('No history...');
          }
        },
      ),
    );
  }
}
