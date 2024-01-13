import 'package:flutter/material.dart';
import 'package:tourkuy/common_widgets/bottom_navigation.dart';
import 'package:tourkuy/utils/auth.dart';
import 'package:tourkuy/utils/firebase/firebase.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    if (Auth.isUserSignIn()) {
      return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0 * 2),
            child: Text(auth.currentUser!.displayName!),
          ),
          bottomNavigationBar: const MyBottomNavigation());
    }
    return const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0 * 2),
          child: Text("Profile"),
        ),
        bottomNavigationBar: MyBottomNavigation());
  }
}
