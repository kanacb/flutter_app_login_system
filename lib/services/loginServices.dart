// functions to create in the factory services
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

// addUser
Future<DocumentReference> addUser(String fullName, String email, String password) {
  return users
      .add({
        'full_name': fullName, // John Doe
        'email': email, // Stokes and Sons
        'password': password // 42
      });
      // .then((value) => print("User Added"))
      // .catchError((error) => print("Failed to add user: ${error.toString()}"));
}

// finduser
Future<QuerySnapshot> findUser(String email) {
  return users
      .where('email',isEqualTo: email)
      .get();
      // .then((value) => print("Get User"))
      // .catchError((error) => print("Failed to find User: ${error.toString()}"));
}

// check user email and password is correct
Future<QuerySnapshot> checkUserAuth(String email, String password) {
  return users
      .where('email',isEqualTo: email)
      .where('password',isEqualTo: password)
      .get();
      // .then((value) => print("Get User ${value.size}"))
      // .catchError((error) => print("Failed to check User Auth: ${error.toString()}"));
}

