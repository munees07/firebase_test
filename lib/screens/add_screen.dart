// ignore_for_file: must_be_immutable

import 'package:firebase_test/services/firestore_services.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  AddPage({super.key, this.note, this.age, this.id});
  String? id;
  String? note;
  String? age;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController noteController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    widget.id != null ? noteController.text = widget.note! : null;
    widget.id != null ? ageController.text = widget.age! : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(controller: noteController),
            const SizedBox(height: 10),
            TextFormField(controller: ageController),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  widget.id == null
                      ? FireStoreServices()
                          .addNotes(noteController.text, ageController.text)
                      : FireStoreServices().updateNote(
                          widget.id!, noteController.text, ageController.text);

                  noteController.clear();
                  ageController.clear();
                  Navigator.pop(context);
                },
                child: Text(widget.id == null ? 'ADD' : 'UPDATE'))
          ],
        ),
      ),
    );
  }
}
