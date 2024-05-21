import 'package:cloud_firestore/cloud_firestore.dart';

class FirestroeServices {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  Future<void> addNotes(String note,String age) {
    return notes.add({"note": note,"age": age});
  }

  Stream<QuerySnapshot> getNotes() {
    return notes.snapshots();
  }

  Future<void> deleteNote(String id) {
    return notes.doc(id).delete();
  }

  Future<void> updateNote(String id, String newnote,String newAge) {
    return notes.doc(id).update({'note': newnote,'age':newAge});
  }
}
