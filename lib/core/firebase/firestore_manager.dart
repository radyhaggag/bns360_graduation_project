import 'package:cloud_firestore/cloud_firestore.dart';

typedef DocOfMap = DocumentSnapshot<Map<String, dynamic>>;

abstract class FirestoreManager {
  static final db = FirebaseFirestore.instance;

  static Future<void> deleteDoc({
    String? collection,
    required docPath,
    CollectionReference? reference,
  }) async {
    assert(
      reference != null || collection != null,
      'At least one parameter must not be null.',
    );

    final ref = reference ?? db.collection(collection!);
    await ref.doc(docPath).delete();
  }

  static Future<DocOfMap> getDoc({
    String? collection,
    required docPath,
    CollectionReference? reference,
  }) async {
    assert(
      reference != null || collection != null,
      'At least one parameter must not be null.',
    );
    final ref = reference ?? db.collection(collection!);
    final result = await ref.doc(docPath).get() as DocOfMap;
    return result;
  }

  static Future<void> setDoc({
    String? collection,
    required String docPath,
    required Map<String, dynamic> data,
    CollectionReference? reference,
  }) async {
    assert(
      reference != null || collection != null,
      'At least one parameter must not be null.',
    );
    final ref = reference ?? db.collection(collection!);
    await ref.doc(docPath).set(data);
  }

  static Future<void> addDoc({
    String? collection,
    required Map<String, dynamic> data,
    CollectionReference? reference,
    String? docId,
  }) async {
    assert(
      reference != null || collection != null,
      'At least one parameter must not be null.',
    );
    final ref = reference ?? db.collection(collection!);
    final newDocId = docId ?? ref.doc().id;
    data['id'] = newDocId;
    await ref.doc(newDocId).set(data);
  }

  static Future<List<DocOfMap>> getDocsByUserId({
    required String collection,
    required String userId,
  }) async {
    final querySnapshot = await db
        .collection(collection)
        .where('userId', isEqualTo: userId)
        .get();
    return querySnapshot.docs;
  }
}
