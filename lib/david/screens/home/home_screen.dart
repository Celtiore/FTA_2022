import 'package:flutter/material.dart';
import 'package:fta/david/common/loading.dart';
import 'package:fta/david/models/user.dart';
import 'package:fta/david/screens/home/user_list.dart';
import 'package:fta/david/services/authentication.dart';
import 'package:fta/david/services/notification_service.dart';
import 'package:provider/provider.dart';

import '../../services/database.dart';

class HomeScreen extends StatelessWidget {
  final AuthenticationService _auth = AuthenticationService();

   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationService.initialize();
    final user = Provider.of<AppUser?>(context);
    if (user == null) throw Exception("user not found");
    final database = DatabaseService(user.uid);
    return StreamProvider<List<AppUserData>>.value(
      initialData: const [],
      value: database.users,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0.0,
          title: const Text('Water Social'),
          actions: <Widget>[
            StreamBuilder<AppUserData>(
              stream: database.user,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  AppUserData? userData = snapshot.data;
                  if (userData == null) return const Loading();
                  return TextButton.icon(
                    icon: const Icon(
                      Icons.wine_bar,
                      color: Colors.white,
                    ),
                    label: const Text('drink', style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      await database.saveUser(
                          userData.name, userData.waterCounter + 1);
                    },
                  );
                } else {
                  return const Loading();
                }
              },
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: const Text('logout', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: const UserList(),
      ),
    );
  }
}
