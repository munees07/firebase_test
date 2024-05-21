import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  Future<void> addNotes(String note,String age) {
    return notes.add({"note": note,"age":age});
  }

  Stream<QuerySnapshot> getNotes() {
    return notes.snapshots();
  }

  Future<void> updateNote(String id, String newNote,String newAge) {
    return notes.doc(id).update({"note": newNote,"age":newAge});
  }

  Future<void> deleteNote(String id) {
    return notes.doc(id).delete();
  }
}
