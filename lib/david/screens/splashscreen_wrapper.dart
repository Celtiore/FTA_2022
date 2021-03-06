import 'package:flutter/material.dart';
import 'package:fta/david/models/user.dart';
import 'package:fta/david/screens/authenticate/authenticate_screen.dart';
import 'package:fta/david/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class SplashScreenWrapper extends StatelessWidget {
  const SplashScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) {
      return const AuthenticateScreen();
    } else {
      return HomeScreen();
    }
  }
}
