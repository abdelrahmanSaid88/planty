

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planty/screens/Home/data/note.dart';

extension MyDateExtension on DateTime {
  DateTime getDateOnly() {
    return DateTime(this.year, this.month, this.day);
  }
}

CollectionReference<Note> getTodosRefWithConverter() {
  return FirebaseFirestore.instance
      .collection(Note.collectionName)
      .withConverter<Note>(
        fromFirestore: (snapshot, _) => Note.fromJson(snapshot.data()!),
        toFirestore: (note, _) => note.toJson(),
      );
}

Future<void> addPLantToFirebase(String title, String desc, DateTime time) {
  DocumentReference<Note> docRef = getTodosRefWithConverter().doc();
  Note note = Note(
      id: docRef.id,
      title: title,
      description: desc,
      dateTime: time.getDateOnly());
  return docRef.set(note);
}

Future<void> deleteTask(Note item) {
  DocumentReference<Note> ref = getTodosRefWithConverter().doc(item.id);
  return ref.delete();
}
