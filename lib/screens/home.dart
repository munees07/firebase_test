import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/screens/add_screen.dart';
import 'package:firebase_test/services/firestore_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPage(),
                  ));
            }),
        body: StreamBuilder(
          stream: FireStoreServices().getNotes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List notesList = snapshot.data!.docs;
              return ListView.builder(
                itemCount: notesList.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = notesList[index];
                  String docId = document.id;
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;

                  return ListTile(
                    leading: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          data['note'],
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          data['age'],
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddPage(
                                    age: data['age'],
                                    id: docId,
                                    note: data['note'],
                                  ),
                                ));
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            FireStoreServices().deleteNote(docId);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Text('no notes..');
            }
          },
        ));
  }
}
