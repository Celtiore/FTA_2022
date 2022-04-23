// ignore_for_file: avoid_print

import 'package:fta/programmer9211-blog/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createAccount(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut().then((value) {
        Get.toNamed(Routes.AUTHENTICATION);
      });
    } catch (e) {
      print(e);
    }
  }
}
