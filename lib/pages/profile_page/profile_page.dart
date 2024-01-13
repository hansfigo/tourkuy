import 'package:flutter/material.dart';
import 'package:tourkuy/common_widgets/bottom_navigation.dart';
import 'package:tourkuy/pages/login_page/login_page.dart';
import 'package:tourkuy/styles/style.dart';
import 'package:tourkuy/utils/auth.dart';
import 'package:tourkuy/utils/firebase/firebase.dart';
import 'package:tourkuy/utils/goto.dart';

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
            child: Column(
              children: [
                Text(auth.currentUser!.displayName!),
                GestureDetector(
                    onTap: () {
                      Auth.signOut();
                      goTo(context, const ProfilePage());
                    },
                    child: const Text(
                      "SignOut",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ),
          ),
          bottomNavigationBar: const MyBottomNavigation());
    }
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0 * 2),
          child: Column(
            children: [
              Text("Profile"),
              GestureDetector(
                  onTap: () => goTo(context, const LoginPage()),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: AppStyles.primaryColor),
                  )),
            ],
          ),
        ),
        bottomNavigationBar: const MyBottomNavigation());
  }
}
