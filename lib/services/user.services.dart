import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:meditation_center/data/models/user.model.dart';

class UserServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // check if user user id already exits
  Future<bool> isUserIdExists(String id) async {
    final snapshot = await _firestore.collection('users').doc(id).get();

    return snapshot.exists;
  }
   

  // add new user
  Future<void> addNewUser(UserModel user) async {
    final docRef = _firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);

    try {
      await docRef.set({...user.toJson()});
    } catch (e) {
      print('Error creating task: $e');
    }
  }

  // update user
  Future<void> updateUser(UserModel user) async {
    final docRef = _firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);

    try {
      await docRef.update({...user.toJson()});
    } catch (e) {
      print('Error updating task: $e');
    }
  }

  // get all users
  Future<List<UserModel>> getAllUsers() async {
    final snapshot = await _firestore.collection('users').get();

    final List<UserModel> users = [];

    snapshot.docs.forEach((doc) {
      users.add(UserModel.fromJson(doc.data()));
    });

    return users;
  }

  // get user by id
  Future<UserModel> getUserById(String id) async {
    final snapshot = await _firestore.collection('users').doc(id).get();

    return UserModel.fromJson(snapshot.data()!);
  }

  // delete user
  Future<void> deleteUser() async {
    final docRef = _firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);

    try {
      await docRef.delete();
    } catch (e) {
      print('Error deleting task: $e');
    }
  }
}
