import 'package:fta/programmer9211-blog/app/data/const.dart';
import 'package:fta/programmer9211-blog/app/data/firebase/firebase_auth.dart';
import 'package:fta/programmer9211-blog/app/data/global_widgets/indicator.dart';
import 'package:fta/programmer9211-blog/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuthentication _authentication = FirebaseAuthentication();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  void onLogin() async {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      Indicator.showLoading();
      await _authentication.login(email.text, password.text).then((value) {
        Indicator.closeLoading();
        Get.toNamed(Routes.HOME);
      });
    } else {
      showAlert("All fields are required");
    }
  }
}
