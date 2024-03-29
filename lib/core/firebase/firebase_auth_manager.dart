import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../helpers/execute_and_handle_error.dart';
import '../shared_data/models/profile/profile_model.dart';
import '../utils/custom_types.dart';
import '../utils/enums/user_type.dart';

// const dummyImageUrl = 'https://static.dw.com/image/44777236_804.jpg';
const dummyImageUrl =
    "https://www.rivaicmimarlik.com/upload/images/sayfalar/2023/kafelerde-misafirperver-tasarimlar-45268-4763400231.jpg";

abstract class FirebaseAuthManager {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static CollectionReference get users => _firestore.collection('users');

  static FutureEither<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) {
    return executeAndHandleErrorAsync<User?>(() async {
      User? user;

      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user == null) {
        final result = await signUpWithEmailAndPassword(email, password);
        user = result.fold((l) => null, (r) => r);
      } else {
        user = userCredential.user;
      }

      final ProfileModel profileModel = ProfileModel(
        // id: user!.uid,
        id: '1',
        name: email.split("@").first,
        email: email,
        imageUrl: dummyImageUrl,
        userType: UserType.businessOwner.id,
      );
      await profileModel.saveToCache();
      return user;
    });
  }

  static FutureEither<User?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) {
    return executeAndHandleErrorAsync<User?>(() async {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Create a dummy image URL
      // Store user data in 'users' collection
      await users.doc(userCredential.user!.uid).set({
        'id': userCredential.user!.uid,
        'email': email,
        'imageUrl': dummyImageUrl,
      });
      return userCredential.user;
    });
  }

  static FutureEither<void> signOut() {
    return executeAndHandleErrorAsync<void>(() {
      return _auth.signOut();
    });
  }

  static FutureEither<User?> signInAnonymously() {
    return executeAndHandleErrorAsync<User?>(() async {
      final userCredential = await _auth.signInAnonymously();

      final ProfileModel profileModel = ProfileModel(
        // id: userCredential.user!.uid,
        id: '1',
        name: userCredential.user?.displayName ?? "Anonymous",
        email: userCredential.user?.email ?? "anonymous@gmail.com",
        imageUrl: dummyImageUrl,
        // userType: UserType.user.id,
        userType: UserType.businessOwner.id,
      );

      await users.doc(userCredential.user!.uid).set({
        'id': profileModel.id,
        'email': profileModel.email,
        "image_url": dummyImageUrl,
      });

      await profileModel.saveToCache();

      return userCredential.user;
    });
  }
}
