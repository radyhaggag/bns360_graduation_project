import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

abstract class FirebaseStorageReferences {
  static final _storage = FirebaseStorage.instance.ref();

  static final conversations = _storage.child('conversations');

  static Reference conversationReference(String conversationId) {
    return conversations.child(conversationId);
  }
}

class FirebaseStorageManager {
  static final db = FirebaseStorage.instance;
  FirebaseStorageManager._();

  static Future<String> uploadFile({
    required File file,
    required Reference ref,
  }) async {
    final fileName = file.path.split('/').last;

    final reference = ref.child(fileName);
    final uploadTask = reference.putFile(file);

    final snapshot = await uploadTask.whenComplete(() => null);

    final downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }

  static Future<String> uploadFileByReference({
    required File file,
    required Reference ref,
    required String fileName,
  }) async {
    final reference = ref.child(fileName);
    final uploadTask = reference.putFile(file);

    final snapshot = await uploadTask.whenComplete(() => null);

    final downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }

  static Future<String> uploadFileWithCustomMetadata({
    required File file,
    required String path,
    required String fileName,
    required Map<String, String> metadata,
  }) async {
    final reference = db.ref().child(path).child(fileName);
    final uploadTask = reference.putFile(
      file,
      SettableMetadata(customMetadata: metadata),
    );

    final snapshot = await uploadTask.whenComplete(() => null);

    final downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }

  static Future<String> getFileDownloadUrl({
    required String path,
    required String fileName,
  }) async {
    final reference = db.ref().child(path).child(fileName);
    final downloadUrl = await reference.getDownloadURL();
    return downloadUrl;
  }

  static Future<List<String>> loadFilesByPaths({
    required List<String> paths,
  }) async {
    final List<String> fileUrls = [];

    for (final path in paths) {
      final Reference reference = db.ref().child(path);
      final downloadUrl = await reference.getDownloadURL();
      fileUrls.add(downloadUrl);
    }

    return fileUrls;
  }
}
