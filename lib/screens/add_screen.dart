import 'package:firebase_test/services/firestore_services.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddPage extends StatefulWidget {
  AddPage({super.key, this.docId, this.note});

  String? docId;
  String? note;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController noteController = TextEditingController();
  @override
  void initState() {
    widget.docId != null ? noteController.text = widget.note! : null;
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
            ElevatedButton(
                onPressed: () {
                  widget.docId == null
                      ? FirestroeServices().addNotes(noteController.text)
                      : FirestroeServices()
                          .updateNote(widget.docId!, noteController.text);
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
