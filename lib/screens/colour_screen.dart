import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:storage_robot/services/colour.dart';

class ColourScreen extends StatelessWidget {
  static String screenId = "/colour_screen";
  final ColourService colourService = ColourService();

  ColourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Colour Screen"),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: colourService.getColourStream(),
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
            return const Text('No Colour detected!!');
          }
        },
      ),
    );
  }
}
