import 'package:firebase_test/services/firestore_services.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddPage extends StatefulWidget {
  AddPage({super.key, this.docId, this.note,this.age});

  String? docId;
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
    widget.docId != null ? noteController.text = widget.note! : null;
    widget.docId != null ? ageController.text = widget.age! : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            TextFormField(controller: noteController),
            const SizedBox(
              height: 20,
            ),
            TextFormField(controller: ageController),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  widget.docId == null
                      ? FireStoreServices().addNotes(noteController.text,ageController.text)
                      : FireStoreServices()
                          .updateNote(widget.docId!, noteController.text,ageController.text);
                  noteController.clear();
                  Navigator.pop(context);
                },
                child: const Text('ADD'))
          ],
        ),
      ),
    );
  }
}
