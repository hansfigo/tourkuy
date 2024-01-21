import 'package:flutter/material.dart';
import 'package:tourkuy/common_widgets/bottom_navigation.dart';
import 'package:tourkuy/pages/login_page/page.dart';
import 'package:tourkuy/pages/profile_page/widgets/outlined_button.dart';
import 'package:tourkuy/pages/register_page/page.dart';
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
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 200,
                    color: AppStyles.primaryColor,
                  ),
                  Padding(
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
                ],
              ),
              const Positioned(
                left: 80,
                top: 150, // Sesuaikan nilai top sesuai kebutuhan
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/564x/11/8a/2c/118a2c9d4fb6f9837c0a2cd42c3a5d7c.jpg'),
                  minRadius: 90,
                ),
              ),
            ],
          ),
          bottomNavigationBar: const MyBottomNavigation());
    }
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0 * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Daftar untuk mulai planning trip anda.",
                style: AppStyles.headingStyle,
              ),
              const SizedBox(
                height: 18,
              ),
              MyOutlineButton(
                text: "Daftar Akun",
                onPressed: () => goTo(context, const RegisterPage()),
              ),
              const SizedBox(
                height: 10,
              ),
              MyOutlineButton(
                text: "Masuk Akun",
                onPressed: () => goTo(context, const LoginPage()),
              )
            ],
          ),
        ),
        bottomNavigationBar: const MyBottomNavigation());
  }
}
