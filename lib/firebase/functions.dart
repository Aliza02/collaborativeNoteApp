import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore store = FirebaseFirestore.instance;
Future<bool> addNoteToDatabase({required String note}) async {
  await store.collection('Notes').doc().set({
    'note': note,
    'currentViewers': [],
  });
  return true;
}

Stream getAllNotes() {
  return store.collection('Notes').snapshots();
}

Future<bool> deleteANote({required String id}) async {
  await store.collection('Notes').doc(id).delete();
  await store.collection('Notes').doc(id).collection('Comments').doc().delete();
  return true;
}

Future<bool> eidtANote(
    {required String id, required String updatedNote}) async {
  await store.collection('Notes').doc(id).update({'note': updatedNote});
  return true;
}

Future<void> saveCurrentViewer(
    {required String id, required String userName}) async {
  await store.collection('Notes').doc(id).update({
    'currentViewers': FieldValue.arrayUnion([userName])
  });
}

Future<void> removeCurrentViewer(
    {required String id, required String userName}) async {
  await store.collection('Notes').doc(id).update({
    'currentViewers': FieldValue.arrayRemove([userName])
  });
}

Stream getCurrentViewer({required String id}) {
  return store.collection('Notes').doc(id).snapshots();
}

Stream getComments({required String id}) {
  return store.collection('Notes').doc(id).collection('Comments').snapshots();
}

Future<void> saveComments(
    {required String id,
    required String comment,
    required String userName}) async {
  await store.collection("Notes").doc(id).collection('Comments').doc().set({
    "author": userName,
    "comment": comment,
  });
}
