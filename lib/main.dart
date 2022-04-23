import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fta/programmer9211-blog/main.dart';
// import 'package:fta/programmer9211-chat/main.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const NewWidgetBlog());
}
